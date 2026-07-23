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
- Manual protocol-import test briefly created synthetic `FNS+Pilot` because
  form encoding represented space as `+`. Correct import restored exact vault
  name, and accidental remote vault was deleted after equality checks.
- Hermes and 9Router remain outside deployment and receive no vault workload.

## Next action

On physical Android device, install Obsidian and verified Fast Note Sync
`2.4.0`, create an empty disposable vault, enroll a separate Android token
restricted to `FNS Pilot`, record default battery/background behavior before
applying any exemption, then run bidirectional note plus attachment convergence.
Follow the physical-device checklist in the
[FNS operations runbook](../deploy/fns/README.md#physical-android-gate). Do not
migrate personal notes.

## Blockers

- Physical Android plugin installation and battery/background checks require user device.
- Android note, history, trash, and native-attachment gates remain unrun.
- Independent off-VPS backup destination remains later promotion gate.
- Same-VPS restore rehearsal does not replace off-VPS archive copy or rebuilt-client recovery test.
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
