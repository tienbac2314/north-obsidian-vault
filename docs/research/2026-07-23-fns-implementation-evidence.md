# FNS implementation evidence and Oracle preflight

Status: current dated implementation evidence. Public facts and sanitized
observations support Stage 1 and Stage 2 and prove bounded synthetic Windows
sync. Android and personal-data use remain unproven.

Observed: 2026-07-23.

## Public release facts

- Fast Note Sync server [`3.6.0`](https://github.com/haierkeys/fast-note-sync-service/releases/tag/3.6.0) was published 2026-07-20. Release supplies Linux ARM64 binary and multi-platform Docker image.
- Obsidian Fast Note Sync plugin [`2.4.0`](https://github.com/haierkeys/obsidian-fast-note-sync/releases/tag/2.4.0) was published 2026-07-20 and declares mobile support. Server and plugin release notes add manual conflict resolution.
- Verified Docker index digest is `sha256:560ab727f2a0bac804a6db9e467b68d7df1a1cf059e72dfccc0412aa4c62e89e`; ARM64 manifest is present.
- Server issues [`#339`](https://github.com/haierkeys/fast-note-sync-service/issues/339), [`#342`](https://github.com/haierkeys/fast-note-sync-service/issues/342), and [`#346`](https://github.com/haierkeys/fast-note-sync-service/issues/346) remain open. Passed Obsidian plugin review does not cover these server and authorization reports.
- Upstream configuration defaults include open registration and static example token keys. Deployment contract replaces them with closed registration and generated runtime-only keys.

## Sanitized Oracle preflight

| Check | Observed result | Gate |
|---|---|---|
| Architecture and OS | ARM64; Ubuntu 24.04 | Pass |
| Docker Engine | 29.1.3 | Pass |
| Docker Compose | 2.40.3 | Pass |
| Free root filesystem capacity | about 28 GB | Pass for synthetic pilot and one stopped-service copy |
| Proposed loopback port | unused | Pass |
| Proposed isolated runtime root | absent | Pass |
| Existing FNS container | none | Pass |
| Host Nginx | installed, valid configuration, inactive, no enabled route | Reject as assumed ingress |
| Cloudflare Tunnel | installed, active managed and PM2-supervised processes, valid local credentials | Pass only with new isolated tunnel |
| Existing tunnel routes | three, none to be edited | Isolation requirement |
| Host firewall | inactive; raw FNS bind must remain loopback | Mandatory control |

No hostname, IP address, account identifier, endpoint, credential, configuration
body, or raw log is recorded.

## Implementation inference

Observed host does not have reusable Nginx ingress described by earlier plan.
Starting dormant Nginx or inserting FNS into existing routes would create
unnecessary coupling. Dedicated Cloudflare Tunnel gives exact rollback boundary
while retaining loopback-only origin.

TLS hostname remains internet-reachable and FNS-authenticated. This does not
resolve reported server risks. Therefore:

- synthetic disposable account and vault only;
- no personal or employer content;
- no MCP, external REST consumer, sharing, Git, mirror, configuration sync, or headless client;
- no change to existing tunnel routes or process supervisors;
- failure preserves state and stops promotion.

Operational commands and recovery contract live in [FNS pilot operations](../../deploy/fns/README.md).

## Implementation checkpoint

Observed later on 2026-07-23:

- Pinned server image started healthy with all Linux capabilities dropped and raw listener on IPv6 loopback only.
- Dedicated unprivileged tunnel service validates its isolated configuration. Existing two cloudflared processes and three earlier routes were not edited.
- TLS health returned HTTP `200` from Windows. Oracle resolver retained stale DNS during immediate verification, so remote self-check was not treated as public-path authority.
- Before account bootstrap, registration remained closed and a WebGUI-compatible
  probe returned application code `410`. No FNS user, token, or vault existed
  at that checkpoint.
- Obsidian `1.12.7` and verified FNS plugin `2.4.0` assets were installed for one disposable Windows vault.
- Vault initializer regression passed, then created 18 directories and six starter files. Top-level roots are `DAILY`, `HUB`, `PARA`, `STAGING`, `SYSTEM`, and `ZETA`.
- Human accepted Obsidian's first-open vault trust warning. Restricted Mode is
  off, FNS plugin `2.4.0` is enabled, its Remote Configuration panel is
  reachable, and it reports the expected disconnected state before enrollment.
- One controlled registration window exposed the FNS WebGUI registration form.
  No credential was entered and no account or token was created. Registration
  was closed again before waiting for account-creation confirmation; loopback
  and public TLS health both remained HTTP `200`.
- After explicit action-time confirmation, one user-selected disposable
  credential created one synthetic account with a reserved non-deliverable
  email address. Its recoverable password record is Windows DPAPI-encrypted
  outside repository and vault; no credential value or account identifier is
  recorded here.
- Registration was closed immediately after Dashboard appeared. A second valid
  WebGUI registration request returned HTTP `200` with application code `410`;
  no second account was created.
- After explicit authorization, the sole synthetic user became system
  administrator. Registration stayed closed; loopback and public TLS health
  remained HTTP `200`.
- WebGUI created one Windows authorization restricted to exact `FNS Pilot`
  vault and REST plus WebSocket sync. Its recoverable record is
  DPAPI-encrypted outside repository and vault. The earlier account-wide
  bootstrap token was revoked after the restricted token connected.
- Windows client name is the neutral label `Windows Pilot`; no personal device
  name is used.
- Initial and repeated full sync completed. Remote inventory reached seven
  synthetic notes and one 286-byte SVG attachment.
- Synthetic note produced two recoverable history versions. Deletion appeared
  in FNS recycle bin, restore succeeded, and local note returned at original
  path with history marker and attachment embed intact.
- Manually reconstructed Obsidian protocol URI encoded a space as `+`, which
  created an accidental synthetic `FNS+Pilot` vault. FNS handler retained that
  character literally. Re-import with `%20` restored exact `FNS Pilot`;
  repeated full sync made inventories equal, then accidental vault was deleted.
- No MCP consumer, external REST consumer, Git integration, sharing link,
  mirror, configuration sync, or headless client was enabled.

Two runtime failures were contained before public use:

1. Capability-dropped container could not write host-owned `0700` bind mount. Contract now makes FNS config and storage root-owned before first start.
2. Dedicated tunnel account could not traverse deployment root, then `localhost` selected IPv4 against IPv6-only listener. Contract now grants traverse-only root access and pins tunnel origin to exact IPv6 loopback.

No personal notes entered pilot. Physical Android enrollment remains next gate.

## Android enrollment and token correction

Observed later on 2026-07-23:

- A physical Android device connected over authorized ADB. Obsidian `1.12.7`
  was installed, and the human reported successful FNS plugin enrollment before
  disconnecting the phone.
- FNS WebGUI showed prior Android token use and one current Windows WebSocket
  connection. This proves account and transport enrollment, not Android
  background or recovery behavior.
- Manual recreation had left several superseded device tokens and made the two
  newest device tokens vault-unrestricted. The newest Windows and Android
  tokens were edited without rotation to retain REST plus WebSocket access,
  365-day validity, and exact `FNS Pilot` vault restriction.
- Windows remained WebSocket-online after scope correction. Five superseded
  manual tokens, including never-used attempts, were revoked. Exactly two
  manual device tokens remain; WebGUI login sessions were not changed.
- Live runtime configuration already used `security.token-expiry: 365d`,
  retained closed registration, and kept FNS running. Repository template and
  human setup now use same device-token policy. WebGUI shows `366days`
  immediately after a 365-day edit because it displays the current partial day
  inclusively.

Phone disconnected before bidirectional note, offline-create, background,
battery, rename/move, history/trash, native attachment, restart, and rebuilt
client gates. Those tests remain open.

## Empty storage type diagnosis

The authenticated WebGUI reproduced an empty **Storage Configuration** Type
dropdown without console failure. Exact server `3.6.0` source and runtime
contract explain it:

- WebGUI requests `/api/storage/enabled_types`.
- Server
  [`GetEnabledTypes`](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/internal/service/storage_service.go#L194)
  returns only providers enabled in server configuration.
- Release 1 deliberately disables local filesystem, Aliyun OSS, AWS S3,
  Cloudflare R2, MinIO, and WebDAV storage providers. Empty list is therefore
  correct for this deployment.
- WebGUI has an upstream usability gap: it renders a blank selector instead of
  explaining that no provider is enabled.

English and Chinese GitHub issue searches included storage configuration,
storage type, dropdown, no options, `存储配置`, `存储类型`, `下拉框`,
`无法选择`, and `没有选项`. No exact report for this empty state was found.
Chinese reports were included because much of upstream issue traffic is
Chinese; absence of a matching issue is not proof no report exists.

Release 1 fix is documentation, not enabling optional backup subsystem. A later
approved provider would require runtime-only credentials, one explicit enable
flag, restart, enabled-type response verification, and synthetic backup/restore
test. Upstream UI fix should render a disabled explanatory state for empty
response.

## Empty-state recovery rehearsal

With registration closed and no user vault:

- stopped dedicated tunnel and FNS service before archive;
- created one checksum-verified archive containing `runtime/config`, `runtime/storage`, and `runtime/cloudflared`;
- restored into previously absent isolated path;
- started restored Compose project on different loopback port without tunnel exposure;
- restored container became healthy and health endpoint returned HTTP `200`;
- live and restored storage each contained nine files;
- restored configuration retained closed registration;
- stopped restored container/network and preserved restore tree for inspection;
- restarted live FNS and dedicated tunnel successfully.

This proves archive shape and same-VPS empty-path service startup. It does not
prove off-VPS custody, independent vault recovery, history/trash recovery after
real use, or rebuilt-client recovery. Those gates remain.

## Populated backup and restore rehearsal

After Windows and Android enrollment:

- stopped live FNS and created a new root-owned archive plus SHA-256 manifest
  from current `runtime/config`, `runtime/storage`, and
  `runtime/cloudflared`;
- restarted live service and verified loopback health plus server-side archive
  checksum;
- copied archive and checksum to Windows outside repository and vault;
- independently recomputed local SHA-256 and matched manifest;
- verified archive contains 137 entries and required runtime paths;
- restricted exact Windows backup directory ACL to current user, SYSTEM, and
  local Administrators with inherited access removed;
- removed temporary readable VPS export copies while retaining root-owned
  server archive;
- extracted server archive into a new absent restore root;
- started restored FNS on isolated alternate loopback port with no tunnel;
- received HTTP `200`, retained closed registration, and matched all 105
  storage files against live runtime at checkpoint;
- stopped and removed isolated restore container and network while preserving
  restored files for inspection.

This passes current-state archive shape, off-VPS custody, checksum, populated
same-VPS startup, and live/restore file-count gates. It does not prove recovery
after Windows loss, rebuilt-client convergence, or Android recovery. Archive
contains secret-bearing runtime state; keep its restricted directory outside
cloud sync, repository, and vault.

## Plain-vault recovery and local relocation

Windows-side checks separated portable notes from sync runtime:

- stopped Obsidian/FNS client activity before snapshot and confirmed source
  hashes stayed stable;
- copied only the six approved content roots into a dated recovery directory
  outside repository and live vault;
- recovered seven Markdown notes and one SVG attachment, totaling 18,169
  bytes;
- generated and rechecked a SHA-256 manifest with exact source/restored file
  equality;
- excluded `.obsidian`, plugin data, token material, and UI state;
- removed inherited permissions from the recovery directory and retained only
  current user, SYSTEM, and local Administrators.

The live vault was then relocated to the requested non-system data volume:

- Obsidian closed cleanly before filesystem work;
- destination was an existing empty directory and no nested vault directory
  was created;
- all 24 files and 1,572,986 bytes, including `.obsidian`, matched SHA-256
  before deleting the old source;
- Obsidian registered and opened the new vault root;
- the expected first-open trust prompt appeared for the newly registered vault
  location; the already verified FNS plugin was re-enabled;
- FNS `2.4.0` reported service connected and completed full sync after reopen.

This proves portable plain-note recovery and safe local relocation. It does not
prove rebuilt-client convergence from server state or Android recovery.
