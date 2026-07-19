[CmdletBinding()]
param(
    [string]$MermaidCli = $env:MERMAID_CLI,
    [string]$BrowserExecutable = $env:PUPPETEER_EXECUTABLE_PATH
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if ([string]::IsNullOrWhiteSpace($MermaidCli)) {
    $command = Get-Command mmdc -ErrorAction SilentlyContinue
    if ($command) { $MermaidCli = $command.Source }
}
if ([string]::IsNullOrWhiteSpace($MermaidCli) -or -not (Test-Path -LiteralPath $MermaidCli)) {
    throw 'Mermaid CLI not found. Set MERMAID_CLI or pass -MermaidCli with path to mmdc/mmdc.cmd.'
}
if (-not [string]::IsNullOrWhiteSpace($BrowserExecutable)) {
    if (-not (Test-Path -LiteralPath $BrowserExecutable)) { throw 'Configured browser executable does not exist.' }
    $env:PUPPETEER_EXECUTABLE_PATH = $BrowserExecutable
}

$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$workDir = Join-Path $tempRoot ("pkp-mermaid-" + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $workDir | Out-Null

try {
    $markdownFiles = @(& git -C $repoRoot ls-files '*.md')
    if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked Markdown files.' }

    $count = 0
    foreach ($relativeFile in $markdownFiles) {
        $content = [IO.File]::ReadAllText((Join-Path $repoRoot $relativeFile))
        $matches = [regex]::Matches($content, '(?ms)```mermaid\s*\r?\n(.*?)\r?\n```')
        for ($i = 0; $i -lt $matches.Count; $i++) {
            $count++
            $inputFile = Join-Path $workDir ("diagram-$count.mmd")
            $outputFile = Join-Path $workDir ("diagram-$count.svg")
            [IO.File]::WriteAllText($inputFile, $matches[$i].Groups[1].Value)
            & $MermaidCli -i $inputFile -o $outputFile -q
            if ($LASTEXITCODE -ne 0) {
                throw "Mermaid validation failed in $relativeFile block $($i + 1)."
            }
        }
    }

    if ($count -eq 0) { throw 'No Mermaid blocks found.' }
    Write-Host "Mermaid check passed: $count diagrams rendered."
}
finally {
    $resolvedWork = [IO.Path]::GetFullPath($workDir)
    if ($resolvedWork.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $resolvedWork)) {
        Remove-Item -LiteralPath $resolvedWork -Recurse -Force
    }
}

