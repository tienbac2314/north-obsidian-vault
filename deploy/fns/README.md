# Fast Note Sync pilot operations

Status: current Release 1 deployment contract for synthetic human-sync testing.

This contract deploys Fast Note Sync server `3.6.0` by verified multi-platform
image digest. Raw service traffic binds only to `[::1]:19000`. A dedicated
Cloudflare Tunnel supplies TLS without changing existing tunnel routes.

Synthetic data only. Do not connect personal or employer notes until every
promotion gate in [first release](../../docs/roadmap/mvp.md) passes.

New operator: follow the linear
[ground-up human setup](human-setup.md). This file remains the detailed server,
recovery, and failure-response reference.

## Paths and secret boundary

Repository files:

- `compose.yaml`: pinned service topology;
- `config/config.yaml.example`: closed-registration configuration template;
- `cloudflared/config.yml.example`: dedicated tunnel template;
- `cloudflared/fns-cloudflared.service`: hardened dedicated tunnel supervisor.

Oracle runtime root: `/opt/personal-knowledge-pipeline/fns`.

Runtime-only files remain outside Git:

- `runtime/config/config.yaml`;
- `runtime/storage/`;
- `runtime/cloudflared/config.yml`;
- `runtime/cloudflared/credentials.json`;
- stopped-service archives and their SHA-256 manifests;
- FNS username, password, API configuration, tokens, hostname, and tunnel ID.

Generate unique `auth-token-key` and `share-token-key` values on Oracle. Never
reuse Hermes, 9Router, Cloudflare, or backup credentials.

## Render configuration

### Render FNS server config

Create exact runtime directories with owner-only access:

```bash
sudo install -d -m 0700 \
  /opt/personal-knowledge-pipeline/fns/runtime/config \
  /opt/personal-knowledge-pipeline/fns/runtime/storage \
  /opt/personal-knowledge-pipeline/fns/runtime/cloudflared \
  /opt/personal-knowledge-pipeline/fns/backups
```

Copy templates into runtime paths. Replace placeholders without printing
generated values:

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

FNS image runs as container root with every Linux capability dropped. Root
ownership is required because dropped `DAC_OVERRIDE` prevents that process
from writing a host directory owned only by another UID.

### Provision dedicated tunnel

Create dedicated tunnel and DNS route. Interactive values do not enter shell
history:

```bash
cloudflared tunnel login
cloudflared tunnel create fns-pilot
read -r -p "Tunnel UUID: " tunnel_id
read -r -p "FNS hostname: " fns_hostname
credential_source="$HOME/.cloudflared/${tunnel_id}.json"
test -f "$credential_source"
cloudflared tunnel route dns "$tunnel_id" "$fns_hostname"
```

### Install dedicated tunnel service

Create one locked service account. Render tracked template through temporary
file, normalize generated UUID credential filename to `credentials.json`, and
grant account access only to dedicated tunnel runtime:

```bash
sudo useradd --system --home-dir /nonexistent --shell /usr/sbin/nologin fns-tunnel
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
sudo chmod 0600 runtime/cloudflared/config.yml runtime/cloudflared/credentials.json
sudo install -m 0644 \
  cloudflared/fns-cloudflared.service \
  /etc/systemd/system/fns-cloudflared.service
sudo systemctl daemon-reload
sudo systemctl enable --now fns-cloudflared.service
unset tunnel_id fns_hostname credential_source
```

Mode `0711` grants dedicated service traverse-only access to known tunnel path;
it cannot list deployment root. Secret-bearing config, storage, tunnel, and
backup directories retain owner-only modes.

## Start and health

From exact runtime root:

```bash
docker compose config --quiet
docker compose pull
docker compose up -d
docker compose ps
curl --fail --silent --show-error http://[::1]:19000/api/health
```

Expected raw listener is `[::1]:19000`, never a wildcard listener. Dedicated
Cloudflare Tunnel targets this loopback listener.

## Registration bootstrap

Registration defaults closed. For one disposable account:

1. Stop FNS.
2. Change only `user.register-is-enable` to `true`.
3. Start FNS and register one synthetic pilot account through TLS hostname.
4. Stop FNS immediately.
5. Set `user.register-is-enable` back to `false`.
6. Start FNS and verify second registration is rejected.

Never commit or paste account/API configuration into repository or vault.
Configuration Sync, MCP, external REST consumers, Git automation, sharing,
mirrors, and headless clients stay disabled. Cloud Preview automatic local
deletion stays off.

## Obsidian client enrollment

Use separate vault-restricted authorization per device:

1. Set sole synthetic account as administrator only after registration is
   closed.
2. Create or select exact remote vault name `FNS Pilot`.
3. From that vault, generate Obsidian authorization with **Limit access to
   current vault only** checked.
4. Import through WebGUI one-click action or plugin **Paste server
   authorization config**. Do not hand-build `obsidian://` URI: form encoding
   can turn space into literal `+` and select a different vault.
5. Set neutral client label such as `Windows Pilot` or `Android Pilot`.
6. Verify restricted client is **Service connected** and WebGUI reports its
   WebSocket online.
7. Revoke broader bootstrap token. Verify it is absent from token inventory,
   receives authorization failure if retried, and restricted client reconnects.
8. Run Full Sync and confirm remote note and attachment counts.
9. Store recoverable authorization with OS secret storage outside repository
   and vault. Never place token in Markdown, screenshots, shell history, or
   shared clipboard history.

