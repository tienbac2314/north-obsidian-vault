# Fast Note Sync Human Pilot Implementation Plan

Status: superseded non-authoritative plan under DEC-027. Do not execute. Current authority is [first production-worthy release](../../roadmap/mvp.md).

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deploy and prove an isolated Fast Note Sync pilot for seamless Windows and Android Obsidian use, integrated history, trash, and attachments without granting Hermes vault access.

**Architecture:** One FNS server runs on the existing ARM64 Oracle VPS behind its existing TLS Nginx ingress. Windows and Android Obsidian clients use FNS as the only sync transport for a synthetic disposable vault. FNS history and trash provide convenience recovery; a stopped-service archive copied off the VPS proves independent restore before personal migration.

**Tech Stack:** Obsidian, Fast Note Sync plugin `2.4.0`, Fast Note Sync server `3.6.0`, Docker Compose `2.40.x`, Nginx `1.24.x`, VibeShell, Cốc Cốc, PowerShell, Markdown.

## Global Constraints

- Treat [`../specs/2026-07-22-obsidian-hermes-workspace-design.md`](../specs/2026-07-22-obsidian-hermes-workspace-design.md) as product authority.
- Version numbers record 2026-07-22 evidence. Recheck current official release, scorecard, and named open issues before installation; never downgrade a newer verified stable release merely to match this plan.
- Use a new synthetic disposable vault. Do not copy personal, employer, credential, account, endpoint, or provider data into it.
- FNS is the only sync transport. Do not enable Syncthing, LiveSync, Google Drive Sync, Obsidian Sync, or another folder-sync engine on pilot vault.
- Do not enable FNS MCP, REST integrations, Git automation, local mirror, third-party headless client, sharing, public attachment access, or Hermes vault access.
- Keep ordinary attachments local. Keep Cloud Preview automatic local deletion off.
- Bind FNS container to loopback and publish it only through existing TLS Nginx ingress. Do not open a raw FNS port in Oracle or host firewall.
- Store credentials, actual hostname, certificate paths, Docker environment file, database, archives, and raw logs outside repository. Never echo secret values during verification.
- Stop promotion on silent byte loss, unexpected deletion, cross-vault authorization, unrecoverable conflict, failed full restore, or another writer changing pilot files.
- Work on `research/full-system-design-dev`. Make and push one small verified commit per task. Never rewrite dev history. Publish clean history only after final verification through `scripts/publish-feature-clean.ps1`.

---

## File map

- `deploy/fns/compose.yaml`: repository-owned service topology with environment-supplied image, loopback bind, host port, and data root.
- `deploy/fns/nginx-location.conf`: WebSocket-capable location block inserted into an existing private TLS server block.
- `deploy/fns/README.md`: exact deploy, stop, backup, restore, and rollback runbook without environment identifiers.
- `docs/current-state/vps-inventory.md`: sanitized capacity and deployment state only.
- `docs/current-state/active-goal.md`: current gate and exact next task.
- `docs/decisions/decision-log.md`: promotion or rejection after observed evidence.
- `docs/decisions/unresolved-questions.md`: remove only questions answered by tests.
- `docs/pull-request-summary.md`: final scope, evidence, checks, and remaining limits.

## Task 1: Add Reproducible FNS Deployment Contract

**Files:**

- Create: `deploy/fns/compose.yaml`
- Create: `deploy/fns/nginx-location.conf`
- Create: `deploy/fns/README.md`
- Modify: `docs/current-state/active-goal.md`

**Interfaces:**

- Consumes: approved FNS human-pilot design and upstream Docker volume contract.
- Produces: Compose variables `FNS_IMAGE`, `FNS_BIND_ADDRESS`, `FNS_HOST_PORT`, and `FNS_DATA_ROOT`; one Nginx location snippet; exact operator runbook.

- [ ] **Step 1: Create Compose topology**

Write `deploy/fns/compose.yaml` exactly:

