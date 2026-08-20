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

Updated: 2026-08-20

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
  and grouped Resources; one Scratch capture route to STICKY; NN for
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

### Current superseding direction: full cross-platform context menus

Approved 2026-08-19. User wants the old disposable-only context-menu pilot
removed from current coverage and replaced by one synchronized North design.
The pilot remains truthful historical evidence; it is not current acceptance.

- Targets: live Windows North at `G:\Cua Bac\North` and Android disposable at
  `/storage/emulated/0/Android/data/md.obsidian/files/North-Android-Disposable-20260819`.
  Android live North sync is not claimed.
- Hide exact duplicate template rows with `Hide Commands in Menu` `0.1.9`,
  using both current and legacy labels in file-explorer menus. Keep native New
  note, folder, Base, canvas, drawing, sorting, navigation, and destructive
  recovery actions visible.
- Add context-aware North actions through a separate JS Engine startup script
  using existing QuickAdd command IDs and existing templates. Do not expose
  raw QuickAdd, Templater, Macro, Multi, or template-file labels.
- Project, Area, Resource, and Sticky actions appear only where the selected
  path proves they apply. Link and URL menus stay native unless a safe current
  note action is proven.
- Do not add Commander. Its current source adds commands to file/editor menus
  and explorer buttons but does not hide built-in menu rows or cover every
  requested menu location.
- `Hide Commands in Menu` is mobile-capable but requires Obsidian Native menus
  to be disabled. Record that setting and prove rollback before acceptance.
- Runtime status: implementation and review completed 2026-08-19. Windows live
  North and Android disposable use same Hide Commands contract and the same
  path-aware North action script. Android remains disposable evidence only;
  live Android North sync is not claimed.

### Historical runtime result: full cross-platform context menus

The earlier Inbox capture route in this result was superseded by the
2026-08-19 removal entry below. The remaining menu behavior is current.

- Fresh rollback archives were created before mutation:
  `G:\Cua Bac\North-backups\North-full-pre-context-menu-20260819-085949.zip`
  SHA-256 `D86D054B5E56C794AFBC8000E726B238F8BFDB7534F0B08E31F047B08979BA28`;
  Android archive
  `G:\Cua Bac\North-backups\North-android-disposable-pre-context-menu-20260819-085949.zip`
  SHA-256 `D931D8EB497302BA74F2E88E1AC5E5350C474E715345DD828BD1E6DF6D39ED06`.
- `Hide Commands in Menu` `0.1.9` is enabled on both targets. Native menus are
  disabled as required by that plugin. Delay is `100 ms`; this fixed the
  Templater timing race that left its duplicate template row visible on the
  Windows project folder menu.
- Only these duplicate file-explorer labels are hidden:
  `New note from template` and `Create new note from template`. Native note,
  folder, Base, canvas, drawing, icon, sorting, navigation, rename, move,
  duplicate, and delete actions remain visible.
- `SYSTEM/TEMPLATE/CODE/north_context_menu.js` is registered beside the
  existing status-icon startup script on both targets. It exposes existing
  QuickAdd/template routes only: project, area, matching resource type, and
  Sticky actions. It does not create made-up Markdown files.
- Windows live review passed at maximized `1920x1033`: project root, project
  folder, area root, area folder, resource categories, Sticky, Inbox, and note
  editor. The editor menu retained native actions and showed project actions.
- Android disposable review passed at native `1200x2000`: project root, project
  folder, area root, area folder, Contacts, Sticky, and Inbox. A Contact action
  opened the existing QuickAdd prompt targeting
  `PARA/3. RESOURCES/CONTACTS/`; it was canceled. No new named note was made.
