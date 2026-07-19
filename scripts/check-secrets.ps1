[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$trackedFiles = @(& git -C $repoRoot ls-files)
if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked files.' }

$forbiddenNames = @('.env', '.env.local', 'id_rsa', 'id_ed25519')
$rules = @(
    @{ Name = 'GitHub token'; Pattern = 'gh[pousr]_[A-Za-z0-9]{20,}' },
    @{ Name = 'Telegram bot token'; Pattern = '\b[0-9]{8,10}:[A-Za-z0-9_-]{30,}\b' },
    @{ Name = 'Private key'; Pattern = '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----' },
    @{ Name = 'Credential in URL'; Pattern = 'https?://[^/\s:@]+:[^@\s/]+@' },
    @{ Name = 'Private dynamic DNS endpoint'; Pattern = '\b[A-Za-z0-9-]+\.dpdns\.com\b' },
    @{ Name = 'IPv4 address'; Pattern = '(?<![0-9.])(?:[0-9]{1,3}\.){3}[0-9]{1,3}(?![0-9.])' },
    @{ Name = 'Assigned long secret'; Pattern = '(?i)(?:api[_-]?key|token|secret|password)\s*[:=]\s*["'']?[A-Za-z0-9_./+=-]{20,}' }
)

$failures = [System.Collections.Generic.List[string]]::new()
foreach ($relativeFile in $trackedFiles) {
    if ($forbiddenNames -contains [IO.Path]::GetFileName($relativeFile)) {
        $failures.Add("$relativeFile (forbidden filename)")
        continue
    }

    $fullFile = Join-Path $repoRoot $relativeFile
    try { $content = [IO.File]::ReadAllText($fullFile) } catch { continue }
    if ($content.IndexOf([char]0) -ge 0) { continue }

    foreach ($rule in $rules) {
        if ([regex]::IsMatch($content, $rule.Pattern)) {
            $failures.Add("$relativeFile ($($rule.Name))")
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | Sort-Object -Unique | ForEach-Object { Write-Error "Secret scan failure: $_" }
    exit 1
}

Write-Host "Secret scan passed: $($trackedFiles.Count) tracked files; values never printed."