```yaml
services:
  fast-note-sync:
    image: ${FNS_IMAGE:?set an exact verified image tag}
    restart: unless-stopped
    ports:
      - "${FNS_BIND_ADDRESS:?set loopback address}:${FNS_HOST_PORT:?set unused host port}:9000"
    volumes:
      - ${FNS_DATA_ROOT:?set private data root}/storage:/fast-note-sync/storage
      - ${FNS_DATA_ROOT:?set private data root}/config:/fast-note-sync/config
```

Do not add `latest`, host networking, a public bind, Docker socket, privileged mode, or another service.

- [ ] **Step 2: Create reusable Nginx location**

Write `deploy/fns/nginx-location.conf` exactly:

```nginx
client_max_body_size 256m;
proxy_buffering off;
proxy_request_buffering off;

location / {
    proxy_pass http://localhost:19000;
    proxy_http_version 1.1;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_read_timeout 3600s;
    proxy_send_timeout 3600s;
}
```

This snippet belongs inside one existing TLS `server` block. It does not define hostname or certificate paths.

- [ ] **Step 3: Write operator runbook**

`deploy/fns/README.md` must contain these contracts:

1. Run read-only preflight before creating files.
2. Copy repository Compose file to `/opt/fns-pilot/compose.yaml` only after verifying exact path does not already contain unrelated data.
3. Create `/opt/fns-pilot/.env` with mode `600` and these values without printing them:

   ```bash
   umask 077
   cd /opt/fns-pilot
   loopback_address="$(python3 -c 'import socket; print(socket.gethostbyname("localhost"))')"
   {
     printf 'FNS_IMAGE=%s\n' 'haierkeys/fast-note-sync-service:3.6.0'
     printf 'FNS_BIND_ADDRESS=%s\n' "$loopback_address"
     printf 'FNS_HOST_PORT=%s\n' '19000'
     printf 'FNS_DATA_ROOT=%s\n' '/opt/fns-pilot/data'
   } > .env
   chmod 600 .env
   unset loopback_address
   ```

4. Validate image and Compose before start:

   ```bash
   docker manifest inspect haierkeys/fast-note-sync-service:3.6.0 >/dev/null
   docker compose --env-file .env -f compose.yaml config --quiet
   ```

5. Start, stop, inspect, and roll back only this project:

   ```bash
   docker compose --env-file .env -f compose.yaml up -d
   docker compose --env-file .env -f compose.yaml ps
   docker compose --env-file .env -f compose.yaml logs --tail 100 fast-note-sync
   docker compose --env-file .env -f compose.yaml stop
   docker compose --env-file .env -f compose.yaml down
   ```

6. Never use `down -v`; storage and config are bind-mounted evidence.
7. Insert Nginx snippet only into an already verified TLS hostname dedicated to pilot. Run `sudo nginx -t` before reload. If no hostname and valid certificate are already available, stop without public deployment.
8. Complete first account registration in Cốc Cốc, verify only one user exists, set `user.register-is-enable: false` in private generated config, restart FNS, and prove new registration is rejected.
9. Never record hostname, account, token, certificate, database, or raw logs in repository.

- [ ] **Step 4: Validate contract locally**

Run:

