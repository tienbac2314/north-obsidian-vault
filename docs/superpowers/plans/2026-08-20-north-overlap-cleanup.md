# North Overlap Cleanup Implementation Plan

> **For agentic workers:** Execute inline in this session with reversible checkpoints. Do not dispatch subagents or touch `C:\Users\TienBac\.codex\worktrees\bf23\personal-knowledge-pipeline`.

**Goal:** Remove only proven duplicate navigation/counting plugins while keeping North creation, tasks, dates, calendar, templates, sync, and mobile behavior intact.

**Architecture:** Test one candidate at a time in the existing disposable copy, restart Obsidian, and inspect the affected surface plus core North flows. Promote only active-list disablements that pass. Keep plugin folders and exact config copies in `G:\Cua Bac\North-backups\North-overlap-cleanup-20260820\` for rollback.

**Tech Stack:** Obsidian JSON configuration, Notebook Navigator 3.3.4, Quick Switcher++ 6.1.6, Quick Explorer 0.2.18, Recent Files 1.7.10, Novel Word Count 4.6.4, Windows Computer Use, PowerShell, Git documentation checks.

## Global Constraints

- Live target is `G:\Cua Bac\North`; disposable target is `G:\Cua Bac\North-startup-performance-clean-20260820`.
- Disable before uninstall; move no live plugin folder until promotion passes.
- Never change note content, templates, FNS settings, task data, Journals data, or Android live data.
- Keep `Tasks`, `Datacore`, `Bases`, `Journals`, `Templater`, `Meta Bind`, `QuickAdd`, `Note Toolbar`, `Custom Sort`, `FNS`, `File Explorer`, `Search`, `Tags`, `Bookmarks`, `Outline`, `Simple Checklist`, `Trash Explorer`, `Hover Editor`, and `Notebook Navigator` active.
- Any Windows UI acceptance requires the exact target foregrounded and maximized before observation.
- Android remains disposable evidence only unless a separate exact live target is identified.

---

### Task 1: Capture rollback state

**Files:**
- Read: `G:\Cua Bac\North\.obsidian\core-plugins.json`
- Read: `G:\Cua Bac\North\.obsidian\community-plugins.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\darlal-switcher-plus\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\quick-explorer\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\recent-files-obsidian\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\novel-word-count\data.json`
- Create rollback copies under: `G:\Cua Bac\North-backups\North-overlap-cleanup-20260820\`

- [x] **Step 1: Confirm target identity and app state**

Run:

```powershell
Get-Item -LiteralPath 'G:\Cua Bac\North'
Get-Content -LiteralPath 'G:\Cua Bac\North\.obsidian\community-plugins.json' -Raw
Get-Content -LiteralPath 'G:\Cua Bac\North\.obsidian\core-plugins.json' -Raw
```

Expected: live path is exactly `G:\Cua Bac\North`, active list has 43 entries, and core `switcher` is `true`.

- [x] **Step 2: Copy only rollback inputs**

Copy exact JSON files and four candidate plugin folders into the dated rollback directory. Do not copy FNS data, full vault content, or credentials.

- [x] **Step 3: Hash rollback inputs**

Run `Get-FileHash` on each copied file and record paths plus hashes in the evidence note outside Git.

Expected: every rollback copy exists and hashes match its source.

- [x] **Step 4: Commit the plan checkpoint**

Run:

```powershell
git add docs/README.md docs/superpowers/plans/2026-08-20-north-overlap-cleanup.md
git commit -m "docs: plan North overlap cleanup"
```

Expected: clean documentation commit on `docs/north-ux-personalization`.

### Task 2: Test core Switcher overlap

**Files:**
- Modify disposable only: `G:\Cua Bac\North-startup-performance-clean-20260820\.obsidian\core-plugins.json`
- Read: disposable `.obsidian\community-plugins.json`

- [x] **Step 1: Set disposable core `switcher` to `false`**

Preserve JSON shape and all unrelated values.

- [x] **Step 2: Restart disposable Obsidian**

Open exact disposable target, foreground it, maximize it, and wait for settled UI.

- [x] **Step 3: Check command palette and Quick Switcher++**

Expected: command palette opens, Quick Switcher++ search still opens, and note navigation works. If core Command Palette or a required command disappears, restore `switcher=true` and mark candidate rejected.

- [x] **Step 4: Record result**

Accept only if no required command or navigation surface is lost.

### Task 3: Test community navigation/count overlap

**Files:**
- Modify disposable only: `G:\Cua Bac\North-startup-performance-clean-20260820\.obsidian\community-plugins.json`
- Preserve folders under disposable `.obsidian\plugins\`

- [x] **Step 1: Disable `quick-explorer` in disposable active list**

Restart and check NN folder reveal, File Explorer reveal, folder browsing, and Note Toolbar creation.

- [x] **Step 2: Disable `recent-files-obsidian` in disposable active list**

Restart and check NN Recent Notes, native search, bookmarks, recent-note opening, Homepage links, and mobile-sized NN layout.

- [x] **Step 3: Disable `novel-word-count` in disposable active list**

Restart and check current-note word count, NN folder/file counts, Homepage, and bottom status bar. Do not remove core `word-count`.

- [x] **Step 4: Keep only candidates with a passed result**

Restore any failed candidate from rollback before testing the next candidate. Record each pass/fail separately.

### Task 4: Promote proven disablements to live North

**Files:**
- Modify: `G:\Cua Bac\North\.obsidian\core-plugins.json`
- Modify: `G:\Cua Bac\North\.obsidian\community-plugins.json`
- Preserve: candidate folders under `G:\Cua Bac\North\.obsidian\plugins\`

- [x] **Step 1: Confirm disposable result and live app is closed**

Do not promote a candidate without a disposable pass and exact live target check.

- [x] **Step 2: Apply only passed active-list changes**

Disable core `switcher` only if Task 2 passed. Remove each passed community ID from active list. Do not delete plugin folders.

- [x] **Step 3: Restart live North and reobserve maximized**

Expected: no source leakage, no dependency error, and no FNS change.

### Task 5: Verify North flow and record result

**Files:**
- Evidence outside Git: `G:\Dusk-Knowledge-Hub\payload\evidence\North-UX-Personalization-20260820-OverlapCleanup\`
- Update: `docs/active-goal.md`

- [x] **Step 1: Verify Windows surfaces**

Check Homepage, NN recent notes, File Explorer, command palette, project/area creation routes, task panel, Simple Checklist, Journals calendar, period navigation, Note Toolbar, and right sidebar.

- [x] **Step 2: Verify no unintended content changes**

Compare hashes for Homepage and shared templates with the prechange values recorded in `docs/active-goal.md`. Confirm no Markdown note was added, deleted, or rewritten.

- [x] **Step 3: Run repository validators**

Run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: all checks pass; secret scan prints filenames only.

- [x] **Step 4: Update current checkpoint and commit**

Record exact enabled-list before/after, candidate results, rollback directory, evidence manifest, Windows result, Android coverage boundary, and next cleanup candidates. Commit with a conventional subject under 50 characters.