Use a 365-day validity period for each disposable device token. Keep WebGUI
login and sharing lifetimes separate. Give Windows and Android different
tokens so either device can be revoked without rotating the other.

Windows pilot passed full sync, two-version history, recycle-bin restore, and
native SVG attachment gates. Android plugin enrollment and separate
vault-restricted token creation passed, but physical behavior remains a gate:
record default background behavior before applying required battery exemption,
then run bidirectional, offline, history/trash, attachment, lifecycle, and
rebuilt-client checks. Personal migration remains blocked.

## Physical Android gate

Do not pre-generate Android authorization. Create it only when physical device
is ready, and never move it through email, chat, notes, screenshots, or shared
clipboard history.

On device:

1. Record Android and Obsidian versions plus default battery/background policy.
2. Create empty disposable Obsidian vault. Install only verified Fast Note Sync
   `2.4.0`; keep every other community plugin disabled.
3. Set attachment folder to `SYSTEM/Media`. Keep Configuration Sync, Cloud
   Preview automatic local deletion, sharing, Git, mirrors, MCP, REST consumers,
   and headless clients disabled.
4. Generate separate `Android Pilot` authorization restricted to exact
   `FNS Pilot`. Import through WebGUI one-click action or plugin paste action.
5. Confirm WebGUI shows Android WebSocket online, then run Full Sync. Verify
   Home, guide, templates, folders, synthetic roundtrip note, and SVG attachment
   open locally.
6. Before changing battery policy, lock screen and background Obsidian once;
   record whether convergence completes or visibly waits. Then apply required
   battery/background exemption and repeat.
7. Run Windows create, Android receive/edit, Windows receive. Create one Android
   note offline, reconnect, and verify Windows receives it.
8. Test rename and folder move; delete, inspect trash, and restore; edit, inspect
   history, and restore earlier version.
9. Capture or select one Android image and one larger disposable file. Open both
   from Windows after convergence and compare byte hashes outside repository.
10. Restart Android Obsidian, Windows Obsidian, and FNS service separately.
    Confirm exact vault remains connected and fixture counts stay stable.

Stop on silent loss, unexplained deletion, cross-vault access, inaccessible
attachment, hidden failure, or recurring manual repair. Preserve all copies and
do not add second sync or attachment transport.

## Empty Storage Configuration type

With this Release 1 configuration, **Backup & Sync** > **Storage
Configuration** > **Add Storage** opens a Type control with no options. This is
expected from current server configuration, not a browser failure:

- the WebGUI requests `/api/storage/enabled_types`;
- FNS returns only storage providers whose `is-enable` flag is true;
- this deployment disables `local-fs`, Aliyun OSS, AWS S3, Cloudflare R2,
  MinIO, and WebDAV, so the correct response is an empty list;
- upstream WebGUI does not render a useful “no storage providers enabled”
  message.

Do not enable a provider only to populate the dropdown. Release 1 deliberately
excludes FNS backup jobs: history and trash share the live server's failure
domain, while independent recovery uses stopped-service archives.

If a later approved design selects one FNS storage provider, add its
runtime-only credentials, enable only that provider, restart FNS, confirm
`/api/storage/enabled_types` returns that one type, and test backup plus restore
with synthetic data. An upstream UI fix would keep the empty list but replace
the blank control with an explanatory disabled state.

## Stop and restart

```bash
sudo systemctl stop fns-cloudflared.service
docker compose stop
docker compose start
sudo systemctl start fns-cloudflared.service
docker compose ps
```

Use `docker compose down` only when replacing container topology. It preserves
bind-mounted runtime data.

## Stopped-service backup

Quiesce Obsidian clients first. Then:

```bash
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
docker compose start
```

Copy archive and checksum off VPS. Product history and trash remain
convenience recovery inside same failure domain, not independent backup.

## Empty-path restore

Never restore over live or only surviving state. Choose new absent directory,
verify it is absent, then create it:

```bash
restore_root="/opt/personal-knowledge-pipeline/fns-restore-test"
test ! -e "$restore_root"
sudo install -d -m 0700 "$restore_root"
sudo sha256sum --check backups/fns-state-<timestamp>.tar.gz.sha256
sudo tar \
  --extract \
  --gzip \
  --file backups/fns-state-<timestamp>.tar.gz \
  --directory "$restore_root"
```

Copy pinned Compose file into restore root, assign a different loopback port,
start isolated service, and rebuild one disposable client. Do not point
production tunnel at restore test.

## Upgrade

1. Complete stopped-service backup and off-VPS copy.
2. Verify new server release, ARM64 manifest, plugin compatibility, open
   security issues, and new image digest.
3. Change one pinned image line in `compose.yaml`.
4. Render Compose, pull, start, inspect bounded health, and run synthetic
   convergence/history/trash checks.
5. Keep previous Compose file and archive until restore test passes.

No automatic updater or `latest` tag is allowed.

## Rollback

Stop dedicated FNS Compose project and `fns-cloudflared.service`. Restore previous
pinned Compose file plus stopped-service archive into an empty isolated path.
Repoint only dedicated FNS tunnel after restored service passes loopback
health. Existing Hermes, 9Router, Cloudflare routes, PM2 processes, and host
firewall remain unchanged.

If abandoning pilot, leave runtime and backup paths stopped and preserved for
inspection. Remove exact resources only after separate explicit deletion
approval.
