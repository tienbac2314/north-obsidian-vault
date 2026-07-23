# Fast Note Sync ground-up human setup

Status: current Release 1 path for one human operator and disposable data.

This guide gives one linear path from repository checkout to Windows and
Android enrollment. Detailed commands, recovery procedures, and security
reasons remain in [FNS pilot operations](README.md).

## Stop conditions

Use only synthetic notes and disposable attachments. Stop before personal or
employer content. Stop on silent loss, cross-vault access, unexplained
deletion, inaccessible attachment, failed restore, or recurring manual repair.
Never run another whole-vault sync or attachment-offload transport beside FNS.

Keep all account credentials, hostnames, tunnel identifiers, authorization
URLs, tokens, and recovery archives outside Git and outside the Obsidian vault.

## 1. Prepare operator tools

Required:

- Linux server with Docker Engine, Docker Compose, and `cloudflared`;
- private Cloudflare account and hostname;
- Windows PowerShell 5.1 or newer and Git;
- Obsidian on Windows and Android;
- repository checkout on a reviewed release branch or current `main`.

From repository root, verify deployment and vault artifacts:

```powershell
powershell -NoProfile -File scripts/test-fns-deployment.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
```

Do not continue after either command fails.

Optional Android diagnostics use Minimal ADB and Fastboot. If installed at its
default Windows path, add directory to user PATH once:

```powershell
$adbDirectory = 'C:\Program Files (x86)\Minimal ADB and Fastboot'
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$pathEntries = @($userPath -split ';' | Where-Object { $_ })
if ($pathEntries -notcontains $adbDirectory) {
    [Environment]::SetEnvironmentVariable(
        'Path',
        (($pathEntries + $adbDirectory) -join ';'),
        'User'
    )
}
```

Open new terminal before running `adb devices`. Require device state `device`,
not `unauthorized`. ADB is diagnostic convenience, not FNS transport.

## 2. Deploy isolated server

On Linux server:

1. Copy `deploy/fns` to
   `/opt/personal-knowledge-pipeline/fns`.
2. Follow [Paths and secret boundary](README.md#paths-and-secret-boundary) and
   [Render FNS server config](README.md#render-fns-server-config).
3. From deployment root, create dedicated tunnel and DNS route:

   ```bash
   cloudflared tunnel login
   cloudflared tunnel create fns-pilot
   read -r -p "Tunnel UUID: " tunnel_id
   read -r -p "FNS hostname: " fns_hostname
   credential_source="$HOME/.cloudflared/${tunnel_id}.json"
   test -f "$credential_source"
   cloudflared tunnel route dns "$tunnel_id" "$fns_hostname"
   ```

4. Follow exact remaining commands in
   [Install dedicated tunnel service](README.md#install-dedicated-tunnel-service).
   They render tracked `cloudflared/config.yml.example`, install generated UUID
   credential as `runtime/cloudflared/credentials.json`, set service ownership
   and modes, and start dedicated tunnel unit. Do not retain UUID-named
   credential inside runtime.
5. Follow [Start and health](README.md#start-and-health). Require healthy
   Compose state, HTTP `200` on IPv6 loopback, and HTTP `200` through TLS
   hostname.
6. Confirm raw FNS port is not reachable through wildcard listener.

Do not reuse Hermes, 9Router, backup, or existing tunnel credentials. Do not
edit unrelated tunnel routes or process supervisors.

## 3. Create one disposable account

Follow [Registration bootstrap](README.md#registration-bootstrap):

1. Open registration only for account creation.
2. Register one synthetic account through TLS WebGUI.
3. Close registration immediately.
4. Verify another valid registration attempt is rejected.
5. Assign administrator only to sole disposable account.

Store password in OS secret storage. Never place it in Markdown, shell history,
screenshots, or chat.

## 4. Build Windows vault

Choose new empty directory outside repository and cloud-synchronized folders.
Test initializer again, then run:

```powershell
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/initialize-vault-template.ps1 `
  -Destination 'C:\path\to\disposable\FNS Pilot'
```

Open directory as Obsidian vault. Verify `HUB/Home.md`,
`SYSTEM/Guides/vault-operating-guide.md`, four core templates, and all top-level
folders render. In Obsidian:

1. Set core **Default location for new attachments** to
   `In the folder specified below`.
2. Set **Attachment folder path** to `SYSTEM/Media`.
3. Install Fast Note Sync from Community plugins.
4. Verify plugin version is approved version recorded in current operations
   contract; enable no other community plugin for pilot.
5. Keep Configuration Sync, Cloud Preview automatic local deletion, sharing,
   Git automation, MCP, mirrors, and external REST consumers off.

## 5. Create remote vault and Windows token

In FNS WebGUI:

1. Create exact remote vault `FNS Pilot`.
2. Use vault **Authorize Obsidian** action.
3. Name device token `Windows Pilot`.
4. Set validity to 365 days.
5. Allow REST and WebSocket required by Obsidian sync.
6. Check **Limit access to current vault only**.
7. Import through WebGUI one-click action or plugin **Paste server
   authorization config**.

Do not reconstruct `obsidian://` URL manually; a space encoded as `+` can
create wrong vault. Verify plugin reports service connected, token shows
WebSocket online, and selected vault is exactly `FNS Pilot`. Run Full Sync.

## 6. Enroll Android independently

On Android:

1. Record Android and Obsidian versions plus default battery policy.
2. Create new empty disposable vault.
3. Install same approved Fast Note Sync plugin version and no other community
   plugin.
4. Set attachment folder to `SYSTEM/Media`.
5. In WebGUI, create separate `Android Pilot` token with 365-day validity,
   required REST and WebSocket permissions, and **Limit access to current vault
   only**.
6. Import authorization on device without email, chat, notes, screenshots, or
   shared clipboard history.
7. Confirm WebSocket online, run Full Sync, and open Home, guide, templates,
   one note, and one attachment locally.

Record default lock-screen/background result before granting battery exemption.
Then apply only required exemption and repeat convergence check.

## 7. Prove disposable behavior

Follow full [Physical Android gate](README.md#physical-android-gate). Minimum
promotion evidence:

- Windows create, Android receive/edit, Windows receive;
- Android offline create, reconnect, Windows receive;
- note rename, folder move, delete/trash/restore, and history restore;
- Android image plus larger arbitrary file opens on Windows;
- attachment hashes match outside repository;
- Android, Windows, and FNS restarts preserve exact vault and fixture counts;
- no unexplained duplicate, deletion, cross-vault access, or manual repair.

Disconnecting phone before this matrix finishes leaves Android promotion gates
open. Successful enrollment alone proves connectivity, not sync safety.

## 8. Establish independent recovery

Quiesce both clients. Follow [Stopped-service
backup](README.md#stopped-service-backup), copy archive plus checksum off VPS,
then follow [Empty-path restore](README.md#empty-path-restore). Rebuild one
empty disposable client from restored service.

Archive contains FNS signing keys, account database, vault data, and tunnel
credentials. Store copy outside cloud-synchronized folders under encrypted
volume or ACL restricted to operator, SYSTEM, and local administrators. Verify
checksum after copy and before every restore. Remove any temporary readable
transfer copy after verification.

FNS history and trash are convenience recovery, not backup. Personal migration
remains blocked until physical device matrix, off-VPS custody, and rebuilt
client restore pass.

## Storage page note

Blank Storage Configuration Type list is expected while all optional FNS
storage providers remain disabled. Read
[Empty Storage Configuration type](README.md#empty-storage-configuration-type)
before changing server configuration.
