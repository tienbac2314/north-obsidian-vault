# Active goal

Updated: 2026-07-25

## Objective

Complete Dusk Goal 1 discovery from the fixed local source bundle and physical
Android copy before asking about personalization or changing the live vault.

Status: Goal 1 functional correction completed on 2026-07-25. PR #7 remains
draft pending independent re-review. No Dusk import, plugin decision,
personalization choice, or promotion plan is accepted.

## Checkpoint

- Pull request #6 is merged at `571fde4`; current `main` contains reversal
  authority.
- Sole current Dusk source authority is
  `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master`.
- [Goal 1 preflight](research/2026-07-25-dusk-goal1-preflight.md) passed for
  repository, source, storage, Obsidian, research, browser, custom-agent, ADB,
  screenshot, UI-tree, log, and filesystem access.
- [Goal 1 discovery](research/2026-07-25-dusk-goal1-discovery.md) covers all 18
  requested deliverables and physical-Android additions.
- [Independent review](research/2026-07-25-dusk-goal1-review.md) previously
  returned **PASS**. That verdict is superseded pending review of the
  functional correction.
- [Functional revalidation](research/2026-07-25-dusk-plugin-functional-revalidation.md)
  proves 44/44 light and 52/52 full selected plugins on Windows, plus 42/42
  light and 49/49 full selected plugins on Android after restart.
- Initial runtime copies containing 31 source plugin `data.json` files are
  quarantined and excluded from promotion evidence. Corrected pre-open
  checkpoints contain zero plugin `data.json`, token, or risky-name paths.
- Home, Map of Content, Mail Box, and dependent dynamic surfaces render in
  reading view on Windows and Android after enabling the two explicit
  Dataview JavaScript flags. Earlier raw Datacore findings came from editing
  mode.
- [Source manifest](research/2026-07-25-dusk-source-manifest.md) records 1,571
  files and 421 directories. PC and tablet safe manifests match at SHA-256
  `D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB`;
  146 sensitive/configuration files remain intentionally unopened.
- Raw evidence and disposable copies use
  `G:\Dusk-Goal1-Discovery-20260725`, outside `G:\Obsidian`.
- Goal 1 is discovery only. Source bundle, tablet source, `G:\Obsidian`, FNS
  account/configuration, and current authority receive no runtime promotion.
- [DEC-039](decisions/decision-log.md#dec-039-archive-hand-built-phase-2-and-restart-import-first)
  supersedes the hand-built Dusk recreation from closed PR #4.
- Exact PR #4 history remains on archived branch `feat/obsidian-phase2` at
  `5c689ef`; the [reversal record](archive/2026-07-24-phase-2-reversal.md)
  indexes reusable evidence and rollback state.
- Live vault returned to its pre-Phase-2 content baseline with Notion preserved,
  only FNS enabled, FNS Configuration Sync disabled, and Obsidian core Sync
  disabled.
- [DEC-038](decisions/decision-log.md#dec-038-record-existing-personal-vault-exception)
  records existing Notion content as a bounded current-state exception, not a
  completed personal-data promotion.
- Project-scoped Dusk inventory, plugin, visual, debugger, and release-review
  agents are merged through PR #5. Main agent alone may promote live-vault
  changes.
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
- Plain-vault recovery copy contains all eight synthetic user files under the
  six approved content roots, matches source SHA-256 hashes, excludes
  `.obsidian` and FNS credentials, and has a restricted Windows ACL.
- Human opened the plain-vault recovery copy as an ordinary Obsidian vault and
  confirmed required folders, notes, and SVG attachment were readable.
- Active Windows vault moved to the requested non-system data volume by
  copy/hash/verify/delete. All 24 files and 1,572,986 bytes matched before old
  source removal. Obsidian reopened the new root, FNS `2.4.0` re-enabled after
  the expected first-open trust prompt, full sync completed, and service status
  returned connected.
- Manual protocol-import test briefly created synthetic `FNS+Pilot` because
  form encoding represented space as `+`. Correct import restored exact vault
  name, and accidental remote vault was deleted after equality checks.
- Hermes and 9Router remain outside deployment and receive no vault workload.
- Ground-up setup documentation is now a conventional standalone OSS-style
  guide. It supports direct human use or automation without assuming a live
  human-agent choreography.

## Next action

Complete independent re-review and return PR #7 to ready only on PASS. The
user can then use the
[PR review guide](research/2026-07-25-dusk-pr-review-guide.md) to select one
Goal 2 workflow. Do not personalize or promote into `G:\Obsidian` before a
concise design and implementation plan are accepted.

## Deferred promotion work

- Dusk source choice, populated versus empty base, Discord deltas, plugin
  upgrades, AI-note tooling, mobile defects, and live promotion remain
  undecided.
- Existing Notion bytes remain a bounded exception; do not add more personal or
  employer content until promotion gates are reconciled.
- Full Android battery/background, offline, conflict, rename/move, restart, and
  attachment matrix remains future promotion evidence.
- Current Windows archive is off VPS and ACL-restricted, but does not protect
  against simultaneous Windows and VPS loss.
- A rebuilt-client drill and seven-day synthetic observation remain optional
  follow-on promotion work, not Phase 1 installation work.
- Public TLS endpoint plus unresolved FNS security reports restrict the pilot to
  synthetic fixtures and the preserved DEC-038 Notion exception; no additional
  personal or employer content is authorized.

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