- Evidence manifest and raw screenshots are outside Git at
  `G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260819-ContextMenus\`.
  Manifest SHA-256:
  `5F34FBACE68323BB7CFB0F442C983A444E6355E4436C1B79BE66BDE99F90CC82`.
- Remaining boundary: Android is a disposable target, not live North sync.
  No credentials, FNS configuration, note deletion, or folder deletion was
  performed. The earlier disposable-only pilot stays historical and is not
  current acceptance.
- Post-review layout cleanup: old Windows disposable window
  `North-ux-disposable-20260818` was closed without editing or deleting its
  files. Live North had two persisted `Todo List` leaves; one was closed
  through Obsidian UI. Live North now persists one `Todo List` in the
  bottom-right pane. Timer remains above it and its task display is part of
  Timer, not a second Todo List.

### Superseding runtime result: top-ordered daily menus

Updated 2026-08-19. This extends the full context-menu result above without
rewriting its earlier evidence.

- `SYSTEM/TEMPLATE/CODE/north_context_menu.js` places North actions immediately
  before the `Custom sort` row when present, after normal create/tools/reveal
  rows. Match visible full menu-item text across menu DOMs because Custom Sort
  uses a submenu item, and move North items into its parent when needed.
  Preserve separators before and after the North block when both native menu
  separators exist; the script adds the trailing block separator when native
  menu exposes only the leading separator. It creates explicit menu separator
  elements when Obsidian drops trailing separators. Menu settling now waits at
  most 100 ms.
  Destructive rows remain below. This matches Notebook Navigator order without
  putting North actions at the top or bottom.
- `DAILY` exposes `North: Open today`, `North: Open this week`, `North: Open
  this month`, `North: Open this quarter`, and `North: Open this year`.
- Numbered period folders expose one matching action: `1. DAILY` today,
  `2. WEEKLY` week, `3. MONTHLY` month, `4. QUARTERLY` quarter, and `5. YEARLY`
  year. Project and Area root actions remain top-ordered.
- Windows review passed at maximized `1920x1033`. Android disposable review
  passed at native `1200x2000` after restarting Obsidian so its JS Engine
  startup script reloaded. No menu action was clicked; no note or file was
  created or changed by this check.
- Final script SHA-256 is
  `E9D32F93635758BB610973E70B978507CD4B46B0FF5145728525C67A62ECB0D4` on
  Windows and Android. Prechange rollback script SHA-256 was
  `2B56AB553BE33877857835F49F4B190068FEE27340E8AF7C22E75B983AB00097`.
- Rollback root:
  `G:\Cua Bac\North-backups\North-menu-order-daily-prechange-20260819-101430\`.
  Evidence manifest:
  `G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260819-MenuOrderDaily\manifest.json`.
- Android remains disposable evidence only. Live Android North sync is not
  claimed.

### Superseding runtime result: Notebook Navigator menu bridge

Verified 2026-08-19 on live Windows North at maximized `1920x1033`.

- Root cause: native `file-menu` listeners do not reach Notebook Navigator's
  separate menus. The old North routes therefore appeared in File Explorer but
  not in NN.
- Repair: `SYSTEM/TEMPLATE/CODE/north_context_menu.js` now registers the same
  path-aware actions through NN's public `registerFileMenu` and
  `registerFolderMenu` API, with retry after plugin startup.
- Fresh visual checks passed. NN now shows `North: New project` on
  `PARA/1. PROJECTS`; project folders and files show `North: Add note to this
  project`, `North: Documentation note`, and `North: Workstation note`; `DAILY`
  shows `North: Open today`, week, month, quarter, and year.
- No creation action was clicked. No note, folder, property, or task content
  changed during this check.
- Current live script SHA-256:
  `9EBA9C980073D1BD7B13881050AC94260F0A51B53BC1A62B7262188F9EDE8EE1`.
  Prechange rollback script is preserved at
  `G:\Cua Bac\North-backups\North-nn-menu-prechange-20260819-115032\SYSTEM\TEMPLATE\CODE\north_context_menu.js`
  with SHA-256
  `E9D32F93635758BB610973E70B978507CD4B46B0FF5145728525C67A62ECB0D4`.
- Static contract test and JavaScript parse check pass in
  `scripts/test-north-context-menu.ps1`.
- Limitation: NN's public API adds custom items to NN's extension section; it
  does not expose safe hide/reorder controls for NN's built-in rows. Labels,
  icons, destinations, and path filtering now match North's native menus;
  exact row placement inside NN remains plugin-controlled.
- Android North remains unclaimed. Shared script can be synced and verified in
  a later Android-specific check.

### Superseding runtime result: remove redundant Inbox capture route

Updated 2026-08-19.

- Removed North-only `INBOX/` and its dummy showcase note. It contained no
  personal notes.
- Removed `Create Inbox Capture`, the duplicate capture action for the removed
  physical `INBOX/` route,
  toolbar item, the `INBOX` Templater mapping, the `INBOX` Note Toolbar
  mapping, the `INBOX` bookmark, the North context-menu action, Homepage and
  mobile Homepage capture controls, task-view Inbox grouping, and current
  onboarding references. Cleared stale Recent Files, cursor, Fast Note Sync,
  and Iconic backup state plus the old Inbox onboarding image.
- Preserved and restored the legacy Mail Box buttons on desktop and mobile
  Homepage. Their tooltip is now `Open Mail Box`, not `Open Inbox`.
- STICKY remains the single fast-capture route. Future AI review can use
  `review_ai`/`review_ai_needs_user` tags or an optional STICKY subfolder; it
  does not need a dedicated Inbox route.
- Preserved original Dusk `HUB/Mail Box.md` and
  `SYSTEM/MOBILE HUB/Mobile Mail Box.md`; those are legacy dashboards, not the
  removed `INBOX/` folder.
- Rollback: `G:\Cua Bac\North-backups\North-pre-inbox-removal-20260819-1230\`.
- Trace-cleanup rollback: `G:\Cua Bac\North-backups\North-pre-inbox-trace-cleanup-20260819-1245\`.
- Windows live target: `G:\Cua Bac\North`. Android live sync is not claimed.

### Superseding runtime result: Homepage task-entry focus layout

Verified 2026-08-19 at maximized Windows North.

- Reproduction: Homepage Add a task focused the task input and inserted
  "Type a task above, then press the arrow." into the same flex row as the
  note picker and task input. The row used flexWrap: nowrap; the status
  child used flex: 1 0 100%, so the message overlapped the controls.
- Repair: split task-entry controls from status layout. Picker and input keep
  one desktop row and mobile keeps its stacked controls. Status now renders
  below controls at full width.
- Updated source copies:
  G:\Cua Bac\North\HUB\Homepage.md,
  G:\Cua Bac\North\SYSTEM\MOBILE HUB\Mobile Homepage.md, and
  G:\Cua Bac\North\SYSTEM\TEMPLATE\CSS\Timeline\Datacore Timeline View.md.
- Windows UI checks passed at 1920x1033: Add a task shows helper text
  below the row; empty arrow submission shows "Type a task first." below the
  row. Picker, input, task panel, and lower navigation remain visible. No note
  or task content was created or changed.
- Rollback copy:
  G:\Cua Bac\North-backups\North-homepage-task-bug-prechange-20260819-1042.
- Raw user and fresh Windows captures plus manifest:
  G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260819-HomepageTaskBug.
- Android was not mutated or reverified in this turn. The shared Mobile
  Homepage source copy was updated in Windows North for later sync.

Primary sources:

- [Hide Commands in Menu](https://github.com/bomian98/obsidian-hide-commands-in-menu)
- [Commander source](https://github.com/jsmorabito/obsidian-commander)
- Contract for A with review changes:
  - Human labels: `New Project`, `New Area`, `Add note`, `Resource`, and
    `Scratch`. Put low-frequency Resource choices under `Resource`. Keep Daily,
    Weekly, Monthly, Quarterly, and Yearly in the NN calendar/time system,
    not in the general Create menu. Hide `Family`, `Multi`, `Macro`,
    `Template`, and raw template filenames from normal menus.
  - Project root action creates one folder and one hub note using the existing
    Project Family template. Area root does the same with the Area Family
    template. Child action uses existing child templates inside the selected
    family folder. Native `New note` remains a visible fallback.
  - Capture rule: `Scratch note` writes to STICKY. Future AI review uses
    `review_ai`/`review_ai_needs_user` tags or an optional STICKY subfolder; it
    does not need a dedicated Inbox route. Resource type choices remain
    available without forcing users to understand semantic type names first.
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
  `Area`, `Resource`, and `Scratch`.
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

### Execution checkpoint: visible creation repair

Status: current approved configuration batch passed Windows and Android checks.

- Rollback archive: `G:\Cua Bac\North-backups\North-ux-20260818-prechange.zip`.
  SHA-256: `7883596125CBB71ED2EAA951715DAB26E7DEFA5D567813587FACB31FAF38B555`.
- Disposable: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818`.
  Live: `G:\Cua Bac\North`.