```powershell
rtk rg -n "FNS_IMAGE|FNS_BIND_ADDRESS|FNS_HOST_PORT|FNS_DATA_ROOT" deploy/fns/compose.yaml deploy/fns/README.md
rtk rg -n "proxy_http_version 1.1|Upgrade|Connection|nginx -t" deploy/fns/nginx-location.conf deploy/fns/README.md
if (Select-String -LiteralPath deploy/fns/compose.yaml -Pattern ':latest|privileged|network_mode|docker.sock') { throw 'Unsafe Compose setting found' }
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: required contract terms appear, unsafe-setting check emits nothing, and repository checks exit `0`.

- [ ] **Step 5: Commit deployment contract**

```powershell
git add deploy/fns docs/current-state/active-goal.md
git commit -m "feat(fns): define pilot deployment"
git push origin research/full-system-design-dev
```

## Task 2: Pass VPS Capacity and Private-Ingress Gate

**Files:**

- Modify: `docs/current-state/vps-inventory.md`
- Modify: `docs/current-state/active-goal.md`

**Interfaces:**

- Consumes: Task 1 deployment contract and existing VibeShell Oracle session.
- Produces: sanitized pass/fail for architecture, Docker, Compose, Nginx, disk, port, TLS hostname, and certificate availability.

- [ ] **Step 1: Refresh upstream evidence**

Using Agent Reach GitHub backend, verify current plugin release, server release, Obsidian scorecards, and status of FNS issues `#312`, `#339`, `#346`, `#356`, `#391`, `#395`, and `#425`. Record only changed facts in current research file. If a newer release exists, replace image and plugin versions throughout Task 1 assets before deployment and rerun repository checks.

- [ ] **Step 2: Run sanitized read-only VPS preflight**

Through VibeShell `exec`, run:

```bash
uname -m
docker --version
docker compose version
systemctl is-active docker
nginx -v
systemctl is-active nginx
df -h /opt
ss -lntH | awk '{n=split($4,a,":"); print a[n]}' | sort -n -u
docker ps -a --format '{{.Names}} {{.Image}}' | grep -i fast-note || true
```

Pass only when architecture is ARM64, Docker and Compose work, Nginx is active, host port `19000` is unused, enough disk exists for two pilot copies plus restore workspace, and no FNS container or unrelated `/opt/fns-pilot` data exists.

- [ ] **Step 3: Inspect private TLS ingress without recording identifiers**

Use `sudo nginx -T` through VibeShell and inspect only in session. Confirm one dedicated hostname and valid certificate can be allocated without modifying 9Router, Hermes, or another service block. Record only `TLS ingress gate: pass` or exact sanitized failure class. Do not copy server names, certificate paths, addresses, or full Nginx output.

If gate fails, stop plan. Do not expose raw FNS port, change Oracle firewall, install Tailscale, or repurpose another service hostname.

- [ ] **Step 4: Update sanitized inventory and verify**

