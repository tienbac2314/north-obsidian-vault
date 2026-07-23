[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$publisher = Join-Path $PSScriptRoot 'publish-feature-clean.ps1'
if (-not (Test-Path -LiteralPath $publisher)) {
    throw "Publisher script is missing: $publisher"
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
    return ($output -join "`n").Trim()
}

function Assert-Equal {
    param(
        [Parameter(Mandatory)] [string]$Expected,
        [Parameter(Mandatory)] [string]$Actual,
        [Parameter(Mandatory)] [string]$Message
    )

    if ($Expected -cne $Actual) {
        throw "$Message`nExpected: $Expected`nActual:   $Actual"
    }
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("feature-branch-test-" + [Guid]::NewGuid().ToString('N'))
$remote = Join-Path $tempRoot 'remote.git'
$repo = Join-Path $tempRoot 'work'
$upstream = Join-Path $tempRoot 'upstream'

New-Item -ItemType Directory -Path $tempRoot | Out-Null

try {
    Invoke-Git -WorkingDirectory $tempRoot -Arguments @('init', '--bare', $remote) | Out-Null
    Invoke-Git -WorkingDirectory $tempRoot -Arguments @('init', '-b', 'main', $repo) | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('config', 'user.name', 'Workflow Test') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('config', 'user.email', 'workflow@example.invalid') | Out-Null

    $repoScripts = Join-Path $repo 'scripts'
    $publisherCopy = Join-Path $repoScripts 'publish-feature-clean.ps1'
    New-Item -ItemType Directory -Path $repoScripts | Out-Null
    Copy-Item -LiteralPath $publisher -Destination $publisherCopy
    [IO.File]::WriteAllText((Join-Path $repo 'README.md'), "base`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'README.md', 'scripts/publish-feature-clean.ps1') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('commit', '-m', 'chore: initialize test') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('remote', 'add', 'origin', $remote) | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('push', '-u', 'origin', 'main') | Out-Null

    Invoke-Git -WorkingDirectory $repo -Arguments @('switch', '-c', 'feature-clean') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('push', '-u', 'origin', 'feature-clean') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('switch', '-c', 'feature-dev') | Out-Null

    [IO.File]::WriteAllText((Join-Path $repo 'one.md'), "one`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'one.md') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('commit', '-m', 'docs: add first detail') | Out-Null
    [IO.File]::WriteAllText((Join-Path $repo 'two.md'), "two`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', 'two.md') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('commit', '-m', 'docs: add second detail') | Out-Null
    Invoke-Git -WorkingDirectory $repo -Arguments @('push', '-u', 'origin', 'feature-dev') | Out-Null

    $devBefore = Invoke-Git -WorkingDirectory $repo -Arguments @('rev-parse', 'feature-dev')
    $publishOutput = @(& powershell -NoProfile -File $publisherCopy -DevBranch 'feature-dev' -CleanBranch 'feature-clean' -BaseBranch 'main' -Remote 'origin' -Message 'docs: publish clean snapshot' 2>&1)
    if ($LASTEXITCODE -ne 0) {
        throw "Publisher failed without explicit -Repository:`n$($publishOutput -join "`n")"
    }

    $remoteDev = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-dev')
    $remoteClean = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-clean')
    $remoteMain = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/main')
    $cleanParent = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-clean^')
    $cleanTree = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-clean^{tree}')
    $devTree = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-dev^{tree}')
    $cleanCount = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-list', '--count', 'refs/heads/feature-clean', '^refs/heads/main')
    $devCount = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-list', '--count', 'refs/heads/feature-dev', '^refs/heads/main')
    $currentBranch = Invoke-Git -WorkingDirectory $repo -Arguments @('branch', '--show-current')

    Assert-Equal -Expected $devBefore -Actual $remoteDev -Message 'Detailed dev history was not preserved remotely.'
    Assert-Equal -Expected $remoteMain -Actual $cleanParent -Message 'Clean commit does not use remote main as parent.'
    Assert-Equal -Expected $devTree -Actual $cleanTree -Message 'Clean branch tree differs from dev branch tree.'
    Assert-Equal -Expected '1' -Actual $cleanCount -Message 'Clean branch must contain one commit over main.'
    Assert-Equal -Expected '2' -Actual $devCount -Message 'Dev branch must retain both detailed commits.'
    Assert-Equal -Expected 'feature-dev' -Actual $currentBranch -Message 'Publisher must leave worktree on dev branch.'

    Invoke-Git -WorkingDirectory $tempRoot -Arguments @('clone', $remote, $upstream) | Out-Null
    Invoke-Git -WorkingDirectory $upstream -Arguments @('config', 'user.name', 'Workflow Test') | Out-Null
    Invoke-Git -WorkingDirectory $upstream -Arguments @('config', 'user.email', 'workflow@example.invalid') | Out-Null
    Invoke-Git -WorkingDirectory $upstream -Arguments @('switch', 'main') | Out-Null
    [IO.File]::WriteAllText((Join-Path $upstream 'upstream.md'), "upstream`n")
    Invoke-Git -WorkingDirectory $upstream -Arguments @('add', 'upstream.md') | Out-Null
    Invoke-Git -WorkingDirectory $upstream -Arguments @('commit', '-m', 'docs: advance main') | Out-Null
    Invoke-Git -WorkingDirectory $upstream -Arguments @('push', 'origin', 'main') | Out-Null

    $rejected = $false
    try {
        & $publisher -Repository $repo -DevBranch 'feature-dev' -CleanBranch 'feature-clean' -BaseBranch 'main' -Remote 'origin' -Message 'docs: stale publish'
    }
    catch {
        $rejected = $_.Exception.Message -like '*Base branch contains changes missing from dev*'
    }
    if (-not $rejected) {
        throw 'Publisher did not reject dev branch missing new base changes.'
    }

    $cleanAfterRejection = Invoke-Git -WorkingDirectory $remote -Arguments @('rev-parse', 'refs/heads/feature-clean')
    Assert-Equal -Expected $remoteClean -Actual $cleanAfterRejection -Message 'Rejected publish changed remote clean branch.'

    Write-Host 'Feature branch workflow tests passed.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
