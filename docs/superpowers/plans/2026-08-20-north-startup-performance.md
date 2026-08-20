# North Startup Performance Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Replace ineffective Lazy Loader settings with one tested On-Demand configuration that shortens North startup while preserving Windows and Android core flows.

**Architecture:** Test the loader in a disposable copy first. Keep core renderers, writers, sync, and persistent layout early; defer only noncritical features with a mode justified by their behavior. Promote the exact accepted configuration to live North after rollback and cross-platform checks.

**Tech Stack:** Obsidian `1.13.6`; North vault; On-Demand `3.4.6`; Lazy Loader `1.0.24`; PowerShell; ADB; Computer Use.

## Global Constraints

- Never touch `C:\Users\TienBac\.codex\worktrees\bf23\personal-knowledge-pipeline`.
- Never edit protected Dusk source or personal vaults other than live North explicitly in scope.
- Preserve a full rollback ZIP before live mutation.
- Keep `homepage`, `datacore`, Tasks, Simple Checklist, Templater, Meta Bind, JS Engine, Journals, Notebook Navigator, Note Toolbar, QuickAdd, FNS, and layout dependencies early.
- Do not claim Android live parity; use an identified Android disposable.
- Maximize and reobserve North before each accepted Computer Use observation.

### Task 1: Preserve North and create disposable

**Files and targets:**
- Read: `G:\Cua Bac\North`
- Create: `G:\Cua Bac\North-backups\North-pre-startup-performance-20260820.zip`
- Create: `G:\Cua Bac\North-startup-performance-disposable-20260820`

- [ ] Close North through its current Obsidian window.
- [ ] Create the full ZIP and record its SHA-256 with a .NET hash helper.
- [ ] Copy the exact North tree to the disposable with `robocopy /E /COPY:DAT /DCOPY:DAT`.
- [ ] Verify the disposable has the same file count and hashes for `.obsidian/community-plugins.json`, Lazy Loader `data.json`, Homepage, templates, and North startup script.

### Task 2: Install one loader in disposable

**Files:**
- Modify: `G:\Cua Bac\North-startup-performance-disposable-20260820\.obsidian\community-plugins.json`
- Create: `G:\Cua Bac\North-startup-performance-disposable-20260820\.obsidian\plugins\on-demand-plugins\manifest.json`
- Create: `G:\Cua Bac\North-startup-performance-disposable-20260820\.obsidian\plugins\on-demand-plugins\main.js`
- Create: `G:\Cua Bac\North-startup-performance-disposable-20260820\.obsidian\plugins\on-demand-plugins\styles.css`
- Modify: `G:\Cua Bac\North-startup-performance-disposable-20260820\.obsidian\plugins\lazy-plugins\data.json`

- [ ] Download On-Demand `3.4.6` from its GitHub release assets.
- [ ] Verify manifest ID, version, `isDesktopOnly=false`, and release hashes.
- [ ] Add `on-demand-plugins` to the disposable community list.
- [ ] Disable Lazy Loader in the disposable only; do not delete its folder.
- [ ] Open disposable North and use the plugin settings UI to apply modes.

### Task 3: Configure safe modes

- [ ] Set always enabled for `homepage`, `datacore`, `obsidian-tasks-plugin`,
  `simple-checklist`, `templater-obsidian`, `obsidian-meta-bind-plugin`,
  `js-engine`, `journals`, `notebook-navigator`, `note-toolbar`, `quickadd`,
  `fast-note-sync`, `tabs`, `obsidian-hider`, `obsidian-style-settings`,
  `obsidian-minimal-settings`, `editing-toolbar`, and
  `hide-commands-in-menu`.
- [ ] Set layout-ready for noncritical plugins with unknown global hooks.
- [ ] Set on-demand only for a confirmed command/view/file owner such as
  Excalidraw, Highlightr Plus, Omnisearch, Outline, Trash Explorer, or
  Pomodoro; do not include a plugin whose startup hook is required by North.
- [ ] Apply changes and let Obsidian restart automatically.

### Task 4: Measure and run core Windows flow

- [ ] Measure launch-to-window and launch-to-settled-workspace time using the
  same controlled launch method as baseline.
- [ ] Confirm no loading residue, dependency error, or source-code leakage.
- [ ] Open Homepage and verify buttons, task panel, Calendar, Checklist,
  Outline, and NN.
- [ ] Open one Project note and one Area note; verify template properties,
  Meta Bind controls, connection picker, and date-time fields.
- [ ] Verify one safe task interaction and one Simple Checklist navigation.
- [ ] Verify File Explorer and Note Toolbar still expose North actions.

### Task 5: Verify Android disposable

- [ ] Verify device serial and Android package before writing.
- [ ] Copy the accepted disposable configuration to a new Android disposable,
  excluding FNS credentials and sync state.
- [ ] Verify startup, Homepage, note rendering, task/checklist, Journals,
  Notebook Navigator, and one creation route at native Android resolution.
- [ ] Record any mobile-only delay or missing command without promoting live
  Android claims.

### Task 6: Promote or roll back

- [ ] Promote only the exact loader configuration that passes the acceptance
  checks to `G:\Cua Bac\North`.
- [ ] Keep Lazy Loader disabled but recoverable for this checkpoint.
- [ ] Reopen live North, maximize, reobserve, and repeat the startup/core-flow
  checks.
- [ ] If acceptance fails, restore the pre-change ZIP and report the failing
  boundary instead of stacking another loader.

### Task 7: Record state and verify docs

- [ ] Append one compact current result to `docs/active-goal.md` with baseline,
  result, exact plugin/config identities, backup/hash, Windows result, Android
  result, and rollback.
- [ ] Add this design and plan to `docs/README.md`.
- [ ] Run `scripts/check-markdown-links.ps1`, `scripts/test-markdown-links.ps1`,
  `scripts/check-secrets.ps1`, and `git diff --check`.
- [ ] Commit with a conventional subject no longer than 50 characters and push
  `docs/north-ux-personalization`.
