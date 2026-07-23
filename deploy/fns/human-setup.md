# Fast Note Sync installation guide

Status: Release 1 installation path for one private synthetic vault.

This guide installs Fast Note Sync server `3.6.0`, creates the standard
Obsidian layout, and enrolls Windows and Android with Fast Note Sync plugin
`2.4.0`. Commands may be run by a person or automation. UI steps remain manual.
For design rationale and failure response, read
[FNS pilot operations](README.md).

## Safety boundary

Use only synthetic notes and disposable attachments during installation.
Never place account credentials, hostnames, tunnel identifiers, authorization
URLs, tokens, or recovery archives in Git or the Obsidian vault.

Stop on:

- failed health or checksum check;
- wildcard raw-service listener;
- registration that remains open;
- token without exact-vault restriction;
- silent loss, unexplained deletion, or cross-vault access;
- inaccessible attachment or failed restore.

Do not run another whole-vault sync or attachment-offload transport beside FNS.

## Installation overview

1. Verify repository artifacts.
2. copy `deploy/fns` to an isolated server directory;
3. render secret-bearing configuration outside Git;
4. create one dedicated Cloudflare Tunnel;
5. start FNS and verify private raw listener plus public TLS;
6. create one account, then close registration;
7. initialize and enroll Windows vault;
8. enroll Android with a separate token;
9. verify baseline sync;
10. create and verify independent backup.

## Requirements

- ARM64 or AMD64 Linux server;
- Docker Engine with Docker Compose v2;
- `cloudflared`, OpenSSL, `curl`, `tar`, and `sha256sum`;
- Cloudflare account with a hostname you control;
- Windows PowerShell 5.1 or newer, Git, OpenSSH, and Obsidian;
- Android Obsidian;
- repository checkout on reviewed Release 1 branch or current `main`.

## 1. Verify repository

From repository root on Windows:

```powershell
powershell -NoProfile -File scripts/test-fns-deployment.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
```

Do not continue after any failure.

## 2. Copy deployment files

Choose SSH host or alias when prompted:

```powershell
$server = Read-Host 'SSH host or configured alias'
$remoteStaging = '/tmp/pkp-fns-install'

ssh $server "test ! -e '$remoteStaging' && mkdir -m 700 '$remoteStaging'"
scp -r deploy/fns/* "${server}:${remoteStaging}/"
ssh -t $server "sudo install -d -m 0700 /opt/personal-knowledge-pipeline/fns && sudo cp -a '$remoteStaging/.' /opt/personal-knowledge-pipeline/fns/"
```

Continue in a root shell because deployment root is intentionally owner-only:

```powershell
ssh -t $server "sudo -i"
```

All following Linux commands run from:

```bash
cd /opt/personal-knowledge-pipeline/fns
```

## 3. Render server configuration

Create private runtime directories:

```bash
sudo install -d -m 0700 \
  runtime/config \
  runtime/storage \
  runtime/cloudflared \
  backups
```

Generate unique signing keys and install rendered configuration without
printing key values:

```bash
rendered_config="$(mktemp)"
trap 'rm -f "$rendered_config"' EXIT
auth_key="$(openssl rand -hex 32)"
share_key="$(openssl rand -hex 32)"
sed \
  -e "s/__FNS_AUTH_TOKEN_KEY__/${auth_key}/" \
  -e "s/__FNS_SHARE_TOKEN_KEY__/${share_key}/" \
  config/config.yaml.example > "$rendered_config"
sudo install -o root -g root -m 0600 \
  "$rendered_config" runtime/config/config.yaml
rm -f "$rendered_config"
trap - EXIT
unset auth_key share_key
sudo chown -R root:root runtime/config runtime/storage
sudo chmod 0700 runtime/config runtime/storage
```

Registration is closed by default. Optional storage providers, sharing,
Configuration Sync, Cloud Preview deletion, MCP, and external REST consumers
remain disabled.

## 4. Create dedicated TLS tunnel

Authenticate and create one isolated tunnel:

```bash
cloudflared tunnel login
cloudflared tunnel create fns-pilot
read -r -p "Tunnel UUID: " tunnel_id
read -r -p "FNS hostname: " fns_hostname
credential_source="$HOME/.cloudflared/${tunnel_id}.json"
test -f "$credential_source"
cloudflared tunnel route dns "$tunnel_id" "$fns_hostname"
```

Render tunnel configuration:

```bash
if ! id -u fns-tunnel >/dev/null 2>&1; then
  sudo useradd --system --home-dir /nonexistent \
    --shell /usr/sbin/nologin fns-tunnel
fi
rendered_tunnel_config="$(mktemp)"
trap 'rm -f "$rendered_tunnel_config"' EXIT
sed \
  -e "s|__FNS_TUNNEL_ID__|${tunnel_id}|" \
  -e "s|__FNS_TUNNEL_CREDENTIALS_FILE__|/opt/personal-knowledge-pipeline/fns/runtime/cloudflared/credentials.json|" \
  -e "s|__FNS_HOSTNAME__|${fns_hostname}|" \
  cloudflared/config.yml.example > "$rendered_tunnel_config"
sudo install -o fns-tunnel -g fns-tunnel -m 0600 \
  "$rendered_tunnel_config" runtime/cloudflared/config.yml
sudo install -o fns-tunnel -g fns-tunnel -m 0600 \
  "$credential_source" runtime/cloudflared/credentials.json
rm -f "$rendered_tunnel_config"
trap - EXIT
sudo chown fns-tunnel:fns-tunnel runtime/cloudflared
sudo chmod 0711 /opt/personal-knowledge-pipeline/fns
sudo chmod 0700 runtime/cloudflared
sudo chmod 0600 \
  runtime/cloudflared/config.yml \
  runtime/cloudflared/credentials.json
sudo install -m 0644 \
  cloudflared/fns-cloudflared.service \
  /etc/systemd/system/fns-cloudflared.service
sudo systemctl daemon-reload
sudo systemctl enable --now fns-cloudflared.service
unset tunnel_id fns_hostname credential_source
```

