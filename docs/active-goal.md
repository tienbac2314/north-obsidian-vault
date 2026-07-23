# Active goal

Updated: 2026-07-23

## Objective

Reach first usable synthetic Windows and Android Fast Note Sync vault with agreed plain-Markdown layout. Implement through verified checkpoints and stop at physical-device, account, or safety gate before personal migration.

## Checkpoint

- PR #2 is merged. Branch `feat/fns-release-one` starts from verified `origin/main`.
- Current upstream releases are FNS server `3.6.0` and Obsidian plugin `2.4.0`; server image digest and ARM64 manifest are recorded in deployment contract.
- Open server issues `#339`, `#342`, and `#346` still block personal data and agent consumers.
- Stage 1 contract now defines pinned Compose, loopback bind, closed-by-default registration, secret-bearing runtime config, dedicated tunnel, stopped-service backup, empty-path restore, and rollback.
- Stage 2 read-only Oracle preflight passed architecture, Docker, Compose, disk, loopback port, target-path, and no-existing-FNS checks.
- Preflight disproved old Nginx assumption. DEC-035 selects new dedicated Cloudflare Tunnel without editing existing routes or tunnel processes.
- Pinned FNS server is healthy on IPv6 loopback. Dedicated tunnel and DNS route return TLS health `200` from Windows. WebGUI registration probe returns closed-registration code `410`.
- Stopped-service archive checksum and `runtime/` paths passed. Empty-path same-VPS restore started healthy on alternate loopback port, returned `200`, matched live storage file count, and retained closed registration. Restore tree is preserved.
- Obsidian `1.12.7` is installed. Disposable Windows vault contains agreed 18-directory layout, Home, guide, and four core templates.
- Human accepted the disposable vault trust warning. Restricted Mode is off,
  verified FNS plugin `2.4.0` is enabled, and its Remote Configuration panel is
  reachable.
- One user-selected disposable credential created exactly one synthetic
  account. Its recoverable password record is Windows DPAPI-encrypted outside
  repository and vault.
- Registration was closed immediately after account creation. A second valid
  WebGUI registration request returned application code `410`; no second
  account exists.
- Sole synthetic user is now administrator. Registration remains closed and
  loopback and public health checks still pass.
- Windows Obsidian uses one dedicated REST plus WebSocket token restricted to
  exact `FNS Pilot` vault. Recoverable authorization record is DPAPI-encrypted
  outside repository and vault. Account-wide bootstrap token was revoked.
- Initial and repeated full sync completed. Remote vault contains seven
  synthetic notes and one native SVG attachment.
- Windows gates passed for note convergence, two-version history, recycle-bin
  deletion, restoration to original path, and native attachment sync.
- Human completed physical Android plugin enrollment and reported successful
  initial setup before disconnecting phone. WebGUI later confirmed prior
  Android token use; Android behavior matrix remains unrun.
- Exactly two current manual device tokens remain. Both use REST plus
  WebSocket, 365-day validity, and exact `FNS Pilot` restriction. Windows
  remained WebSocket-online after scope correction; superseded manual attempts
  were revoked without changing WebGUI sessions.
- Live and repository configuration now use 365-day manual-token default.
- Empty Storage Configuration Type dropdown is explained by all optional FNS
  storage providers being disabled. This is expected Release 1 configuration
  plus an upstream missing empty-state message, not browser failure.
- Fresh populated stopped-service archive passed server and Windows checksum
  verification. Off-VPS copy is outside repository and vault under restricted
  Windows ACL; temporary readable VPS export was removed.
- Populated empty-path restore returned health `200`, retained closed
  registration, and matched 105 live storage files. Isolated restore
  container/network were removed; restored files remain preserved.
- Manual protocol-import test briefly created synthetic `FNS+Pilot` because
  form encoding represented space as `+`. Correct import restored exact vault
  name, and accidental remote vault was deleted after equality checks.
- Hermes and 9Router remain outside deployment and receive no vault workload.

## Next action

When phone is next available, run remaining physical-device checklist in
[FNS operations runbook](../deploy/fns/README.md#physical-android-gate):
bidirectional and offline notes, background/battery behavior, rename/move,
history/trash, native attachments, restart, and rebuilt-client recovery. Do not
migrate personal notes.

## Blockers

- Android enrollment passed, but battery/background and lifecycle checks
  require physical device.
- Android bidirectional/offline note, history, trash, rename/move, restart, and
  native-attachment gates remain unrun.
- Current Windows archive is off VPS and ACL-restricted, but does not protect
  against simultaneous Windows and VPS loss.
- Populated same-VPS restore does not replace rebuilt-client recovery test.
- Public TLS endpoint plus unresolved FNS security reports restrict pilot to synthetic content.

## Authority

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- [Architecture modules](architecture/recommended-architecture.md)
- [Behavior and experiments](behavior/capture-to-digest.md)
- [First release](roadmap/mvp.md)
- [Phased roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Git workflow](git-workflow.md)

`docs/archive/`, `docs/superpowers/`, chat history, and NotebookLM output remain history or working evidence unless promoted into current modules or accepted decisions.
