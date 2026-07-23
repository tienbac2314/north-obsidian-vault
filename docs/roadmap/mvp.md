# First production-worthy release

Status: current executable release-one roadmap under DEC-027, DEC-028, and DEC-034. Execute sequentially and stop at failed gate.

## Outcome

Deliver a human-only Obsidian workspace whose Windows/Android synchronization, attachment behavior, and independent recovery have been proven with synthetic data before bounded personal migration. “Production-worthy” means recoverable and understandable under failure, not feature-rich.

Hermes vault access is not part of this release. It begins a later release only after human system passes, gateway stabilizes, and explicit transport/authorization design is approved.

## Included

- Dusk-inspired optional vault structure without Dusk plugin runtime.
- Non-destructive core vault initializer, plain home note, operating guide, and core templates.
- Fast Note Sync as only whole-vault transport in isolated Windows/Android pilot.
- Fast Note Sync as the only release-one community plugin required by this design; use Obsidian core features for the initial home note and learning structure.
- One private pinned FNS server behind existing TLS Nginx boundary.
- Integrated FNS current files, history, trash, and native attachment tests.
- Same normal Obsidian attachment capture, links, embeds, and offline bytes on Windows and Android.
- Stopped-service FNS copy, off-VPS independent vault copy, and empty-path restore.
- Seven days of synthetic observation.
- Explicit decision record for personal-data promotion or FNS rejection.
- Weekly/monthly learning behavior prepared but not counted as proven until personal-use observation.

## Excluded

- Personal notes before every synthetic gate passes.
- Hermes, 9Router proposal calls, agent schedules, or vault credentials.
- FNS MCP, REST consumers, Git automation, filesystem mirror, third-party headless clients, or sharing.
- Syncthing, Self-hosted LiveSync, Google Drive whole-vault sync, or second sync transport.
- Drive, S3, CDN, external-folder, or other live attachment-offload plugin.
- FNS Cloud Preview automatic local deletion.
- Dusk `.obsidian` configuration, scripts, CSS, dashboards, plugin settings, sample content, and optional community plugins such as Datacore, QuickAdd, Tasks, Dataview, or Templater.
- OpenViking, embeddings, Telegram ingestion, custom watcher/service, workflow SQLite, or automatic proposal apply.
- Automatic updates, moves, renames, merges, deletes, archive actions, filing, or link repair.

## Fixed constraints

- Follow [system design](../system-design.md), [recommended architecture](../architecture/recommended-architecture.md), [failure handling](../architecture/failure-handling.md), and [security contract](../architecture/security.md).
- Use synthetic content and disposable FNS vault until promotion decision.
- Keep credentials, private endpoints, account data, fixture hashes, raw logs, databases, and archives outside repository.
- Record public versions, sanitized counts, latency bands, warning categories, recovery time, and pass/fail only.
- One failed safety gate stops promotion. Do not compensate by stacking another transport or enabling more plugins.
- Each phase produces one independently reviewable repository change and exact verification evidence.

## Stage map

| Stage | Deliverable | Primary gate | Failure action |
|---|---|---|---|
| 0 | Approved modular design and repository contract | No conflicting current authority | Fix docs before runtime |
| 1 | Deployment and recovery contract | Static validation and secret boundary | Redesign contract |
| 2 | Read-only VPS preflight | Capacity, ARM64, TLS, port, path safety | Stop before mutation |
| 3 | Private FNS server | Private ingress, closed registration, persistence | Roll back isolated paths |
| 4 | Bootstrapped Windows/Android baseline | Core layout plus basic convergence, history, trash, attachments | Preserve copies; reject |
| 5 | Cross-platform attachment baseline | Same capture model and byte equality | Block affected file class |
| 6 | Conflict and failure matrix | No silent loss or unexplained deletion | Reject FNS |
| 7 | Independent recovery | Empty-path restore and rebuilt client | Block personal data |
| 8 | Seven-day observation | Stable daily synthetic use | Return to failed experiment |
| 9 | Human promotion decision | Every gate has evidence | Promote narrowly or stop |

## Stage 0: Documentation and authority cutover

### Deliverables

