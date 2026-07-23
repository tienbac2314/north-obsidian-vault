[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$checker = Join-Path $PSScriptRoot 'check-markdown-links.ps1'
if (-not (Test-Path -LiteralPath $checker)) {
    throw "Markdown link checker is missing: $checker"
}

function Invoke-Git {
    param(
        [Parameter(Mandatory)] [string]$WorkingDirectory,
        [Parameter(Mandatory)] [string[]]$Arguments
    )

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& git -C $WorkingDirectory @Arguments 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }
    if ($exitCode -ne 0) {
        throw "git $($Arguments -join ' ') failed:`n$($output -join "`n")"
    }
}

function Invoke-Checker {
    param([Parameter(Mandatory)] [string]$Path)

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& powershell -NoProfile -File (Join-Path $Path 'scripts/check-markdown-links.ps1') 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }
    return [pscustomobject]@{
        ExitCode = $exitCode
        Output = ($output -join "`n")
    }
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("markdown-link-test-" + [Guid]::NewGuid().ToString('N'))
$repo = Join-Path $tempRoot 'repo'
New-Item -ItemType Directory -Path (Join-Path $repo 'scripts') -Force | Out-Null

try {
    Copy-Item -LiteralPath $checker -Destination (Join-Path $repo 'scripts/check-markdown-links.ps1')
    $fence = ([string][char]96) * 3
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    Invoke-Git -WorkingDirectory $repo -Arguments @('init', '-b', 'main')
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $fencedResult = Invoke-Checker -Path $repo
    if ($fencedResult.ExitCode -ne 0) {
        throw "Checker treated a fenced example as navigation:`n$($fencedResult.Output)"
    }

    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n[Broken](missing.md)`n`n${fence}markdown`n[Ignored](ignored.md)`n$fence`n"
    )
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'README.md')

    $brokenResult = Invoke-Checker -Path $repo
    if ($brokenResult.ExitCode -eq 0) {
        throw 'Checker accepted an ordinary broken local Markdown link.'
    }
    if ($brokenResult.Output -notmatch [regex]::Escape('Broken local link: README.md:3 -> missing.md')) {
        throw "Checker did not report ordinary broken link:`n$($brokenResult.Output)"
    }

    [IO.File]::WriteAllText((Join-Path $repo 'untracked.md'), "# Untracked`n")
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n[Untracked](untracked.md)`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'README.md')

    $untrackedResult = Invoke-Checker -Path $repo
    if ($untrackedResult.ExitCode -eq 0) {
        throw 'Checker accepted link to untracked Markdown target.'
    }
    if ($untrackedResult.Output -notmatch [regex]::Escape('untracked.md (Markdown target is not tracked)')) {
        throw "Checker did not identify untracked Markdown target:`n$($untrackedResult.Output)"
    }

    Remove-Item -LiteralPath (Join-Path $repo 'untracked.md')
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'README.md')

    [IO.File]::WriteAllText((Join-Path $repo 'orphan.md'), "# Orphan`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $orphanResult = Invoke-Checker -Path $repo
    if ($orphanResult.ExitCode -eq 0) {
        throw 'Checker accepted an unlinked tracked Markdown file.'
    }
    if ($orphanResult.Output -notmatch [regex]::Escape('Unreachable Markdown file: orphan.md')) {
        throw "Checker did not name orphan.md:`n$($orphanResult.Output)"
    }

    New-Item -ItemType Directory -Path (Join-Path $repo 'docs') | Out-Null
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n[Catalog](docs/catalog.md)`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    [IO.File]::WriteAllText((Join-Path $repo 'docs/catalog.md'), "# Catalog`n`n[Orphan](../orphan.md)`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $linkedResult = Invoke-Checker -Path $repo
    if ($linkedResult.ExitCode -ne 0) {
        throw "Checker rejected transitively linked Markdown files:`n$($linkedResult.Output)"
    }

    Write-Host 'Markdown link checker tests passed.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
