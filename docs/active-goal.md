# Current active goal

Current work is the North UX simplification goal below. Phase 1 material in
this file is historical and superseded; it remains for traceability only.

Updated: 2026-07-24

## Historical Phase 1 foundation (superseded)

### Objective

Preserve the completed Phase 1 FNS foundation, record the abandoned hand-built
Phase 2 attempt, and prepare a concise import-first Dusk evaluation without
changing the live vault.

Status: Phase 1 complete. Phase 2 PR #4 was closed without merge and its live
changes were rolled back on 2026-07-24. No Dusk import source, plugin set, or
promotion plan is currently accepted.

### Checkpoint

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

## Current North UX simplification goal

Updated: 2026-08-18

Status: active. This is a current parallel goal for the live North vault. It
does not reopen historical Phase 2 records.

- Objective: make Windows and Android vault management obvious to a first-time
  Obsidian user without exposing plugin internals or brittle template paths.
- Scope: creation, family and child notes, folder placement, naming, capture,
  period notes, task controls, navigation, Notebook Navigator, File Explorer,
  Note Toolbar, QuickAdd, Templater, Bases/Datacore surfaces, onboarding,
  status icons, sync parity, rollback, and safe defaults.
- Current fact: North has multiple creation doors. QuickAdd owns family and
  child routes, Note Toolbar exposes another menu, Templater folder triggers
  create child notes in PARA roots, and native File Explorer exposes generic
  creation. Main problem is duplicated doors and labels, not missing templates.
- Research fact: public Obsidian `workspace.on('file-menu')` and
  `Menu.addItem()` can add custom file actions. Public API does not safely
  reorder or remove built-in entries. Commander advertises hide/reorder support
  but adds another plugin and does not implement North family routing by itself.
- Research fact: QuickAdd documents Template, Capture, Macro, and Multi as
  separate choices; Multi is an organizational group. Templater supports
  explicit template/folder creation but has documented asynchronous creation
  edge cases. Family creation must have one owner.
- Research fact: Agent Reach through Cốc Cốc/OpenCLI is connected. Reddit
  Notebook Navigator release posts show calendar period creation, property
  browsing, manual sort, custom group headers, and mobile limitations. Treat
  Reddit as advisory; verify installed behavior before implementation.
