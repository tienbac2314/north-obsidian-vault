[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$markdownFiles = @(& git -C $repoRoot ls-files '*.md')
if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked Markdown files.' }

function Get-LinkScanContent {
    param([Parameter(Mandatory)] [string]$Content)

    $insideFence = $false
    $fenceMarker = ''
    $fenceLength = 0
    $result = [Text.StringBuilder]::new($Content.Length)

    foreach ($line in [regex]::Split($Content, '(?<=\n)')) {
        $lineBody = $line.TrimEnd([char[]]"`r`n")
        if (-not $insideFence) {
            $opening = [regex]::Match($lineBody, '^ {0,3}(?<fence>`{3,}|~{3,})')
            if (-not $opening.Success) {
                [void]$result.Append($line)
                continue
            }

            $insideFence = $true
            $fenceMarker = $opening.Groups['fence'].Value.Substring(0, 1)
            $fenceLength = $opening.Groups['fence'].Value.Length
        }
        else {
            $closingPattern = '^ {0,3}' + [regex]::Escape($fenceMarker) + '{' + $fenceLength + ',}[ \t]*$'
            if ($lineBody -match $closingPattern) {
                $insideFence = $false
            }
        }

        [void]$result.Append([regex]::Replace($line, '[^\r\n]', ' '))
    }

    return $result.ToString()
}

$trackedByPath = @{}
$linksByFile = @{}
foreach ($relativeFile in $markdownFiles) {
    $normalized = $relativeFile.Replace('\', '/')
    $fullPath = [IO.Path]::GetFullPath((Join-Path $repoRoot $relativeFile))
    $trackedByPath[$fullPath] = $normalized
    $linksByFile[$normalized] = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
}

$failures = [System.Collections.Generic.List[string]]::new()
$checked = 0

foreach ($relativeFile in $markdownFiles) {
    $normalized = $relativeFile.Replace('\', '/')
    $fullFile = Join-Path $repoRoot $relativeFile
    $content = [IO.File]::ReadAllText($fullFile)
    $scanContent = Get-LinkScanContent -Content $content
    $matches = [regex]::Matches($scanContent, '(?<!\!)\[[^\]]+\]\((?<target>[^)]+)\)')

    foreach ($match in $matches) {
        $target = $match.Groups['target'].Value.Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }
        if ($target -match '^(?:https?://|mailto:|#)') { continue }

        $pathPart = ($target -split '#', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathPart)) { continue }

        $checked++
        $decoded = [Uri]::UnescapeDataString($pathPart)
        $candidate = Join-Path (Split-Path $fullFile -Parent) $decoded
        if (-not (Test-Path -LiteralPath $candidate)) {
            $line = ($content.Substring(0, $match.Index) -split "`n").Count
            $failures.Add("$relativeFile`:$line -> $pathPart")
            continue
        }

        $resolvedTarget = [IO.Path]::GetFullPath($candidate)
        if ([IO.Path]::GetExtension($resolvedTarget) -ieq '.md') {
            if (-not $trackedByPath.ContainsKey($resolvedTarget)) {
                $line = ($content.Substring(0, $match.Index) -split "`n").Count
                $failures.Add("$relativeFile`:$line -> $pathPart (Markdown target is not tracked)")
                continue
            }
            [void]$linksByFile[$normalized].Add($trackedByPath[$resolvedTarget])
        }
    }
}

$entrypoint = 'README.md'
$reachable = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$queue = [Collections.Generic.Queue[string]]::new()
$missingEntrypoint = -not $linksByFile.ContainsKey($entrypoint)
if (-not $missingEntrypoint) {
    [void]$reachable.Add($entrypoint)
    $queue.Enqueue($entrypoint)
}

while ($queue.Count -gt 0) {
    $source = $queue.Dequeue()
    foreach ($targetFile in $linksByFile[$source]) {
        if ($reachable.Add($targetFile)) {
            $queue.Enqueue($targetFile)
        }
    }
}

$unreachable = @($linksByFile.Keys | Where-Object { -not $reachable.Contains($_) } | Sort-Object)
foreach ($failure in $failures) {
    Write-Error "Broken local link: $failure" -ErrorAction Continue
}
if ($missingEntrypoint) {
    Write-Error "Missing Markdown entrypoint: $entrypoint" -ErrorAction Continue
}
foreach ($orphan in $unreachable) {
    Write-Error "Unreachable Markdown file: $orphan" -ErrorAction Continue
}

if ($failures.Count -gt 0 -or $missingEntrypoint -or $unreachable.Count -gt 0) {
    exit 1
}

Write-Host "Markdown link check passed: $checked local links; all $($markdownFiles.Count) files reachable from $entrypoint."
