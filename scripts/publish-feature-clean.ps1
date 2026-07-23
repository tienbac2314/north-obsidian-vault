[CmdletBinding()]
param(
    [string]$Repository,
    [string]$DevBranch = 'research/full-system-design-dev',
    [string]$CleanBranch = 'research/full-system-design',
    [string]$BaseBranch = 'main',
    [string]$Remote = 'origin',
    [Parameter(Mandatory)] [ValidateNotNullOrEmpty()] [string]$Message
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($Repository)) {
    $Repository = Join-Path $PSScriptRoot '..'
}
$Repository = (Resolve-Path -LiteralPath $Repository).Path

function Invoke-Git {
    param([Parameter(Mandatory)] [string[]]$Arguments)

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& git -C $Repository @Arguments 2>&1)
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

function Test-GitRef {
    param([Parameter(Mandatory)] [string]$Ref)

    & git -C $Repository show-ref --verify --quiet $Ref
    return $LASTEXITCODE -eq 0
}

foreach ($branch in @($DevBranch, $CleanBranch, $BaseBranch)) {
    & git -C $Repository check-ref-format --branch $branch *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "Invalid branch name: $branch"
    }
}
Invoke-Git -Arguments @('remote', 'get-url', $Remote) | Out-Null

$currentBranch = Invoke-Git -Arguments @('branch', '--show-current')
if ($currentBranch -cne $DevBranch) {
    throw "Run publisher from $DevBranch, not $currentBranch."
}

$status = Invoke-Git -Arguments @('status', '--porcelain')
if (-not [string]::IsNullOrWhiteSpace($status)) {
    throw 'Worktree must be clean before publishing.'
}

Invoke-Git -Arguments @('fetch', $Remote) | Out-Null

$localDevRef = "refs/heads/$DevBranch"
$baseRef = "refs/remotes/$Remote/$BaseBranch"
$remoteCleanRef = "refs/remotes/$Remote/$CleanBranch"
if (-not (Test-GitRef -Ref $localDevRef)) {
    throw "Local dev branch is missing: $DevBranch"
}
if (-not (Test-GitRef -Ref $baseRef)) {
    throw "Remote base branch is missing: $Remote/$BaseBranch"
}

# Preserve every detailed commit remotely before creating or rewriting clean history.
Invoke-Git -Arguments @('push', $Remote, "${DevBranch}:refs/heads/${DevBranch}") | Out-Null
$localDev = Invoke-Git -Arguments @('rev-parse', $DevBranch)
$remoteDevLine = Invoke-Git -Arguments @('ls-remote', '--heads', $Remote, "refs/heads/$DevBranch")
$remoteDev = ($remoteDevLine -split '\s+')[0]
if ($remoteDev -cne $localDev) {
    throw 'Remote dev branch does not match local dev branch after push.'
}

$mergeBase = Invoke-Git -Arguments @('merge-base', $baseRef, $DevBranch)
& git -C $Repository merge-base --is-ancestor $baseRef $DevBranch *> $null
$devContainsBase = $LASTEXITCODE -eq 0
if (-not $devContainsBase) {
    & git -C $Repository diff --quiet $mergeBase $baseRef --
    $baseDiffExit = $LASTEXITCODE
    if ($baseDiffExit -eq 1) {
        throw "Base branch contains changes missing from dev. Merge $Remote/$BaseBranch into $DevBranch first; do not rewrite permanent dev history."
    }
    if ($baseDiffExit -ne 0) {
        throw 'Unable to compare base branch with dev merge base.'
    }
}

$devTree = Invoke-Git -Arguments @('rev-parse', "$DevBranch`^{tree}")
$baseTree = Invoke-Git -Arguments @('rev-parse', "$baseRef`^{tree}")
if ($devTree -ceq $baseTree) {
    throw 'Dev branch has no file changes relative to remote base.'
}

$commitOutput = @($Message | & git -C $Repository commit-tree $devTree -p $baseRef 2>&1)
if ($LASTEXITCODE -ne 0) {
    throw "git commit-tree failed:`n$($commitOutput -join "`n")"
}
$cleanCommit = ($commitOutput | Select-Object -Last 1).Trim()

$expectedClean = ''
if (Test-GitRef -Ref $remoteCleanRef) {
    $expectedClean = Invoke-Git -Arguments @('rev-parse', $remoteCleanRef)
}
$lease = "--force-with-lease=refs/heads/${CleanBranch}:$expectedClean"
Invoke-Git -Arguments @('push', $lease, $Remote, "${cleanCommit}:refs/heads/${CleanBranch}") | Out-Null

if (Test-GitRef -Ref "refs/heads/$CleanBranch") {
    Invoke-Git -Arguments @('branch', '-f', $CleanBranch, $cleanCommit) | Out-Null
}
else {
    Invoke-Git -Arguments @('branch', $CleanBranch, $cleanCommit) | Out-Null
}
Invoke-Git -Arguments @('fetch', $Remote, "refs/heads/${CleanBranch}:refs/remotes/${Remote}/${CleanBranch}") | Out-Null

$remoteClean = Invoke-Git -Arguments @('rev-parse', $remoteCleanRef)
if ($remoteClean -cne $cleanCommit) {
    throw 'Remote clean branch does not match generated clean commit.'
}

Write-Host "Detailed history preserved: $Remote/$DevBranch at $localDev"
Write-Host "Clean history published: $Remote/$CleanBranch at $cleanCommit"
