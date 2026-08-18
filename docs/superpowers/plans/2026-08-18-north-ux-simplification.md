# North UX Simplification Implementation Plan

> **For agentic workers:** Execute inline in this session with durable checkpoints. Main agent owns all North edits, Windows/Android verification, rollback, and evidence. No subagent or parallel writer.

**Goal:** Make North creation and navigation obvious while preserving existing templates, properties, links, plugin behavior, and PC/Android parity.

**Architecture:** Note Toolbar is visible action layer. QuickAdd remains hidden execution backend. Templater renders only explicitly selected templates; Project/Area root folder triggers are removed. Notebook Navigator remains browser/calendar. Obsidian core remains plain-note fallback.

**Tech Stack:** Obsidian North vault at `G:\Cua Bac\North`; Note Toolbar; QuickAdd; Templater; Notebook Navigator; Windows Computer Use; direct ADB for registered Android serial `01234ABC`; PowerShell for backup and manifests; Git documentation branch `docs/north-ux-personalization`.

## Global Constraints

- Never edit protected Dusk source, `bf23`, `phase2-reset`, or unrelated worktrees.
- Never print, copy, hash, commit, or upload credentials, FNS tokens, or private note content.
- Do not move notes, rename properties, change semantic type values, or delete plugins in this batch.
- Preserve `PARA/1. PROJECTS`, `PARA/2. AREAS`, `PARA/3. RESOURCES`, `INBOX`, `STICKY`, and all existing template files.
- No required Android route may depend on hover, right-click, or keyboard shortcut.
- Every material batch gets dated backup, manifest, Windows result, Android result, and rollback result.
- Raw screenshots and runtime manifests stay outside Git; compact findings go in `docs/active-goal.md`.

---

### Task 1: Freeze North baseline

**Files:**
- Read: `G:\Cua Bac\North\.obsidian\plugins\quickadd\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\note-toolbar\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\templater-obsidian\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\notebook-navigator\data.json`
- Read: `G:\Cua Bac\North\SYSTEM\GETTING STARTED\Dusk_light Quick Start.md`
- Create outside Git: `G:\Cua Bac\North-backups\North-ux-20260818-prechange.zip`
- Create outside Git: `G:\Cua Bac\North-backups\North-ux-20260818-prechange-manifest.txt`

**Steps:**

- [ ] Confirm `G:\Cua Bac\North` exists and contains `.obsidian`, `HUB`, `DAILY`, `PARA`, `INBOX`, `STICKY`, and `SYSTEM`.
- [ ] Record file count, byte count, and SHA-256 for the archive only; never include token-bearing config values in output.
- [ ] Record current plugin IDs, active Note Toolbar IDs, QuickAdd choice names, Templater folder mappings, NN period patterns, and current workspace identity.
- [ ] Open North in Windows Obsidian and capture baseline screenshots for Homepage, NN navigation, Project note, Area note, Create menu, and a native folder context menu.
- [ ] Confirm registered Android serial `01234ABC` and capture baseline screenshots only after the target vault name is visibly `North`.
- [ ] Verify backup archive can list and extract to a disposable path without changing North.

**Expected result:** Exact pre-change rollback archive and sanitized baseline manifest exist outside Git.

### Task 2: Build disposable Windows copy

