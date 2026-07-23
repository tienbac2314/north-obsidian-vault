[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$templateRoot = (Resolve-Path (Join-Path $repoRoot 'vault-template')).Path
$destinationRoot = [IO.Path]::GetFullPath($Destination)
$templateBoundary = $templateRoot.TrimEnd('\') + '\'
$destinationBoundary = $destinationRoot.TrimEnd('\') + '\'

function Assert-NoReparsePoint {
    param([Parameter(Mandatory)] [string]$Path)

    $candidate = [IO.Path]::GetFullPath($Path)
    while (-not [string]::IsNullOrWhiteSpace($candidate)) {
        if (Test-Path -LiteralPath $candidate) {
            $item = Get-Item -LiteralPath $candidate -Force
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                throw "Destination path must not contain a reparse point: $candidate"
            }
        }

        $parent = Split-Path $candidate -Parent
        if ([string]::IsNullOrWhiteSpace($parent) -or $parent -eq $candidate) {
            break
        }
        $candidate = $parent
    }
}

if ($destinationRoot.TrimEnd('\') -ieq $templateRoot.TrimEnd('\')) {
    throw 'Destination must not be repository vault-template source.'
}
if ($destinationBoundary.StartsWith($templateBoundary, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Destination must not be inside repository vault-template source.'
}
if ($templateBoundary.StartsWith($destinationBoundary, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Destination must not contain repository vault-template source.'
}
if ((Test-Path -LiteralPath $destinationRoot) -and -not (Test-Path -LiteralPath $destinationRoot -PathType Container)) {
    throw 'Destination exists but is not a directory.'
}
Assert-NoReparsePoint -Path $destinationRoot

$requiredDirectories = @(
    'HUB',
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
    'SYSTEM/Guides',
    'SYSTEM/Templates',
    'SYSTEM/Media'
)

$starterFiles = @(
    'HUB/Home.md',
    'SYSTEM/Guides/vault-operating-guide.md',
    'SYSTEM/Templates/Daily.md',
    'SYSTEM/Templates/Weekly.md',
    'SYSTEM/Templates/Literature Note.md',
    'SYSTEM/Templates/Permanent Note.md'
)

$createdDirectories = 0
$copiedFiles = 0
$preservedFiles = 0

if (-not (Test-Path -LiteralPath $destinationRoot)) {
    New-Item -ItemType Directory -Path $destinationRoot -Force | Out-Null
}
Assert-NoReparsePoint -Path $destinationRoot

foreach ($relativePath in $requiredDirectories) {
    $target = Join-Path $destinationRoot $relativePath
    Assert-NoReparsePoint -Path $target
    if (-not (Test-Path -LiteralPath $target -PathType Container)) {
        New-Item -ItemType Directory -Path $target -Force | Out-Null
        $createdDirectories++
    }
    Assert-NoReparsePoint -Path $target
}

foreach ($relativePath in $starterFiles) {
    $sourceFile = Join-Path $templateRoot $relativePath
    if (-not (Test-Path -LiteralPath $sourceFile -PathType Leaf)) {
        throw "Starter file is missing from repository template: $relativePath"
    }
    $targetFile = Join-Path $destinationRoot $relativePath
    Assert-NoReparsePoint -Path $targetFile

    if (Test-Path -LiteralPath $targetFile) {
        if (-not (Test-Path -LiteralPath $targetFile -PathType Leaf)) {
            throw "Starter-file target exists but is not a file: $relativePath"
        }
        $preservedFiles++
        continue
    }

    $targetDirectory = Split-Path $targetFile -Parent
    if (-not (Test-Path -LiteralPath $targetDirectory -PathType Container)) {
        New-Item -ItemType Directory -Path $targetDirectory -Force | Out-Null
        $createdDirectories++
    }
    Assert-NoReparsePoint -Path $targetDirectory

    Copy-Item -LiteralPath $sourceFile -Destination $targetFile
    $copiedFiles++
}

Write-Host "Vault initialized: $createdDirectories directories created; $copiedFiles starter files copied; $preservedFiles existing files preserved."
