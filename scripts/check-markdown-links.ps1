[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$markdownFiles = @(& git -C $repoRoot ls-files '*.md')
if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked Markdown files.' }

$failures = [System.Collections.Generic.List[string]]::new()
$checked = 0

foreach ($relativeFile in $markdownFiles) {
    $fullFile = Join-Path $repoRoot $relativeFile
    $content = [IO.File]::ReadAllText($fullFile)
    $matches = [regex]::Matches($content, '(?<!\!)\[[^\]]+\]\((?<target>[^)]+)\)')

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
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error "Broken local link: $_" }
    exit 1
}

Write-Host "Markdown link check passed: $checked local links across $($markdownFiles.Count) files."
