# Fast Note Sync pilot operations

Status: current Release 1 deployment contract for synthetic human-sync testing.

This contract deploys Fast Note Sync server `3.6.0` by verified multi-platform
image digest. Raw service traffic binds only to `[::1]:19000`. A dedicated
Cloudflare Tunnel supplies TLS without changing existing tunnel routes.

Synthetic data only. Do not connect personal or employer notes until every
promotion gate in [first release](../../docs/roadmap/mvp.md) passes.

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
- `runtime/cloudflared/<tunnel-id>.json`;
- stopped-service archives and their SHA-256 manifests;
- FNS username, password, API configuration, tokens, hostname, and tunnel ID.

Generate unique `auth-token-key` and `share-token-key` values on Oracle. Never
reuse Hermes, 9Router, Cloudflare, or backup credentials.

## Render configuration

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
auth_key="$(openssl rand -hex 32)"
share_key="$(openssl rand -hex 32)"
sed \
  -e "s/__FNS_AUTH_TOKEN_KEY__/${auth_key}/" \
  -e "s/__FNS_SHARE_TOKEN_KEY__/${share_key}/" \
  config/config.yaml.example > runtime/config/config.yaml
unset auth_key share_key
chmod 0600 runtime/config/config.yaml
sudo chown -R root:root runtime/config runtime/storage
sudo chmod 0700 runtime/config runtime/storage
```

FNS image runs as container root with every Linux capability dropped. Root
ownership is required because dropped `DAC_OVERRIDE` prevents that process
from writing a host directory owned only by another UID.

Render Cloudflare configuration with exact dedicated tunnel ID, credentials
path, and hostname. Keep those values outside repository and shell history.

Create one locked service account, grant it read access only to dedicated
tunnel runtime, and install exact unit:

```bash
sudo useradd --system --home-dir /nonexistent --shell /usr/sbin/nologin fns-tunnel
sudo chown -R fns-tunnel:fns-tunnel runtime/cloudflared
sudo chmod 0711 /opt/personal-knowledge-pipeline/fns
sudo chmod 0700 runtime/cloudflared
sudo chmod 0600 runtime/cloudflared/config.yml runtime/cloudflared/credentials.json
sudo install -m 0644 \
  cloudflared/fns-cloudflared.service \
  /etc/systemd/system/fns-cloudflared.service
sudo systemctl daemon-reload
sudo systemctl enable --now fns-cloudflared.service
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
sudo tar \
  --create \
  --gzip \
  --file "backups/fns-state-${timestamp}.tar.gz" \
  --directory runtime \
  config storage cloudflared
sha256sum "backups/fns-state-${timestamp}.tar.gz" \
  > "backups/fns-state-${timestamp}.tar.gz.sha256"
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
sha256sum --check backups/fns-state-<timestamp>.tar.gz.sha256
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