- Note Toolbar now exposes one flat `Create` list with 18 readable actions.
  It uses separators, not nested child menus. Note Toolbar source behavior was
  verified: nested menus below top level are suppressed, so nested grouping
  would produce empty menus.
- Templater no longer auto-triggers Project or Area child templates at
  `PARA/1. PROJECTS` and `PARA/2. AREAS`. Other mappings remain unchanged.
- QuickAdd now exposes readable `Add Project Note` and `Add Area Note` routes;
  existing templates and destinations remain the writer backend.
- Getting Started now names Create, Capture, Project/Area family versus child,
  and native New note fallback in plain language.
- Windows result: live North and disposable window were maximized at
  1920x1033 content capture. Create opened all labels. `Project: New project`
  opened `New Project Family`; cancellation created no file.
- Android result: serial `01234ABC`, active vault
  `/storage/emulated/0/Documents/Dusk-Goal1-Safe-Rerun/Dusk_light`, native
  1200x2000 capture. Create opened all labels. `Project: New project` opened
  the expected prompt; cancellation created no file. Android menu and prompt
  screenshots are outside Git under `G:\Cua Bac\North-backups\`.
- Windows and active Android hashes match for final Note Toolbar, Templater,
  QuickAdd, and Getting Started files. Full evidence is in
  `G:\Cua Bac\North-backups\North-ux-20260818-evidence.txt`.
- The mistaken non-active Android FNS-Test target was restored from its
  prepromotion backup. No accepted configuration remains there.
- Remaining scope: path-aware Project/Area context actions and the full
  cross-plugin matrix remain future work in this active goal. This checkpoint
  changes only visible routing, duplicate template ownership, and onboarding.

The durable live-vault detail checkpoint remains outside this repository at
`C:\Users\TienBac\AppData\Local\Temp\dusk-light-template-demo-rebuild-state.md`.

### Approved follow-up: directory actions and context-menu pilot

Approved 2026-08-18. Read-only code inspection found one live routing bug:
Note Toolbar project-directory action `Add note to this project` points to
QuickAdd `New Project Family` instead of child choice
`quickadd:choice:75b22050-2882-4386-b3c9-c9597b9a550a`. Existing `Project Note`
already points to the child template and current folder. Area child route works;
its labels are ambiguous.

Accepted repair scope:

- Point project-directory `Add note to this project` to `New Project Note`.
- Remove duplicate project-directory `Project Note`.
- Rename Area child action to `Add note to this area` and keep family creation in
  global Create.
- Keep Documentation Note and Workstation Note in directory toolbars.
- Do not add another quick-capture command; existing `Fleeting Note` remains.
- Pilot `Hide Commands in Menu` `0.1.9` in disposable only. Hide only exact
  `Create new note from template` in file-explorer context menus. Keep Native
  menus, live North, Android, and all other menu rows unchanged until disposable
  Windows/Android review passes.

Current state before execution: plan accepted; implementation not started.
Superseded by the execution result below.

### Superseding execution result: directory actions and context-menu pilot

Updated: 2026-08-18

- Windows disposable route checks passed at maximized 1920x1033:
  `Add note to this project` now opens QuickAdd `New Project Note` in the
  active project folder; the duplicate `Project Note` row is gone. Area toolbar
  now has one `Add note to this area` row, no Area family row, and opens
  QuickAdd `New Area Note` in the active area folder.
- Disposable `UX Route Test` was created through the project route at
  `PARA/1. PROJECTS/DUMMY - Project Showcase/`. Its file contains the real
  `project_note` frontmatter and Components, connection, date, priority, status,
  and Description template fields.
- The accepted Note Toolbar JSON was promoted to live North. Live restart and
  visible checks passed: project prompt showed
  `New Project Note -> PARA/1. PROJECTS/Skibidi/`; Area menu showed only
  `Add note to this area`, `Documentation Note`, and `Workstation Note`.
- Live Note Toolbar SHA-256 after promotion:
  `95A2974A0972F7E99346EC923AD378B548A26ECF94BD88D30C643B3970F62480`.
- Disposable-only Hide Commands in Menu `0.1.9` pilot passed. Exact
  `Create new note from template` disappeared from the file-explorer context
  menu while core New note, Custom Sort, Notebook Navigator, Quick Explorer,
  and delete rows remained. Plugin and Native-menu setting were not promoted
  to live North.
- Android identity is verified as serial `01234ABC`, model `TrebleDroid with
  GApps`, Android `14`, but no current North vault exists on the device. No
  Android file or plugin config was changed; Android promotion remains blocked
  until North is present.
- Rollback archive:
  `G:\Cua Bac\North-backups\North-ux-20260818-context-menu-pilot-prechange.zip`.
  SHA-256:
  `A18DFCF7C5D1B44022F8BF92542F36C738F177C0B9846F620D5E262150407C79`.
- Sanitized evidence:
  `G:\Cua Bac\North-backups\North-ux-20260818-context-menu-pilot-evidence.txt`.
- This follow-up is complete for its authorized Windows/live scope. Keep the
  hider disposable-only. Do not claim Android parity until current North is
  available on Android.

### Superseding execution result: Android disposable created and verified

Updated: 2026-08-19

- The earlier Android absence statement is superseded for disposable testing.
  Android had no live North vault. A separate app-storage disposable was
  created at `/storage/emulated/0/Android/data/md.obsidian/files/North-Android-Disposable-20260819`.
- Source was current live North `G:\Cua Bac\North`. Old Dusk vaults were not
  changed. Fast Note Sync and Hider were excluded; no sync connection or
  credential was inspected.
- Device identity: serial `01234ABC`, model `TrebleDroid with GApps`, Android
  `14`, Obsidian package `md.obsidian`, Obsidian `1.13.7`.
- Note Toolbar hash matches live North byte-for-byte:
  `95A2974A0972F7E99346EC923AD378B548A26ECF94BD88D30C643B3970F62480`.
- Project route passed. Visible menu rows were `Add note to this project`,
  `Documentation Note`, and `Workstation Note`. Prompt targeted the current
  project folder and was canceled; no note was created.
- Area route passed. Visible menu rows were `Add note to this area`,
  `Documentation Note`, and `Workstation Note`. Prompt targeted the current
  area folder and was canceled; no note was created.
- Package: `G:\Cua Bac\North-backups\North-android-disposable-20260819.zip`.
  SHA-256: `A101668C1FAEAB7E9CF1551C9CD58E302BEED4A2F7585E209AFCB1D0D0A12A23`.
  Manifest and sanitized evidence are next to the archive. Raw Android
  screenshots remain outside Git in the same backup directory.
- This proves the repaired Note Toolbar routes on an Android disposable only.
  It does not claim live Android North parity or sync behavior.

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

## Superseded interim result: Meta Bind date-only fields

Verified 2026-08-19 on live Windows North at maximized `1920x1033`.

- Cause: `Date_Created` and `Due_Date` stored `YYYY-MM-DD` values, but their
  controls used Meta Bind `dateTime`, which expects a date plus a time. Bases
  read the same YAML correctly; Meta Bind showed empty controls.
- Interim fix: changed date-only controls to
  `INPUT[datePicker(defaultValue(null)):Date_Created]` and
  `INPUT[datePicker(defaultValue(null)):Due_Date]`.
- Superseded: user confirmed old Dusk date plus time behavior is required.
- Changed shared templates: `SYSTEM/TEMPLATE/FORMAT/template_project.md` and
  `template_project_note.md`.
- Updated 10 existing Project-family and Project-child notes using the same
  broken control. No property names, YAML values, note bodies, links, or task
  text changed.
- This date-only demo result is not current. Current demo YAML uses full ISO
  timestamps and current controls use `dateTime`.
- Historical rollback: `G:\Cua Bac\North-backups\North-metabind-date-picker-prechange-20260819-1105`.
- Historical evidence: `G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260819-MetaBindDatePicker\`.
- Android was not changed or reverified in this repair. Shared template parity
   remains pending a later authorized sync check.

## Current result: restore old Dusk date-time fields

Verified 2026-08-19 on live Windows North at maximized `1920x1033`.

- Restored `INPUT[dateTime(defaultValue(null)):Date_Created]` and
  `INPUT[dateTime(defaultValue(null)):Due_Date]` in both shared project
  templates and ten existing project-family or project-child notes.
- Demo values now use full timestamps: `2026-08-18T10:15` and
  `2026-08-22T17:00`.
- Windows rendered `Date Created: 08/18/2026 10:15 AM` and
  `Due Date: 08/22/2026 05:00 PM`, matching old Dusk behavior.
- Current rollback: `G:\Cua Bac\North-backups\North-metabind-date-time-restore-prechange-20260819-1130`.
- Evidence manifest and screenshot:
  `G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260819-MetaBindDateTime\manifest.json`.
- Android target `01234ABC` was not changed or reverified. Shared-template
  parity remains a separate authorized check.

## Current result: North menu separators and faster startup registration

Verified 2026-08-19 after the prior menu-order result.

- Live North script: `G:\Cua Bac\North\SYSTEM\TEMPLATE\CODE\north_context_menu.js`.
- Native File Explorer menu now shows a visible separator before North actions
  and another separator before `Custom sort:`. North actions no longer visually
  merge with Custom Sort.
- Notebook Navigator registration polling changed from 250 ms to 50 ms. This
  reduces startup wait for its path-aware North actions without changing menu
  routes or retry count.
- Fresh maximized Windows screenshot showed the two separated North menu
  blocks. No command was clicked; no note, folder, property, or task content
  changed.
- Live script SHA-256:
  `79A02F3A3A8ED372DEF22EF718C112784F8DB7E8B1367096BC9ECC18822326D0`.
- Rollback copy:
  `G:\Cua Bac\North-backups\North-pre-menu-fast-registration-20260819-1538.js`
  with prior SHA-256
  `7C009C6D997378EFDC767F5B08C155B9A1A7016FF7C7150A3601CA5FEE0F6F7A`.
- Static contract test and `node --check` pass. Android North parity is not
  claimed.

## Current result: equal North menu separator spacing

Verified 2026-08-19 after the previous separator result.

- Root cause: native `menu.addSeparator()` elements and North-created elements
  used different inherited spacing after menu reordering. Accessibility showed
  two separators, but the leading gap rendered larger.
- Repair: North native menus no longer insert native separators before moving
  actions. The script creates two North-owned separators with identical 1 px
  lines, zero padding, and 3 px vertical margins.
- Fresh maximized Windows checks passed for `DAILY`, `5. YEARLY`, and a project
  folder. Each shows one equal boundary above and below the North block.
- No note, folder, property, task, or command content changed.
- Live script SHA-256:
  `332ACDE8CB7A39E9ECA8F675AC8C01DBAEE70F40618773BD05DA57C0D47D35FA`.
- Rollback copy:
  `G:\Cua Bac\North-backups\North-pre-menu-owned-separators-20260819-1605.js`
  with SHA-256
  `D0E8353809E3F44CDD9CF23914A8A7CAFD626505B2718EA0030C37595CCBE225`.
- Static contract test and `node --check` pass. Android North parity is not
  claimed.

## Current result: North menu block follows native reveal rows

Verified 2026-08-19 after the previous separator result.

- Root cause: North actions were anchored at `Custom sort` while native rows
  remained between `Show in Quick Explorer` and North, creating the large gap.
- Repair: anchor North actions immediately after the last native `Show in ...`
  row, then keep one styled separator before and after the North block.
- Fresh maximized Computer Use checks passed for `DAILY`, `4. QUARTERLY`, and
  nested `DUMMY - Project Showcase`. The North block is directly below the
  native reveal rows and directly above `Custom sort`.
- No note, folder, property, task, or command content changed.
- Live script SHA-256:
  `FC1B3C47DAA99243F29F04191862F4BEAFA944C954E86DBF52C936838D06A10`.
- Rollback copy:
  `G:\Cua Bac\North-backups\North-pre-menu-geometry-debug-20260819-1615.js`.
- Static contract test and `node --check` pass. Android North parity is not
  claimed.

## Current result: remove hidden template rows from North menus

Verified 2026-08-19 on live Windows North at maximized `1920x1033`.

- Root cause: Hide Commands in Menu hid `New note from template` and `Create
  new note from template` visually but left a 25 px menu row in the DOM. That
  row created the larger gap above North actions.
- Repair: North removes those two exact hidden rows before placement, anchors
  North at `Custom sort`, and accepts the layout only when one separator sits
  directly after the final native reveal row and one directly before the
  anchor. Extra separators are removed.
- Fresh maximized Computer Use checks passed for the `DAILY` root,
  `4. QUARTERLY`, and nested `DUMMY - Project Showcase`. Menus show no hidden
  template row, no oversized top gap, and one boundary on each side of North.
- No note, folder, property, task, or command content changed.
- Live script SHA-256:
  `1CF9BD91C955DFBDF746223437A9EEFB5F2B1088BBC95585D8C2F02A58FF6779`.
- Rollback copy:
  `G:\Cua Bac\North-backups\North-pre-menu-geometry-debug-20260819-1615.js`
  with SHA-256
  `332ACDE8CB7A39E9ECA8F675AC8C01DBAEE70F40618773BD05DA57C0D47D35FA`.
- Static contract test and `node --check` pass. Android North parity is not
  claimed.

## Current result: compact native File Explorer boundary

Verified 2026-08-19 after the hidden-row repair above.

- Root cause: normal Obsidian File Explorer supplied a native separator before
  the grouped North actions. Earlier North styling targeted only separators it
  created, so the native boundary kept its larger inherited margin.
- Repair: detect the native separator whose next menu group contains North
  actions, set its vertical margin to `1px`, and avoid adding a second leading
  separator when that native boundary already exists. Keep the intentional
  separator between North actions and `Custom sort:`.
- Fresh maximized Windows measurement: native boundary height `1px`,
  `marginTop: 1px`, `marginBottom: 1px`; North starts immediately after it.
  Final visual check passed on `4. QUARTERLY`; the hidden template row is absent.
- Performance scope: no watcher, persistent polling, or new plugin. This uses
  the existing menu-open transient retry path and one bounded DOM scan only
  when a menu opens.
- No note, folder, property, task, or command content changed. Android North
  parity is not claimed.
- Current live script SHA-256:
  `63CB4D09DB0A4B756004EFCC4B437D04AB6359A232C59FE64A0D2919127E4C95`.
- Static contract test and `node --check` pass. Temporary diagnostic files were
  removed after measurement.

## Current result: replace Highlightr with Highlightr Plus

Verified 2026-08-19 on live Windows North.

- Backup before mutation:
  `G:\Cua Bac\North-backups\North-pre-highlightr-plus-20260819-1730.zip`.
  SHA-256:
  `92b378e6416b861f1337f859c80e47ba0074f52dee15882b2d6960da629cec2f`.
- Replaced enabled community ID `highlightr-plugin` version `1.2.2` with
  official `highlightr-plus` version `1.2.4` from
  `bluelephant825/highlightr-plus`. Manifest marks it mobile-capable.
- Migrated existing Red, Green, and Remove highlight hotkeys to
  `highlightr-plus:Red`, `highlightr-plus:Green`, and
  `highlightr-plus:unhighlight`.
- No old Highlightr `data.json` existed. Existing inline `<mark>` highlights
  remain readable because Plus keeps same output format.
- Old plugin folder moved recoverably to
  `G:\Cua Bac\North-backups\North-old-highlightr-plugin-20260819-1730`.
- Fresh maximized Computer Use check opened Highlightr Plus and its
  Highlights & Notes panel. Temporary test note was removed afterward.
- `node --check` passed. Old plugin path is absent; new plugin path is present.
  Android North runtime parity was not reverified in this session.

## Current result: replace Checklist with Simple Checklist

Verified 2026-08-19 on live Windows North at maximized `1920x1033`.

- Pre-change backup:
  `G:\Cua Bac\North-backups\North-pre-simple-checklist-20260819-2046.zip`.
  SHA-256:
  `98a3f13f58930aade0820dd20e7f000ed89538d526b1ceb43d904514314f65e4`.
- Disposable A/B copy:
  `G:\Cua Bac\North-checklist-disposable-20260819-2046`.
  Simple Checklist opened, showed ten open items, and clicking an item opened
  its exact source note. No note or task content was changed.
- Replaced enabled `obsidian-checklist-plugin` `2.2.14` with official
  `simple-checklist` `1.10.5`. Live files match downloaded release hashes:
  `main.js` `e8c1e9d04305190bb38577e340ff1387ae5de34647da66ef1aaf796ffa05a209`,
  `manifest.json` `42a034e8eb6e111f75cd4be31d5756eb35978ecef6c0784a40b6c5a7be898ca6`,
  `styles.css` `60975c4128945de5e0c9d7e394f8cc5e21ba381e35cb503963ca83e450cad2fc`.
- Old plugin folder moved recoverably to
  `G:\Cua Bac\North-backups\North-old-checklist-plugin-20260819-2046`.
- Removed stale old Checklist workspace tab after first launch. Fresh close and
  reopen now loads Simple Checklist directly in right sidebar with no dead-tab
  error. The new ribbon command is `Open Checklist`.
- Simple Checklist scans all Markdown files for open `- [ ]` items. It has no
  folder exclusion setting; template tasks remain visible, matching the old
  plugin's tagged-template behavior. `Tasks` plugin remains unchanged.
- Windows result: pass. Android North runtime was not reverified; release
  manifest marks plugin mobile-capable. Official references:
  [Simple Checklist community page](https://community.obsidian.md/plugins/simple-checklist),
  [Simple Checklist 1.10.5 release](https://github.com/l-4553/obsidian-simple-checklist/releases/tag/1.10.5).

## Current result: North startup manager and measured performance floor

Verified 2026-08-20 on disposable Windows and Android, then live Windows North.

- On-Demand `3.4.6` is now sole startup manager. Default mode is `lazy`.
  `custom-sort` uses `lazyOnDemand`. Custom Frames is removed from the active
  community list because On-Demand rewrote its disabled mode to enabled on
  restart; its plugin folder and list entry remain recoverable. Lazy Loader
  `1.0.24` is also removed from the active community list.
- Live North promotion changed only `.obsidian` loader/list configuration.
  Homepage, project and area templates keep exact prechange SHA-256 values:
  `HUB/Homepage.md` `e9cce78cbec4cada47a3756683677ce7fbfce2803ab935b6265790c13a24be6c`;
  `template_project.md` `46c0de529e8ef1491099b66f4393026e49f793ce69b68c32da4a07eae73ff4a6`;
  `template_area.md` `966e1a65a2c4b81451a310984dbf7d74e2f280a693131334b5d8395cb592d96e`.
- Live list now has 43 entries, includes On-Demand, excludes Lazy Loader and
  Custom Frames, and has no UTF-8 BOM. Live rollback ZIP:
  `G:\Cua Bac\North-backups\North-pre-startup-performance-promote-20260820.zip`;
  SHA-256 `c5ea2f7a93df1ed6066c9576adf025881c1c27058f3f3ad960b89af6e03658af`;
  11,364,782 bytes.
- Windows disposable measurements: baseline `26.351 s`; first On-Demand UI
  profile `21.086 s`; lower-bound `lazy` profile found its first window at the
  first `0.5 s` poll and rendered Homepage, Datacore, Notebook Navigator,
  Journals, Tasks, and Outline without raw code or dependency errors. This is
  a poll upper bound, not a stopwatch-grade benchmark.
- Android disposable `01234ABC` target
  `/storage/emulated/0/Android/data/md.obsidian/files/North-Android-Startup-Performance-20260820`
  has matching BOM-free community list SHA-256
  `360cf3cce2edff767e127b4e77a90ce4f11f3e61e70b63018beb618c7f8f642f` before
  the final Custom Frames removal; final 43-entry list SHA-256 is
  `7fc837dea86dd9150438ca45599ee32aa96d9ca6676e229afd3eec14c421c89b` and
  On-Demand data SHA-256
  `48f6bd3ab7f072662955b5e3ba80e5393f24744d71cd8ed2d0594b62fd9b0dff`.
  Native `1200x2000` settled Homepage, task, and right-sidebar
  evidence is outside Git at
  `G:\Dusk-Knowledge-Hub\payload\evidence\North-Startup-Performance-20260820\`;
  accepted screenshots: `android-lazy-cold-8s.png`,
  `android-lazy-left-sidebar.png`, and `android-lazy-right-sidebar.png`.
- Live North reopened and visually passed at maximized `1920x1033`: Homepage
  buttons, Datacore task panel, left navigation, Journals calendar, and right
  task pane rendered with no source leakage or dependency error. Live Android
  North sync is not claimed.
- User target `<3 s` is met by the Windows first-window poll, but Android still
  needs about `8 s` to settle Homepage from cold start. Removing Homepage,
  Datacore, indexing, or required navigation would fake a cross-platform
  number and damage North UX. The accepted profile is the most aggressive
  usable plugin profile; an OS-level prelaunch experiment is the only remaining
  route to hide Android's cold-start floor.
- Full rollback extraction remains at
  `G:\Cua Bac\North-backups\_North-startup-restore-20260820`.
- Additional exact rollback files:
  `G:\Cua Bac\North-backups\North-community-pre-customframes-20260820.json`;
  `G:\Cua Bac\North-backups\North-on-demand-data-pre-fully-lazy-20260820.json`.