- [Executive summary](../executive-summary.md) explains current direction.
- [System design](../system-design.md) owns product and architecture behavior.
- `docs/architecture/` owns component, option, data, failure, diagram, and security detail.
- `docs/behavior/` owns user flow, examples, and experiments.
- `docs/roadmap/` owns release execution and later promotion order.
- Decision log supersedes thin `docs/spec.md` and `docs/roadmap.md` authority.
- Root README and documentation map reach every tracked Markdown file.

### Gate

- No release-one instruction prescribes Syncthing-first, custom mutation service, workflow SQLite, OpenViking, Telegram ingestion, or automatic apply.
- FNS, attachment, plugin, staging, bootstrap, and deferred-Hermes boundaries match DEC-019, DEC-021, DEC-028 through DEC-034, and modular promotion decision.
- Link, reachability, secret, Mermaid, and whitespace checks pass.

### Rollback

Documentation-only: restore previous commit. No runtime state exists.

## Stage 1: Deployment and recovery contract

Create repository-owned runtime design artifacts before touching VPS:

- Compose service with pinned FNS server image/release;
- loopback-only container/service port;
- persistent storage and configuration paths isolated from Hermes and 9Router;
- existing TLS Nginx location with private exposure policy;
- controlled registration bootstrap, then closure;
- start, stop, health, upgrade, backup, empty-path restore, rollback, and removal commands;
- configuration and secret boundary;
- sanitized evidence template matching [experiments](../behavior/experiments.md).

### Verification

- Compose renders without `latest`, privileged mode, host network, Docker socket, public raw bind, or secret literals.
- Nginx snippet passes syntax validation in safe non-mutating context.
- Backup/restore commands target exact isolated paths and avoid delete/purge/mirror semantics.
- Repository link, secret, whitespace, and applicable configuration checks pass.

### Gate

Reviewer can identify exact data paths, ports, versions, rollback targets, recovery contents, and secret locations without reading chat history.

### Stop conditions

- Upstream server has no pin-able release for required architecture.
- Contract requires exposing raw service publicly.
- Recovery cannot copy server state consistently.
- Paths overlap existing services or synchronized vault.

## Stage 2: Read-only VPS preflight

Through VibeShell, inspect without changing state:

- Oracle architecture and OS;
- Docker Engine and Compose compatibility;
- Nginx ownership, include layout, and syntax-check path;
- disk capacity and expected recovery-copy headroom;
- unused loopback port;
- TLS ingress capacity and certificate boundary;
- proposed FNS data/config path absence;
- existing containers/processes listening on proposed port;
- current Hermes/9Router supervisor ambiguity only as deployment exclusion boundary.

### Evidence

Record public versions and pass/fail. Do not copy hostnames, IPs, account identifiers, endpoints, configuration bodies, credentials, or raw logs.

### Gate

ARM64 compatibility, safe isolated paths, sufficient storage, private ingress, and no collision are proven.

### Stop conditions

- FNS server release lacks compatible ARM64 artifact.
- Private TLS ingress cannot be added safely.
- Proposed paths or port conflict with existing service.
- Disk cannot hold live state plus at least one stopped-service copy.

## Stage 3: Private FNS server

### Implementation

1. Create exact isolated directories from contract.
2. Deploy pinned FNS server with loopback-only raw bind.
3. Add approved TLS ingress without altering unrelated routes.
4. Start service and inspect bounded health signals.
5. Bootstrap one disposable account through Cốc Cốc.
6. Close registration.
7. Confirm no FNS API consumer, MCP, Git remote, mirror, sharing link, headless client, Hermes variable, or second sync process is configured.

### Gate

- TLS endpoint works.
- Raw service port is not publicly reachable.
- Second uncontrolled registration fails.
- Restart preserves empty pilot service state.
- Rollback removes only exact FNS resources.

### Rollback

Stop and remove exact isolated FNS service/resources, preserve deployment evidence, and leave Hermes, 9Router, Nginx unrelated routes, firewall, and other containers unchanged.

## Stage 4: Synthetic Windows/Android baseline

### Bootstrap