Record versions, `ARM64`, capacity class, and pass/fail only. Then run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
git status --short
```

- [ ] **Step 5: Commit capacity gate**

```powershell
git add docs/current-state/vps-inventory.md docs/current-state/active-goal.md
git commit -m "docs(fns): record pilot preflight"
git push origin research/full-system-design-dev
```

## Task 3: Deploy Server Without Agent Access

**Files:**

- Modify: `deploy/fns/README.md`
- Modify: `docs/current-state/active-goal.md`

**Interfaces:**

- Consumes: passed Task 2 ingress gate and Task 1 artifacts.
- Produces: healthy TLS FNS endpoint with registration closed, no MCP client, no REST integration, and private persistent state.

- [ ] **Step 1: Create exact remote paths**

Through VibeShell, resolve and verify `/opt/fns-pilot`, `/opt/fns-pilot/data`, and `/opt/fns-pilot/restore-test` do not overlap another service. Create only those paths with owner-only write access. Upload `compose.yaml`; create private `.env` through the runbook without printing it.

- [ ] **Step 2: Start loopback-only service**

Run Compose validation and start commands from Task 1. Verify container reports running, loopback request returns an HTTP response, and no new public listener appears on host port `19000`.

- [ ] **Step 3: Add TLS proxy atomically**

Back up exact target Nginx server file outside repository. Insert reviewed location snippet into dedicated TLS block, run `sudo nginx -t`, then reload Nginx. On any syntax or reachability failure, restore that one backup and reload; leave FNS bound to loopback.

- [ ] **Step 4: Bootstrap and close registration**

Use Browser Act with Cốc Cốc for first Web UI registration. Store credential through user's normal credential store, never repository or chat. Confirm exactly one account, change private generated config from `register-is-enable: true` to `register-is-enable: false`, restart container, and verify a second registration attempt is rejected.

- [ ] **Step 5: Prove excluded capabilities remain unused**

Verify no MCP client configuration, REST token consumer, Git remote, local mirror, sharing link, public attachment endpoint, headless client, Hermes vault variable, or second sync process was created. Record pass/fail only.

- [ ] **Step 6: Update runbook and commit observed state**

Add only sanitized deviations needed for repeatable start, stop, and rollback. Run link, secret, whitespace, and status checks. Commit and push:

```powershell
git add deploy/fns/README.md docs/current-state/active-goal.md
git commit -m "docs(fns): record server deployment"
git push origin research/full-system-design-dev
```

## Task 4: Establish Windows and Android Baseline

**Files:**

- Modify: `deploy/fns/README.md`
- Modify: `docs/current-state/active-goal.md`

**Interfaces:**

- Consumes: healthy Task 3 server.
- Produces: two FNS clients on one synthetic vault with ordinary local attachments and measured baseline convergence.

- [ ] **Step 1: Create synthetic pilot vault**

Create new vault `FNS Pilot` on Windows containing only:

```text
plain-note.md
CaseName.md
folder/source.md
attachments/small.png
attachments/large.bin
```

Generate text and binary fixtures locally. Record SHA-256 manifests outside repository. Do not use personal content.

- [ ] **Step 2: Install and authorize Windows plugin**

Install current Fast Note Sync from Obsidian Community Plugins. Paste only generated vault authorization. Disable configuration sync, sharing, Git, Cloud Preview local deletion, and every API or AI integration. Confirm ordinary Markdown and both attachments appear in FNS Web UI.

- [ ] **Step 3: Install and authorize Android plugin**

Install same plugin release in a new empty Android vault. Apply same vault authorization. Exempt Obsidian from battery optimization only for test window and record original device setting for rollback.

- [ ] **Step 4: Prove baseline**

Verify create, edit, rename, delete-to-trash, attachment open, note-history restore, and trash restore in both directions. Compare Windows manifest after Android round trip. Record durations, counts, versions, and pass/fail without hashes or note content.

- [ ] **Step 5: Commit baseline evidence**

Update runbook and active goal. Run repository link, secret, and whitespace checks. Commit and push:

```powershell
git add deploy/fns/README.md docs/current-state/active-goal.md
git commit -m "docs(fns): record client baseline"
git push origin research/full-system-design-dev
```

## Task 5: Run Conflict, Rename, and Attachment Failure Matrix

**Files:**

- Modify: `deploy/fns/README.md`
- Modify: `docs/current-state/active-goal.md`
- Modify: `docs/decisions/unresolved-questions.md`

**Interfaces:**

- Consumes: Task 4 synchronized synthetic vault.
- Produces: observed pass/fail for every known FNS correctness risk relevant to personal migration.

- [ ] **Step 1: Run offline concurrent edit**

Disconnect both clients from server, edit different lines of `plain-note.md` on Windows and Android, reconnect Android then Windows, and inspect manual conflict UI introduced in server `3.6.0`. Pass only when both edits remain recoverable and neither device silently replaces last unique content.

- [ ] **Step 2: Run case-only rename**

Rename `CaseName.md` to `casename.md` on Windows, wait for convergence, then edit it on Android. Pass only when one logical note exists on both devices and history/trash does not contain unexplained duplicate live notes.

- [ ] **Step 3: Run bulk attachment-folder move**

Create five synthetic attachments of mixed sizes, embed all from one note, move containing folder on Android, then rename it on Windows after convergence. Pass only when every embed opens on both clients and SHA-256 manifests match.

- [ ] **Step 4: Run delete and delayed reconnect**

Delete one note and one attachment while Android is offline, modify related note on Windows, then reconnect. Pass only when result matches visible chosen conflict action and deleted bytes remain restorable from trash, history, or independent fixture copy.

- [ ] **Step 5: Run external-writer survival test**

With clients idle, create one synthetic note through server-side supported UI rather than filesystem or API. Confirm it reaches both clients and survives two background sync cycles. Do not introduce a headless client or Hermes. Record external filesystem-writer test as not applicable until a later agent plan.

- [ ] **Step 6: Run Android lifecycle test**

Test screen lock, battery restriction restored to original setting, process swipe-away, device reboot, server outage, and delayed reconnect. Pass only when UI shows actionable state and no fixture disappears silently.

- [ ] **Step 7: Record evidence and commit**

Record exact plugin/server versions, synthetic case names, duration, expected result, observed result, and pass/fail. Do not quote note content or raw logs. Remove only resolved questions. Run repository checks, then commit and push:

```powershell
git add deploy/fns/README.md docs/current-state/active-goal.md docs/decisions/unresolved-questions.md
git commit -m "docs(fns): record failure matrix"
git push origin research/full-system-design-dev
```

## Task 6: Prove Server and Independent Restore

**Files:**

- Modify: `deploy/fns/README.md`
- Modify: `docs/current-state/active-goal.md`

**Interfaces:**

- Consumes: Task 5 stable disposable vault.
- Produces: verified stopped-service archive, off-VPS copy, empty-path server restore, and client reconstruction evidence.

- [ ] **Step 1: Create consistent stopped-service archive**

Pause client activity, stop only FNS Compose project, confirm container stopped, then archive `data/storage` and `data/config` from `/opt/fns-pilot` into a new timestamped file outside live data. Start FNS immediately after archive completes. Never archive a changing SQLite database.

Use:

```bash
set -euo pipefail
cd /opt/fns-pilot
archive_root=/opt/fns-pilot-backups
archive_path="$archive_root/fns-pilot-$(date -u +%Y%m%dT%H%M%SZ).tar.gz"
sudo install -d -m 700 -o "$USER" -g "$(id -gn)" "$archive_root"
restart_fns() {
  docker compose --env-file .env -f compose.yaml up -d
}
trap restart_fns EXIT
docker compose --env-file .env -f compose.yaml stop
tar -C /opt/fns-pilot -czf "$archive_path" data/storage data/config compose.yaml
trap - EXIT
restart_fns
sha256sum "$archive_path"
```

Keep archive path and hash outside repository.

- [ ] **Step 2: Copy archive off VPS**

Use VibeShell `sftp_download` to a new timestamped directory under Windows Documents `Obsidian-Recovery\FNS-Pilot`. Do not place it inside pilot vault, repository, or another synced folder. Compare local SHA-256 with remote value without committing either.

- [ ] **Step 3: Restore into empty isolated path**

Stop live FNS. Extract archive into `/opt/fns-pilot/restore-test`, create a separate private `.env` using an unused loopback port and distinct Compose project name, then start restored service without Nginx exposure. Pass only when synthetic vault, note history, trash, and attachments match recorded counts and manifests. Stop restored service and restart live service.

- [ ] **Step 4: Rebuild one empty client**

Remove only Android disposable vault after confirming archive and Windows copy. Recreate empty vault, authorize FNS, and verify complete synthetic reconstruction. Restore original Android battery setting after test.

- [ ] **Step 5: Record recovery evidence and commit**

Record recovery point, elapsed time, item counts, and pass/fail only. Run repository checks, then commit and push:

```powershell
git add deploy/fns/README.md docs/current-state/active-goal.md
git commit -m "docs(fns): prove pilot recovery"
git push origin research/full-system-design-dev
```

## Task 7: Observe, Promote, or Roll Back Human Pilot

**Files:**

- Modify: `README.md`
- Modify: `docs/README.md`
- Modify: `docs/current-state/active-goal.md`
- Modify: `docs/decisions/decision-log.md`
- Modify: `docs/decisions/unresolved-questions.md`
- Modify: `docs/pull-request-summary.md`

**Interfaces:**

- Consumes: passed Tasks 1-6 and at least seven days of synthetic daily use.
- Produces: accepted human-only FNS pilot, explicit rejection, or continued observation. Never produces Hermes access.

- [ ] **Step 1: Run seven-day observation**

Each day create or edit one synthetic note from each device, add or open one attachment, inspect sync log, and perform one history or trash lookup. Record only counts, latency band, warnings, and pass/fail. Any silent loss or unexplained deletion ends observation immediately.

- [ ] **Step 2: Recheck upstream before decision**

Refresh scorecards, releases, and named open issues. If relevant release changed during observation, do not upgrade automatically. Record change and rerun affected gates in a new isolated cycle.

- [ ] **Step 3: Apply fixed decision rule**

Promote only to a **human-only personal vault pilot** when every required gate passed and seven-day observation has no silent loss, cross-vault access, or failed restore. Keep Hermes, MCP, REST integrations, external filesystem writers, Git automation, and Cloud Preview local deletion disabled.

If any fixed stop condition occurred, export recoverable synthetic content, stop FNS, preserve evidence archive, and set next design action to Syncthing core plus Syncthing Manager replacement evaluation. Do not start Syncthing until FNS is fully stopped and pilot vault has an independent copy.

- [ ] **Step 4: Run complete repository verification**

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
git status --short --branch
```