- Agent Reach retry: `opencli v1.8.6`, extension `v1.0.22`, profile connected.
  Fresh Notebook Navigator release evidence says NN can create/open daily
  notes from its calendar, show custom properties and task icons, use folder
  note templates, filter by dates/tasks, and expose folder/tag navigation.
  It also confirms NN intentionally separates navigation tree from file list;
  it does not provide one mixed File Explorer tree. See the advisory
  [NN 2.1 release post](https://www.reddit.com/r/ObsidianMD/comments/1qe7m3q/notebook_navigator_21_is_here_custom_properties/)
  and [NN 2.3 release post](https://www.reddit.com/r/ObsidianMD/comments/1r0y73j/notebook_navigator_23_300_000_downloads_tasks/).
- UX implication: configure NN more fully before adding another navigation
  plugin. Test its calendar, period patterns, folder-note template, task icon,
  custom property, shortcut, mobile height, and folder-sort settings against
  North. Do not promise File Explorer parity where NN's product model is
  intentionally different.
- ChatGPT Chrome review completed 2026-08-18 with verdict
  `APPROVE_WITH_CHANGES`. Review used the sanitized design brief only in the
  existing `Dusk obsidian` project and `Dusk_light UX Review` conversation.
  Conversation URL:
  `https://chatgpt.com/g/g-p-6a6541ceacf88191b9fcb97967b79546/c/6a81f10c-e038-83ec-8bcb-ca25cfed03bb`.
  Captured response snapshot SHA-256:
  `db2523a087ef97adaeda8c706152e4244c0254a9feee1b6aac1a366415c6d64c`.
  Review decision: one visible action per user intent, one backend writer per
  file type; group low-frequency creation choices; keep NN for browsing and
  calendar; remove Project/Area Templater folder triggers before relying on
  native New note; test one canonical writer on Windows and Android.
- Decision gate: Design A is accepted for implementation with ChatGPT's
  changes. First target is one human-facing Create menu, grouped by intent,
  conditional Project/Area family and child actions, readable labels, stable
  paths, and a short onboarding flow. Keep native actions as fallback until
  PC/Android tests pass.
- Design alternatives under review:
  - A, recommended: keep QuickAdd as the execution backend, make Note Toolbar
    the visible Create menu, and add two small public `file-menu` actions for
    Project/Area roots. Show `New Project`, `Add note to Project`, `New Area`,
    and `Add note to Area` only where they make sense. Keep native `New note`
    as fallback. No extra plugin.
  - B: install Commander to hide/reorder commands, then keep current
    QuickAdd/Note Toolbar routes. Lower custom code, but adds another plugin
    and still needs context-aware family routing.
  - C: simplify Note Toolbar only. Lowest change risk, but native File
    Explorer still exposes generic actions and family creation remains hidden.
- Recommended user model: one visible Create menu for Project, Area, Add note,
  and grouped Resources; one Capture menu for Inbox and Sticky; NN for
  browsing/calendar; File Explorer as fallback. Do not put Daily note in the
  general Create menu. Project Family creates
  `PARA/1. PROJECTS/<name>/1. <name>.md`; Area Family creates
  `PARA/2. AREAS/<name>/2. <name>.md`; child creation is separate. Do not
  guess connections, dates, status, or priorities. Keep existing template
  files until a full reference audit proves a rename is safe.
- Recommended NN pass before any added hook: verify calendar period patterns,
  folder-note template, task icon, custom property display, shortcuts, manual
  sort, and mobile navigation height against actual North behavior. NN's own
  navigation tree and file list remain separate by design.
- Acceptance gate for design: user accepts A, B, or C. Implementation then
  proceeds in disposable-first batches with PC/Android rollback and tests.
- Contract for A with review changes:
  - Human labels: `New Project`, `New Area`, `Add note`, `Resource`,
    `Capture`, `Inbox`, and `Scratch`. Put low-frequency Resource choices
    under `Resource`; put Inbox and Sticky under `Capture`. Keep Daily,
    Weekly, Monthly, Quarterly, and Yearly in the NN calendar/time system,
    not in the general Create menu. Hide `Family`, `Multi`, `Macro`,
    `Template`, and raw template filenames from normal menus.
  - Project root action creates one folder and one hub note using the existing
    Project Family template. Area root does the same with the Area Family
    template. Child action uses existing child templates inside the selected
    family folder. Native `New note` remains a visible fallback.
  - Capture rule: `Quick capture` writes to INBOX; `Scratch note` writes to
    STICKY. Resource type choices remain available without forcing users to
    understand semantic type names first.
  - QuickAdd remains the single family-creation owner. Templater renders the
    template explicitly selected by that route. Remove automatic Project and
    Area root folder triggers; otherwise native New note can silently receive
    a child template. No duplicate family write path.
  - NN remains browser and calendar. Configure and test task icons, selected
    type/status previews, folder-note behavior, period creation, shortcuts,
    numeric folder order, and Android sizing before changing other navigation.
  - Bases, Datacore, Tasks, Meta Bind, status-icon sync, and existing note
    content remain unchanged in first batch. Simplification targets labels,
    routing, and discoverability before data migration.
  - Onboarding gets one "choose this" table and one PC/Android walkthrough;
    each action names destination, template result, and recovery path.
  - Each batch has a disposable copy, exact backup, PC test, Android test,
    rollback check, and compact result entry. Live North changes wait for
    acceptance after disposable evidence.
- Read-only North audit on 2026-08-18:
  - QuickAdd exposes 12 direct choices plus nested `Multi - Project`,
    `Multi - Area`, and `Multi - Meeting`; it also exposes internal macros and
    a daily-task capture command. This is functional but too technical for a
    first-time user.
  - Note Toolbar repeats the same creation routes in separate `top_*` menus.
    It also exposes duplicate Home entries and unrelated Garble/Focus controls
    in settings navigation. No changes made.
  - Templater folder triggers correctly own child-note defaults at PARA roots;
    they must stay separate from family creation.
  - NN already maps daily, weekly, monthly, quarterly, and yearly calendar
    patterns to numbered North folders and uses the NN templates. Its current
    settings have folder-note creation disabled, task progress enabled, custom
    property display empty, and no visible file-name icon map. These are
    configuration candidates, not yet accepted changes.
  - NN currently shows `PARA/1. PROJECTS`, `PARA/2. AREAS`, and
    `PARA/3. RESOURCES` as separate navigation branches with correct icons;
    mixed folder/file-tree parity is not available by design.
  - JS Engine is installed as mobile-capable and already runs a startup script
    using `app.workspace.on(...)`. This makes the recommended public
    `file-menu` hook technically feasible without adding Commander, but it is
    still untested on Android and must first run in a disposable copy.
- Verification gate: backup before each material batch; test representative
  Project Family, Area Family, child, resource, capture, period, task,
  navigation, status-icon, context-menu, and sync flows on Windows and Android.

### ChatGPT review changes to implement

- One visible action per user intent. Do not make a beginner choose between
  QuickAdd, Templater, NN, or raw template names.
- Use a compact visible tree:
  `Create` -> `New Project`, `New Area`, `Add to existing` -> `Project` or
  `Area`, `Resource`, and `Capture` -> `Inbox` or `Scratch`.
- Keep `Today` in Homepage and period creation in NN calendar. Do not add a
  second Daily-note owner.
- Remove automatic Templater triggers on `PARA/1. PROJECTS` and
  `PARA/2. AREAS`. Explicit creation routes must select existing templates
  once. Native New note must remain a plain note in those folders.
- Family creation must preflight existing folder/note, open existing target
  instead of suffixing duplicates, and never overwrite a note.
- Context actions must resolve Project/Area from active note path, not hidden
  NN selection state. Keep generic NN creation available for power users but do
  not advertise it as North family creation.
- Android must expose same labels and destinations without right-click, hover,
  or keyboard shortcuts. Desktop may keep richer dual-pane NN layout.
- Acceptance requires exact one-file creation, duplicate protection, plain
  native New note fallback, template/property preservation, and Windows plus
  Android parity across all listed routes.

The durable live-vault detail checkpoint remains outside this repository at
`C:\Users\TienBac\AppData\Local\Temp\dusk-light-template-demo-rebuild-state.md`.

## Historical Phase 1 next action (superseded)

Begin import-first Dusk design from current `main`. Read the
[reversal record](archive/2026-07-24-phase-2-reversal.md), reuse archived
observations only after revalidation, identify the exact user-tested source,
and approve a concise design before disposable-vault implementation. Do not
revive or merge PR #4.

## Historical Phase 1 deferred promotion work

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

## Historical Phase 1 authority

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- [Architecture modules](architecture/recommended-architecture.md)
- [Behavior and experiments](behavior/capture-to-digest.md)
- [First release](roadmap/mvp.md)
- [Phased roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Git workflow](git-workflow.md)

`docs/archive/`, `docs/superpowers/`, chat history, and NotebookLM output remain history or working evidence unless promoted into current modules or accepted decisions.