**Files:**
- Create outside Git: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818`

**Steps:**

- [ ] Extract the verified baseline archive to the disposable path.
- [ ] Open only the disposable path in a separate Obsidian window.
- [ ] Confirm vault title, root folders, templates, plugin list, and no FNS token exposure in visible UI.
- [ ] Do not connect this copy to FNS or Android.
- [ ] Run baseline creation tests: existing Project family, Project child, Area family, Area child, Knowledge, Documentation, Contact, Meeting, Inbox, Sticky, and five period types.

**Expected result:** Disposable copy reproduces current behavior and is isolated from live North and sync.

### Task 3: Test current routes before repair

**Files:**
- Read-only: QuickAdd, Note Toolbar, Templater, NN configs listed in Task 1.
- Evidence outside Git: `C:\Users\TienBac\AppData\Local\Temp\north-ux-20260818-baseline`

**Steps:**

- [ ] Test each existing visible creation route once; record target path, filename, template identity, properties, and duplicate behavior.
- [ ] Create one native note under Project root and one under Area root; record whether Templater silently applies a child template.
- [ ] Open an existing family note and test current contextual creation route.
- [ ] Test NN calendar create/open for Daily, Weekly, Monthly, Quarterly, and Yearly.
- [ ] Close test files without deleting user content; keep only disposable test artifacts.

**Expected result:** Current failures and working routes are known before config edits.

### Task 4: Create one visible Note Toolbar action surface

**Files:**
- Modify disposable: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\note-toolbar\data.json`
- Read-only backend: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\quickadd\data.json`

**Steps:**

- [ ] Duplicate current visible toolbar configuration inside the disposable copy.
- [ ] Add one `Create` entry with exact groups `New Project`, `New Area`, `Add to existing`, `Resource`, and `Capture`.
- [ ] Map each visible entry to an existing working QuickAdd choice before changing any backend.
- [ ] Keep `Inbox` and `Scratch` under `Capture`; keep Daily out of Create.
- [ ] Remove raw `Family`, `Multi`, `Macro`, `Template`, and template filename labels from normal visible menus while retaining backend choices.
- [ ] Leave native New note untouched.
- [ ] Test menu opening, labels, destinations, and cancel behavior on Windows.
- [ ] Use Android UI to confirm same labels fit and remain thumb-accessible; do not require a keyboard or right-click.

**Expected result:** One obvious visible Create/Capture surface, no data-model change, and old backend routes still usable for rollback.

**Implementation result:** Note Toolbar's nested submenu limit was verified in
source and runtime. The accepted surface is one flat direct-action list with
separators. Nested child-menu definitions were removed after the flat list was
tested, so no empty unused menus remain.

### Task 5: Remove duplicate Project/Area folder triggers

**Files:**
- Modify disposable: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\templater-obsidian\data.json`

**Steps:**

- [ ] Disable only the `PARA/1. PROJECTS` and `PARA/2. AREAS` automatic folder mappings.
- [ ] Preserve every Resource, Inbox, Sticky, Workstation, and period mapping.
- [ ] Test native New note below Project root: expected plain Markdown note with no silent child template.
- [ ] Test native New note below Area root: expected plain Markdown note with no silent child template.
- [ ] Test explicit QuickAdd Project child and Area child: expected existing child template exactly once.
- [ ] If any route writes twice or loses content, restore the disposable Templater file from Task 2 and stop this batch.

**Expected result:** One explicit writer for Project/Area child templates; native fallback is predictable.

### Task 6: Harden family creation without data migration

**Files:**
- Modify only disposable QuickAdd/backend configuration or existing vault script after inspecting actual route support.
- Preserve: `G:\Cua Bac\North\SYSTEM\TEMPLATE\FORMAT\template_project.md`
- Preserve: `G:\Cua Bac\North\SYSTEM\TEMPLATE\FORMAT\template_area.md`
- Preserve all child templates.

**Steps:**

- [ ] Inspect current family routes and test whether they already create one folder plus one family note.
- [ ] If route already passes, change only visible labels and record no backend change.
- [ ] If route fails, add preflight using existing supported QuickAdd/Templater actions: existing target opens; no auto-suffix; no overwrite; partial empty folder cleanup only.
- [ ] Test Project name `UX Review Demo` twice.
- [ ] Test Area name `Personal Health Demo` twice.
- [ ] Test child creation from family note and child note.
- [ ] Confirm connections, dates, status, priority, and type remain template-owned and are not guessed by route.

**Expected result:** One folder plus one family note on first creation; second request opens existing target; children land in selected family folder.

### Task 7: Add path-based context actions

**Files:**
- Modify disposable Note Toolbar configuration.
- Do not add private Notebook Navigator hooks.

**Steps:**

- [ ] From Project family and child notes, expose `Add note to this Project`.
- [ ] From Area family and child notes, expose `Add note to this Area`.
- [ ] Resolve family from active note path only.
- [ ] From unrelated notes, expose `Create > Add to existing > Project/Area` with explicit folder choice.
- [ ] Test when NN has a different folder selected than active note; active note path wins.
- [ ] Test cancellation and existing filename behavior.

