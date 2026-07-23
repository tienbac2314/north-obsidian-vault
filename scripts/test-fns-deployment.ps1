[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$deployRoot = Join-Path $repoRoot "deploy\fns"
$composePath = Join-Path $deployRoot "compose.yaml"
$configPath = Join-Path $deployRoot "config\config.yaml.example"
$tunnelPath = Join-Path $deployRoot "cloudflared\config.yml.example"
$runbookPath = Join-Path $deployRoot "README.md"

function Assert-True {
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Condition,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    if (-not $Condition) {
        throw $Message
    }
}

foreach ($requiredPath in @($composePath, $configPath, $tunnelPath, $runbookPath)) {
    Assert-True (Test-Path -LiteralPath $requiredPath -PathType Leaf) "Missing deployment artifact: $requiredPath"
}

$compose = Get-Content -Raw -LiteralPath $composePath
$config = Get-Content -Raw -LiteralPath $configPath
$tunnel = Get-Content -Raw -LiteralPath $tunnelPath
$runbook = Get-Content -Raw -LiteralPath $runbookPath

Assert-True ($compose -match [regex]::Escape("haierkeys/fast-note-sync-service:3.6.0@sha256:560ab727f2a0bac804a6db9e467b68d7df1a1cf059e72dfccc0412aa4c62e89e")) "Compose must pin verified FNS 3.6.0 image digest."
Assert-True ($compose -match '\[::1\]:\$\{FNS_HOST_PORT:-19000\}:9000') "Compose must bind raw FNS port to loopback."
Assert-True ($compose -notmatch '(?im)^\s*(privileged|network_mode):') "Compose must not use privileged or host-network mode."
Assert-True ($compose -notmatch '(?i)docker\.sock|:latest') "Compose must not mount Docker socket or use latest tag."
Assert-True ($compose -match '(?m)^\s*healthcheck:') "Compose must define bounded service health check."

Assert-True ($config -match 'auth-token-key:\s*"__FNS_AUTH_TOKEN_KEY__"') "Config template must require generated auth-token key."
Assert-True ($config -match 'share-token-key:\s*"__FNS_SHARE_TOKEN_KEY__"') "Config template must require generated share-token key."
Assert-True ($config -match 'register-is-enable:\s*false') "Registration must default closed."
Assert-True ($config -match 'local-fs:\s*\r?\n\s+is-enable:\s*false') "Local attachment HTTP storage must stay disabled."
Assert-True ($config -match 'cloudflare:\s*\r?\n\s+enabled:\s*false') "Embedded Cloudflare integration must stay disabled."
Assert-True ($config -match 'oauth:\s*\r?\n\s+enabled:\s*false') "OAuth integration must stay disabled."
Assert-True ($config -match 'attachment-static:\s*\r?\n\s+is-enable:\s*false') "Unauthenticated attachment endpoint must stay disabled."

Assert-True ($tunnel -match 'service:\s*http://localhost:19000') "Tunnel must target loopback FNS port."
Assert-True ($tunnel -match 'service:\s*http_status:404') "Tunnel must end with explicit 404 catch-all."
Assert-True ($tunnel -match '(?m)^tunnel:\s*__FNS_TUNNEL_ID__$') "Tunnel ID must remain a placeholder in repository."
Assert-True ($tunnel -match '(?m)^credentials-file:\s*__FNS_TUNNEL_CREDENTIALS_FILE__$') "Tunnel credentials path must remain a placeholder in repository."
Assert-True ($tunnel -match '(?m)^\s+- hostname:\s*__FNS_HOSTNAME__$') "Tunnel hostname must remain a placeholder in repository."

foreach ($requiredPhrase in @(
        "Registration bootstrap",
        "Stopped-service backup",
        "Empty-path restore",
        "Rollback",
        "Synthetic data only",
        "Cloud Preview"
    )) {
    Assert-True ($runbook.Contains($requiredPhrase)) "Runbook missing required section or phrase: $requiredPhrase"
}

Assert-True ($runbook -notmatch '(?i)\brsync\b.*--delete|\brclone\b.*\b(sync|purge)\b|\brm\s+-rf\b') "Runbook must avoid destructive mirror or recursive-delete commands."

Write-Output "FNS deployment contract tests passed."