If `fns-tunnel` already exists, verify it belongs to this deployment before
continuing. Do not reuse or edit Hermes, 9Router, or another tunnel.

## 5. Start server

```bash
docker compose config --quiet
docker compose pull
docker compose up -d
docker compose ps
curl --fail --silent --show-error http://[::1]:19000/api/health
sudo systemctl is-active fns-cloudflared.service
ss -lnt
```

Required results:

- Compose service is healthy;
- loopback health returns HTTP `200`;
- dedicated tunnel service is active;
- raw port `19000` listens only on `[::1]`, never an IPv4 or IPv6 wildcard;
- TLS hostname returns HTTP `200`.

From Windows:

```powershell
$fnsUrl = Read-Host 'FNS TLS URL'
(Invoke-WebRequest -UseBasicParsing "$fnsUrl/api/health").StatusCode
```

## 6. Create account and close registration

Registration opens only long enough to create one disposable account:

```bash
docker compose stop
sudoedit runtime/config/config.yaml
```

Change only:

```yaml
user:
  register-is-enable: true
```

Start service:

```bash
docker compose start
docker compose ps
```

Open TLS WebGUI, register one disposable account, and store password in OS
secret storage. Then close registration immediately:

```bash
docker compose stop
sudoedit runtime/config/config.yaml
```

Restore:

```yaml
user:
  register-is-enable: false
```

Restart and verify:

```bash
docker compose start
docker compose ps
curl --fail --silent --show-error http://[::1]:19000/api/health
```

Confirm another registration attempt is rejected. Sign in and assign
administrator only to sole disposable account.

## 7. Create Windows vault

Choose a new absent directory. Existing installations may use their current
vault instead.

```powershell
$vaultDestination = Read-Host 'New disposable vault path'
if (Test-Path -LiteralPath $vaultDestination) {
    throw 'Destination must not already exist'
}
powershell -NoProfile -File scripts/initialize-vault-template.ps1 `
  -Destination $vaultDestination
```

Open directory in Obsidian. Verify:

- `HUB/Home.md`;
- `SYSTEM/Guides/vault-operating-guide.md`;
- four files under `SYSTEM/Templates`;
- top-level `DAILY`, `HUB`, `PARA`, `STAGING`, `SYSTEM`, and `ZETA`.

In Obsidian:

1. Set **Default location for new attachments** to
   **In the folder specified below**.
2. Set **Attachment folder path** to `SYSTEM/Media`.
3. Install Fast Note Sync from Community plugins.
4. Verify plugin version is `2.4.0`.
5. Enable no other whole-vault sync plugin.

In FNS WebGUI:

1. Create exact remote vault `FNS Pilot`.
2. Select **Authorize Obsidian**.
3. Name authorization `Windows Pilot`.
4. Set validity to 365 days.
5. Allow REST and WebSocket.
6. Enable **Limit access to current vault only**.
7. Import through WebGUI one-click action or plugin paste action.

Do not construct `obsidian://` URL manually. Verify plugin says **Service
connected**, selected vault is exactly `FNS Pilot`, then run **Full Sync**.

## 8. Enroll Android

1. Create new empty disposable Android vault.
2. Install Fast Note Sync `2.4.0`.
3. Set attachment folder to `SYSTEM/Media`.
4. Create separate `Android Pilot` authorization in WebGUI.
5. Set 365-day validity, REST plus WebSocket, and exact-vault restriction.
6. Import without email, chat, notes, screenshots, or shared clipboard history.
7. Run **Full Sync**.
8. Open Home, operating guide, templates, one note, and SVG attachment.

Keep Configuration Sync, Cloud Preview automatic local deletion, sharing, Git,
MCP, mirrors, and external REST consumers disabled.

## 9. Verify installation

Release 1 installation is usable when all items pass:

- Windows and Android show **Service connected**;
- both authorizations are restricted to exact `FNS Pilot`;
- WebGUI shows both WebSocket clients;
- Windows creates a synthetic note and Android receives it;
- Android edits that note and Windows receives edit;
- `SYSTEM/Media` attachment opens on both devices;
- registration remains closed;
- public TLS and loopback health return HTTP `200`;
- no personal content entered pilot.

Extended offline, background, history, trash, lifecycle, and larger-attachment
tests may continue during synthetic observation. They are not installation
steps.

## 10. Create independent backup

Close Obsidian clients. On server:

```bash
cd /opt/personal-knowledge-pipeline/fns
docker compose stop
timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
archive="backups/fns-state-${timestamp}.tar.gz"
sudo tar \
  --create \
  --gzip \
  --file "$archive" \
  --directory . \
  runtime/config runtime/storage runtime/cloudflared
sudo sh -c "sha256sum '$archive' > '$archive.sha256'"
sudo sha256sum --check "$archive.sha256"
docker compose start
docker compose ps
```

Copy archive and checksum off VPS, outside repository and vault. Recompute
checksum after transfer. Protect archive because it contains signing keys,
account database, vault data, and tunnel credentials.

Restore only into a new absent isolated directory and different loopback port.
Never overwrite live or only surviving state. Exact procedure:
[Empty-path restore](README.md#empty-path-restore).

FNS history and trash share live server failure domain; they are not backup.

## Storage page

Blank **Storage Configuration Type** list is expected because every optional
FNS storage provider is disabled. Do not enable one merely to populate
dropdown. See
[Empty Storage Configuration type](README.md#empty-storage-configuration-type).