Expected: every check exits `0`; status lists only intended final documentation files.

- [ ] **Step 5: Commit and push final pilot decision**

```powershell
git add README.md docs/README.md docs/current-state/active-goal.md docs/decisions/decision-log.md docs/decisions/unresolved-questions.md docs/pull-request-summary.md
git commit -m "docs(fns): record pilot decision"
git push origin research/full-system-design-dev
git status --short --branch
```

- [ ] **Step 6: Publish clean history only through publisher**

```powershell
powershell -NoProfile -File scripts/test-publish-feature-clean.ps1
powershell -NoProfile -File scripts/publish-feature-clean.ps1 -Message "feat: prove FNS human sync pilot"
```

Expected: publisher pushes dev first, updates clean branch through exact force-with-lease, leaves current branch on `research/full-system-design-dev`, and leaves worktree clean.

## Explicitly Deferred Agent Plan

Passing this plan does not authorize Hermes access. A later design and plan must choose exactly one path:

- test FNS least-privilege token isolation and server-mediated external writes after issues `#339`, `#346`, and `#391` are resolved or independently disproved; or
- stop FNS and replace whole-vault transport with Syncthing core plus Syncthing Manager before using Hermes filesystem skill; or
- use LiveSync only after encrypted CLI issue `#1036` is fixed in a release and verified on Oracle ARM64.

That later plan must preserve explicit queue authorization and separate proposal output. It may not layer a second sync engine onto FNS vault.

## Plan Self-Review

- **Spec coverage:** FNS-only Windows and Android pilot, integrated history and trash, ordinary attachments, Cloud Preview local retention, private TLS ingress, server-readable content, independent recovery, no agent access, no second transport, and fixed promotion gates all map to tasks.
- **Scope boundary:** One independently testable subsystem ships: human synchronization. Hermes scheduled review, gateway repair, MCP, REST, headless clients, Google Drive live attachments, and personal migration remain outside implementation.
- **Placeholder scan:** Environment-specific hostname, certificate, credentials, and hashes are deliberately discovered and retained outside repository; plan contains a stop gate when safe TLS ingress is unavailable rather than an unspecified setup step.
- **Interface consistency:** Compose variable names, remote paths, host port, backup paths, and documentation files remain identical across tasks.
- **Failure safety:** Every destructive test uses synthetic content and an independent fixture manifest. Restore occurs in an empty isolated path. Rollback never deletes bind-mounted data.
- **Residual risk:** FNS server remains plaintext authority, plugin scorecard does not cover server, Android background behavior is device-specific, and first-account registration needs a short controlled bootstrap. Promotion language remains human-only.