1. Run `scripts/test-initialize-vault-template.ps1`.
2. Run `scripts/initialize-vault-template.ps1` against exact disposable vault path.
3. Confirm initializer creates every documented core folder, `HUB/Home.md`, operating guide, and Daily, Weekly, Literature, and Permanent templates.
4. Add sentinel text to every copied starter file, rerun initializer, and confirm all remain unchanged; automated test also rejects self-copy, reparse, non-file collision, and unlisted template content.
5. Open vault on Windows and Android. Confirm home and guide render, folders are visible, and no community plugin except later FNS requirement was introduced.
6. In Obsidian core settings on both clients, set attachment folder to `SYSTEM/Media`. Do not copy Dusk `.obsidian` state.

### Fixtures

Create disposable vault containing:

- ordinary Markdown notes in root and nested folder;
- same-note conflict fixture;
- `API.md` case-only rename fixture;
- note with small image;
- note with large binary attachment;
- folder with several mixed attachments;
- delete/history/trash fixture;
- file created outside Obsidian for later survival test.

Keep fixture hashes outside repository. Repository records fixture class and equality result only.

### Client setup

- Install same current FNS plugin on Windows and physical Android.
- Connect only disposable vault/account.
- Disable configuration sync and unapproved features.
- Keep Cloud Preview automatic local deletion off.
- Apply Android battery/background settings only when experiment calls for it; record default first.

### Basic cases

1. Windows create, Android receive and edit, Windows receive.
2. Android create offline, reconnect, Windows receive.
3. Rename and folder move.
4. Delete, inspect trash, restore.
5. Edit, inspect history, restore earlier version.
6. Open small and large native attachment on both devices.
7. Restart both clients and FNS server.

### Gate

Core scaffold exists on both clients; starter files remain plain Markdown; repeat initializer preserves existing files. All fixture bytes and intended changes converge; history/trash actions are understandable; no cross-vault or unexplained deletion appears.

## Stage 5: Cross-platform attachment baseline

### Preflight refresh

Before testing, recheck current FNS plugin/server releases, Obsidian scorecard, attachment documentation, configured size limits, and relevant open issues. If material behavior changed, update research and decision before proceeding.

### Client configuration

1. Configure `SYSTEM/Media` as normal vault attachment folder on Windows and Android.
2. Keep normal Obsidian vault-relative links and embeds.
3. Confirm no Drive, S3, CDN, external-folder, or whole-vault cloud plugin is active.
4. Keep FNS Cloud Preview automatic local deletion off.
5. Keep original external source until first peer-open and byte-equality check passes.

### Basic cases

- Windows: paste image; drop image/video/audio/PDF; select arbitrary binary.
- Android: paste image where supported; capture/select image; select video/audio/PDF and arbitrary binary.
- Open every synchronized attachment from both clients after convergence.
- Repeat one capture and verify duplicate behavior is understandable.
- Interrupt one transfer, preserve source byte, reconnect, and verify final equality.
- Increase file size until acceptable operating band and first failure are measured.

### Gate

Both clients produce normal vault files and understandable links or embeds. Every converged peer byte matches expected source. Delayed or failed transfer remains visible and never deletes only source. No public URL, provider-specific link, or second attachment authority appears.

### Rollback

Preserve fixture and evidence, stop personal promotion for failed capture or file class, and keep FNS as sole live synchronization transport. Vault byte remains canonical content authority. Do not install an offload plugin as workaround without new decision.

## Stage 6: Conflict and failure matrix

Run exact cases from [EXP-003 through EXP-005](../behavior/experiments.md):

1. both clients offline with divergent same-note edits;
2. case-only rename plus peer edit;
3. multi-attachment folder move and rename;
4. note and attachment delete while peer offline;
5. Android screen lock, battery restriction, swipe-away, reboot, server outage, and delayed reconnect;
6. FNS service restart and pinned upgrade/rollback rehearsal;
7. Windows and Android native capture across image/video/audio/PDF/arbitrary binary;
8. attachment rename and folder move;
9. attachment delete while peer is offline, then restore;
10. duplicate capture and interrupted transfer;
11. large-file operating band and first visible failure;
12. external synthetic file behavior under normal FNS background sync.

### Evidence table per case