**Expected result:** Context action is obvious and never depends on hidden NN state.

### Task 8: Cross-plugin regression and Android parity

**Files:**
- Read/write disposable configs only during first pass.
- Evidence outside Git: `C:\Users\TienBac\AppData\Local\Temp\north-ux-20260818-regression`

**Steps:**

- [ ] Verify Bases sees new Project, Area, Resource, and child notes.
- [ ] Verify Datacore panels render without source code leakage.
- [ ] Verify Tasks recognizes existing task syntax and completion status.
- [ ] Verify Meta Bind edits existing properties.
- [ ] Verify status icons update after status changes and new templated files.
- [ ] Verify NN previews, file icons, task progress, properties, shortcuts, numeric folder order, and calendar patterns.
- [ ] Verify links and hover/open behavior on representative notes.
- [ ] Sync only accepted disposable configuration to Android test target after Windows pass.
- [ ] On Android, test New Project, Project child, New Area, Area child, Resource, Inbox, Scratch, NN calendar, and native fallback without keyboard/right-click.
- [ ] Record platform differences in compact result ledger; do not force desktop geometry onto mobile.

**Expected result:** Same meaning and file outcomes on Windows and Android; mobile layout may differ.

### Task 9: Promote to live North with rollback

**Files:**
- Modify live: `G:\Cua Bac\North\.obsidian\plugins\note-toolbar\data.json`
- Modify live: `G:\Cua Bac\North\.obsidian\plugins\templater-obsidian\data.json`
- Modify live QuickAdd only if Task 6 proves backend repair is needed.
- Modify live: `G:\Cua Bac\North\SYSTEM\GETTING STARTED\Dusk_light Quick Start.md`

**Steps:**

- [ ] Confirm disposable acceptance and clean backup hash.
- [ ] Close North in Obsidian before copying configuration.
- [ ] Copy only accepted config changes; do not replace vault content or FNS data.
- [ ] Reopen North and confirm plugin load, visible menu, native fallback, and existing Hub shortcuts.
- [ ] Run Windows acceptance matrix from Tasks 6-8.
- [ ] Sync and run Android acceptance matrix from Task 8.
- [ ] If any accepted behavior regresses, restore exact pre-change config from backup and record rollback.
- [ ] Add concise onboarding explanation of Create, Capture, Project/Area family versus child, NN calendar, and recovery.

**Expected result:** Live North has one obvious creation path, safe native fallback, and verified Windows/Android behavior.

### Task 10: Documentation, commit, and handoff

**Files:**
- Modify: `docs/active-goal.md`
- Modify: `docs/superpowers/specs/2026-08-18-north-ux-simplification-design.md`
- Modify: `docs/superpowers/plans/2026-08-18-north-ux-simplification.md`
- Evidence outside Git: North backup, manifests, screenshots, and sanitized result notes.

**Steps:**

- [ ] Record exact live and Android target identities, changed config paths, accepted routes, failed routes, rollback state, and remaining gaps.
- [ ] Record no credential values or private note text.
- [ ] Run `git diff --check`.
- [ ] Run `powershell -NoProfile -File scripts/check-markdown-links.ps1`.
- [ ] Run `powershell -NoProfile -File scripts/test-markdown-links.ps1`.
- [ ] Run `powershell -NoProfile -File scripts/check-secrets.ps1`.
- [ ] Run `powershell -NoProfile -File scripts/check-mermaid.ps1` when diagrams changed.
- [ ] Commit one atomic documentation checkpoint with conventional subject no longer than 50 characters.
- [ ] Push only `docs/north-ux-personalization`; keep `main` unchanged.
- [ ] Leave current goal active until all acceptance tests pass; otherwise record exact blocker and next action.

**Expected result:** Durable state tells next session what changed, what passed, what rolled back, and where raw evidence lives.

## 2026-08-18 execution checkpoint

- Completed: baseline archive, disposable restore, flat Note Toolbar Create
  list, Project/Area Templater trigger removal, Getting Started update, live
  promotion, Windows verification, Android verification, and rollback record.
- Not changed: vault note content, semantic properties, plugin set, NN
  navigation model, or backend family route logic.
