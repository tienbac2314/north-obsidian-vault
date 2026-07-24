[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$initializer = Join-Path $PSScriptRoot 'initialize-vault-template.ps1'

if (-not (Test-Path -LiteralPath $initializer)) {
    throw "Vault initializer is missing: $initializer"
}

function Invoke-Initializer {
    param([Parameter(Mandatory)] [string]$Destination)

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(
            & powershell -NoProfile -File $initializer -Destination $Destination 2>&1
        )
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($exitCode -ne 0) {
        throw "Vault initializer failed:`n$($output -join "`n")"
    }
}

$requiredDirectories = @(
    'HUB',
    'HUB/Bases',
    'STAGING/Unsorted',
    'STAGING/Pending Agent Review',
    'STAGING/Agent Proposals',
    'STAGING/Reviewed',
    'PARA/Projects',
    'PARA/Areas',
    'PARA/Resources',
    'PARA/Archive',
    'PARA/WORKSTATION',
    'ZETA/Literature',
    'ZETA/Permanent',
    'DAILY/Daily',
    'DAILY/Weekly',
    'DAILY/Monthly',
    'SYSTEM/Components',
    'SYSTEM/Guides',
    'SYSTEM/Config',
    'SYSTEM/Core Hub',
    'SYSTEM/Mobile Hub',
    'SYSTEM/Templates',
    'SYSTEM/Media'
)

$requiredFiles = @(
    'HUB/Home.md',
    'HUB/Mail Box.md',
    'HUB/Map of Content.md',
    'HUB/Priority Matrix.md',
    'HUB/Bases/Areas.base',
    'HUB/Bases/Learning.base',
    'HUB/Bases/Projects.base',
    'HUB/Bases/Review Queue.base',
    'SYSTEM/Config/dashboard.css',
    'SYSTEM/Config/sortspec.md',
    'SYSTEM/Core Hub/Home Core.md',
    'SYSTEM/Core Hub/Mail Box Core.md',
    'SYSTEM/Core Hub/Map of Content Core.md',
    'SYSTEM/Core Hub/Priority Matrix Core.md',
    'SYSTEM/Guides/vault-operating-guide.md',
    'SYSTEM/Mobile Hub/Mobile Home.md',
    'SYSTEM/Mobile Hub/Mobile Mail Box.md',
    'SYSTEM/Mobile Hub/Mobile Map of Content.md',
    'SYSTEM/Templates/Daily.md',
    'SYSTEM/Templates/Area.md',
    'SYSTEM/Templates/Weekly.md',
    'SYSTEM/Templates/Literature Note.md',
    'SYSTEM/Templates/Permanent Note.md',
    'SYSTEM/Templates/Project.md',
    'SYSTEM/Templates/Unsorted.md',
    'SYSTEM/Templates/Meeting.md'
)

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("vault-template-test-" + [Guid]::NewGuid().ToString('N'))
$vault = Join-Path $tempRoot 'vault'

try {
    Invoke-Initializer -Destination $vault

    foreach ($relativePath in $requiredDirectories) {
        $path = Join-Path $vault $relativePath
        if (-not (Test-Path -LiteralPath $path -PathType Container)) {
            throw "Initializer did not create directory: $relativePath"
        }
    }

    foreach ($relativePath in $requiredFiles) {
        $path = Join-Path $vault $relativePath
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            throw "Initializer did not copy starter file: $relativePath"
        }
    }

    $homeContent = [IO.File]::ReadAllText((Join-Path $vault 'HUB/Home.md'))
    if ($homeContent -match '(?m)^```(?:dataviewjs|datacorejsx|tasks|meta-bind-button)' -or
        $homeContent -match '(?m)^`````tabs' -or
        $homeContent -match 'BUTTON\[') {
        throw 'Portable Home depends on executable community-plugin blocks.'
    }
    foreach ($baseName in @('Areas', 'Learning', 'Projects', 'Review Queue')) {
        if ($homeContent -notmatch [regex]::Escape("![[HUB/Bases/$baseName.base")) {
            throw "Home does not embed required core Base: $baseName"
        }
    }

    $coreHomeContent = [IO.File]::ReadAllText((Join-Path $vault 'SYSTEM/Core Hub/Home Core.md'))
    if ($coreHomeContent -match '(?m)^```(?:dataviewjs|datacorejsx|tasks|meta-bind-button)' -or
        $coreHomeContent -match '(?m)^`````tabs' -or
        $coreHomeContent -match 'BUTTON\[') {
        throw 'Core rollback Home depends on executable community-plugin blocks.'
    }
    foreach ($coreSurface in @('Map of Content Core', 'Mail Box Core', 'Priority Matrix Core')) {
        if ($coreHomeContent -notmatch [regex]::Escape("[[SYSTEM/Core Hub/$coreSurface")) {
            throw "Core rollback Home does not link required surface: $coreSurface"
        }
    }

    $sortspec = [IO.File]::ReadAllText((Join-Path $vault 'SYSTEM/Config/sortspec.md'))
    if ($sortspec -notmatch 'target-folder:\s*/') {
        throw 'Root sort specification does not target vault root.'
    }
    foreach ($folder in @('HUB', 'STAGING', 'DAILY', 'PARA', 'ZETA', 'Notion', 'SYSTEM')) {
        if ($sortspec -notmatch "(?m)^\s+$([regex]::Escape($folder))\s*$") {
            throw "Root sort specification omits top-level folder: $folder"
        }
    }

    foreach ($templateName in @('Area', 'Daily', 'Weekly', 'Literature Note', 'Permanent Note', 'Project', 'Meeting')) {
        $template = [IO.File]::ReadAllText((Join-Path $vault "SYSTEM/Templates/$templateName.md"))
        if ($template -notmatch '(?m)^type:\s*\S+') {
            throw "Template lacks type property: $templateName"
        }
        if ($template -notmatch '(?m)^created:\s*') {
            throw "Template lacks created property: $templateName"
        }
    }

    $preservedContent = @{}
    foreach ($relativePath in $requiredFiles) {
        $sentinel = "# Existing $relativePath`n"
        $preservedContent[$relativePath] = $sentinel
        [IO.File]::WriteAllText((Join-Path $vault $relativePath), $sentinel)
    }

    Invoke-Initializer -Destination $vault

    foreach ($relativePath in $requiredFiles) {
        if ([IO.File]::ReadAllText((Join-Path $vault $relativePath)) -ne $preservedContent[$relativePath]) {
            throw "Initializer overwrote existing starter file on repeat run: $relativePath"
        }
    }

    $wrongTypeVault = Join-Path $tempRoot 'wrong-type-vault'
    New-Item -ItemType Directory -Path (Join-Path $wrongTypeVault 'HUB/Home.md') -Force | Out-Null

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $wrongTypeOutput = @(
            & powershell -NoProfile -File $initializer -Destination $wrongTypeVault 2>&1
        )
        $wrongTypeExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($wrongTypeExitCode -eq 0) {
        throw 'Initializer accepted directory at starter-file path.'
    }
    if (($wrongTypeOutput -join "`n") -notmatch 'Starter-file target exists but is not a file: HUB.Home.md') {
        throw "Initializer returned wrong starter-file collision failure:`n$($wrongTypeOutput -join "`n")"
    }

    $fixtureRoot = Join-Path $tempRoot 'self-copy-fixture'
    $fixtureScripts = Join-Path $fixtureRoot 'scripts'
    $fixtureTemplate = Join-Path $fixtureRoot 'vault-template'
    New-Item -ItemType Directory -Path $fixtureScripts -Force | Out-Null
    Copy-Item -LiteralPath $initializer -Destination (Join-Path $fixtureScripts 'initialize-vault-template.ps1')
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot '../vault-template') -Destination $fixtureTemplate -Recurse

    foreach ($containmentCase in @(
        [pscustomobject]@{
            Name = 'exact source'
            Destination = $fixtureTemplate
            Expected = 'Destination must not be repository vault-template source'
        },
        [pscustomobject]@{
            Name = 'inside source'
            Destination = (Join-Path $fixtureTemplate 'nested-target')
            Expected = 'Destination must not be inside repository vault-template source'
        }
    )) {
        $previousPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        try {
            $containmentOutput = @(
                & powershell -NoProfile -File (Join-Path $fixtureScripts 'initialize-vault-template.ps1') -Destination $containmentCase.Destination 2>&1
            )
            $containmentExitCode = $LASTEXITCODE
        }
        finally {
            $ErrorActionPreference = $previousPreference
        }

        if ($containmentExitCode -eq 0) {
            throw "Initializer accepted $($containmentCase.Name) destination."
        }
        if (($containmentOutput -join "`n") -notmatch [regex]::Escape($containmentCase.Expected)) {
            throw "Initializer returned wrong $($containmentCase.Name) failure:`n$($containmentOutput -join "`n")"
        }
    }

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $selfCopyOutput = @(
            & powershell -NoProfile -File (Join-Path $fixtureScripts 'initialize-vault-template.ps1') -Destination $fixtureRoot 2>&1
        )
        $selfCopyExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($selfCopyExitCode -eq 0) {
        throw 'Initializer accepted destination containing its own template source.'
    }
    if (($selfCopyOutput -join "`n") -notmatch 'Destination must not contain repository vault-template source') {
        throw "Initializer returned wrong self-copy failure:`n$($selfCopyOutput -join "`n")"
    }

    [IO.File]::WriteAllText((Join-Path $fixtureTemplate 'unlisted.txt'), "not a starter file`n")
    $manifestVault = Join-Path $tempRoot 'manifest-vault'

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $manifestOutput = @(
            & powershell -NoProfile -File (Join-Path $fixtureScripts 'initialize-vault-template.ps1') -Destination $manifestVault 2>&1
        )
        $manifestExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($manifestExitCode -ne 0) {
        throw "Initializer failed explicit-manifest fixture:`n$($manifestOutput -join "`n")"
    }
    if (Test-Path -LiteralPath (Join-Path $manifestVault 'unlisted.txt')) {
        throw 'Initializer copied file outside explicit starter manifest.'
    }

    $junctionPath = Join-Path $fixtureRoot 'junction-to-template'
    New-Item -ItemType Junction -Path $junctionPath -Target $fixtureTemplate | Out-Null

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $junctionOutput = @(
            & powershell -NoProfile -File (Join-Path $fixtureScripts 'initialize-vault-template.ps1') -Destination $junctionPath 2>&1
        )
        $junctionExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($junctionExitCode -eq 0) {
        throw 'Initializer accepted reparse-point destination.'
    }
    if (($junctionOutput -join "`n") -notmatch 'Destination path must not contain a reparse point') {
        throw "Initializer returned wrong reparse-point failure:`n$($junctionOutput -join "`n")"
    }

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $parentJunctionOutput = @(
            & powershell -NoProfile -File (Join-Path $fixtureScripts 'initialize-vault-template.ps1') -Destination (Join-Path $junctionPath 'nested-target') 2>&1
        )
        $parentJunctionExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    if ($parentJunctionExitCode -eq 0) {
        throw 'Initializer accepted destination below reparse-point parent.'
    }
    if (($parentJunctionOutput -join "`n") -notmatch 'Destination path must not contain a reparse point') {
        throw "Initializer returned wrong parent reparse-point failure:`n$($parentJunctionOutput -join "`n")"
    }

    Write-Host 'Vault template initializer tests passed.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