| Field | Record |
|---|---|
| Fixture | Synthetic class only |
| Versions | Public plugin/server/app versions |
| Preconditions | Online/offline/background/service state |
| Operation order | Numbered exact actions |
| Expected | Safe behavior from failure contract |
| Observed | Sanitized state and warning category |
| Recovery | Exact user-visible recovery action |
| Result | Pass, fail, or blocked with reason |

### Gate

Unique bytes and meanings remain recoverable. Links remain understandable. No unintended second copy, silent winner, cross-vault access, or unexplained external-file deletion appears.

### Stop conditions

Any silent loss, unrecoverable conflict, link to missing byte without visible failure, cross-vault access, or external-file deletion immediately stops promotion.

## Stage 7: Independent recovery

### Plain vault

1. Wait for one client to show full convergence, then stop writes.
2. Copy actual vault Markdown and attachment files directly from that client to storage outside FNS, the synchronized vault, and VPS.
3. Exclude plugin credentials and machine-specific secret state.
4. Generate and verify file count, byte count, and content-hash manifest outside repository.
5. Restore copy into empty ordinary filesystem directory without FNS.
6. Open restored directory as Obsidian vault and verify note readability, links, folders, and attachments.

### FNS service and client rebuild

1. Stop client writes.
2. Stop FNS consistently.
3. Archive FNS storage and required non-secret configuration.
4. Restart live service promptly.
5. Copy archive off VPS.
6. Verify copy integrity outside repository.
7. Restore into empty isolated server path.
8. Verify note, history, trash, and attachment counts.
9. Connect one empty client and rebuild vault.
10. Compare fixture state and open attachments.

### Independent attachment proof

1. Open each restored attachment from native note link without live FNS.
2. Compare restored byte manifest with pre-copy fixture manifest.
3. Confirm recovery copy contains no plugin credentials or private identifiers in repository.

### Gate

Plain Markdown and attachments recover without FNS. FNS service state recovers without primary device or live server state. Every restored attachment byte matches expected fixture. Recovery duration and any manual native-link repair boundary are explicit.

## Stage 8: Seven-day synthetic observation

For seven consecutive days, use synthetic data from both devices:

- create or edit one note;
- add or open one native attachment, varying client, type, and size;
- inspect sync status;
- perform one history or trash lookup;
- vary online/offline and foreground/background conditions;
- record one concise daily pass/fail row.

Stop immediately on silent loss, unexplained deletion, inaccessible recovered attachment, cross-vault access, failed restore, or recurring manual repair.

### Gate

Seven complete daily rows, no unresolved safety failure, and one final restore spot-check.

## Stage 9: Human promotion decision

Choose one outcome and record it in decision log:

### Promote FNS

Allowed only when every gate passes. Begin bounded human personal-data pilot with Hermes and all agent/API paths still disabled. Keep attachments as normal FNS-synchronized vault files. Define backup destination, cadence, retention, configuration-sync subset, and rollback trigger first.

### Reject FNS

Stop FNS completely, preserve all copies, and evaluate Syncthing core plus Syncthing Manager in a new disposable vault. Never run both against same vault.

### Remain local-only

Valid outcome when no sync option passes. Obsidian workflow and learning loop remain useful without cross-device automation.

## Repository delivery per stage

1. Start from current `main` on short-lived task branch after legacy PR merges.
2. Update [active goal](../active-goal.md) with exact checkpoint and next action.
3. Make one logical verified commit containing artifact and sanitized evidence.
4. Push normally and integrate through PR.
5. Run link, secret, whitespace, and applicable Mermaid/config checks.
6. Never commit sensitive evidence or rewrite pushed history.

## Exit criteria

First production-worthy human release exists only when:

- documentation authority and deployment contract are complete;
- private FNS server deployment and rollback work;
- physical Windows/Android baseline and failure matrix pass;
- native Windows/Android attachment behavior matches documented authority;
- independent plain-vault, FNS-service, and attachment-byte recovery succeeds;
- seven-day synthetic observation completes;
- decision log records bounded human-pilot outcome;
- Hermes, FNS APIs, headless clients, Git automation, and second transports remain disabled.

Passing this release proves human sync only. It does not prove agent safety, provider privacy, long-term reliability, or learning-loop effectiveness.