- Deferred: path-aware context actions and full Bases/Datacore/Tasks/Meta Bind
  regression matrix. Keep this plan active until those checks are separately
  authorized and completed.
- Evidence: `G:\Cua Bac\North-backups\North-ux-20260818-evidence.txt`.

## Approved follow-up: directory actions and context-menu pilot

**Goal:** Make Project and Area directory actions point to the correct child
templates, then test one narrowly configured context-menu hider in disposable
North without changing live plugin state until Windows and Android pass.

**Files:**

- Modify disposable: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\note-toolbar\data.json`
- Add disposable plugin only: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\hide-commands-in-menu\{main.js,manifest.json,styles.css}`
- Add disposable plugin settings: `C:\Users\TienBac\AppData\Local\Temp\North-ux-disposable-20260818\.obsidian\plugins\hide-commands-in-menu\data.json`
- Promote accepted Note Toolbar change to live: `G:\Cua Bac\North\.obsidian\plugins\note-toolbar\data.json`
- Promote accepted Note Toolbar change to registered Android North target only after identity proof.
- Modify: `docs/active-goal.md`
- Modify: this plan
- Evidence outside Git: `G:\Cua Bac\North-backups\North-ux-20260818-context-menu-pilot-*`

**Exact behavior change:**

- Project directory toolbar keeps one child action named `Add note to this project`.
  It calls `QuickAdd: New Project Note` with command ID
  `quickadd:choice:75b22050-2882-4386-b3c9-c9597b9a550a`.
- Remove duplicate `Project Note` from that directory-only toolbar.
- Remove family creation from the Area directory-only toolbar. Rename its child
  action to `Add note to this area`. Family creation stays in global Create.
- Keep Documentation Note and Workstation Note in both directory toolbars.
- Do not add a second quick-capture route. Existing global `Fleeting Note` remains
  the quick note route.
- In disposable context-menu pilot only, hide exact `Create new note from template`
  under file-explorer context menus. Keep `Custom sort:`, `Reveal in Notebook
  Navigator`, `Show in Quick Explorer`, core New note, and destructive rows visible
  until a separate user-approved cleanup.

**Steps and gates:**

- [ ] Create a fresh current-North backup and sanitized manifest before mutation.
- [ ] Verify disposable Note Toolbar and QuickAdd hashes against current North;
  stop on mismatch and reconcile before editing.
- [ ] Apply only the three Note Toolbar changes above. Parse JSON before and after.
- [ ] Download official release `bomian98/obsidian-hide-commands-in-menu` `0.1.9`
  files into disposable only. Record release URL and file hashes outside Git.
- [ ] Set disposable plugin data to exact default settings with
  `fileMenu.fileExplorerContext.plainTexts` containing only
  `Create new note from template`; all other plain and regex lists stay empty;
  `delayTime` stays `1`.
- [ ] Disable Native menus in disposable through Obsidian Settings only for the
  pilot. Confirm context menu still opens and row filtering is targeted.
- [ ] Test Project directory action: one child note, current project folder,
  existing `template_project_note.md`, no family prompt.
- [ ] Test Area directory action: one child note, current area folder,
  existing `template_area_note.md`, no family prompt.
- [ ] Test global New Project and New Area family routes remain unchanged.
- [ ] Test editor menu, file-explorer menu, and NN menu. Confirm only the exact
  pilot row disappears; no core creation, navigation, Custom Sort, NN, or delete
  action disappears.
- [ ] Test Android registered target identity and the same directory routes. Do
  not install the context-menu pilot on Android unless its mobile behavior is
  explicitly visible and safe; record that limitation if applicable.
- [ ] If disposable Note Toolbar passes and no unrelated menu regression appears,
  promote only Note Toolbar JSON to North and Android. Keep hider plugin disposable
  until a later explicit acceptance of Native-menu behavior.
- [ ] Run JSON parsing, SHA-256, Windows UI, Android UI, link, secret, and clean
  Git checks. Record rollback archive and exact final hashes.

**Rollback:** Restore Note Toolbar JSON from the fresh backup; remove the
disposable hider directory and restore Native menus. Do not delete vault notes.
