param(
    [string]$ScriptPath = 'G:\Cua Bac\North\SYSTEM\TEMPLATE\CODE\north_context_menu.js'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $ScriptPath -PathType Leaf)) {
    throw "North context-menu script not found: $ScriptPath"
}

$source = Get-Content -LiteralPath $ScriptPath -Raw
$required = @(
    'registerFileMenu',
    'registerFolderMenu',
    'Notebook Navigator',
    'North: New project',
    'North: New area',
    'North: Add note to this project',
    'North: Add note to this area',
    'North: Open today'
)

$missing = @($required | Where-Object { $source.IndexOf($_, [System.StringComparison]::Ordinal) -lt 0 })
if ($missing.Count -gt 0) {
    throw "North NN menu contract missing: $($missing -join ', ')"
}

Write-Output "PASS: North context-menu script exposes NN file/folder menu routes."
