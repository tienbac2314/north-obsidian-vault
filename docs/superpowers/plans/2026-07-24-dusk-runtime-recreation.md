# Dusk Runtime Recreation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> superpowers:subagent-driven-development (recommended) or
> superpowers:executing-plans to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** Recreate the latest available Dusk experience in `G:\Obsidian` while
preserving FNS, Notion bytes, recovery, and a documented rollback.

**Architecture:** Use inspected current Dusk/Discord components rather than
copying `.obsidian` wholesale. Datacore owns rich interactive surfaces; Bases
owns ordinary tables. Track design, source inventory, validation, and rollback
in repository while third-party component source remains in the user vault
unless redistribution terms are explicit.

**Tech Stack:** Obsidian 1.12.x, Fast Note Sync, Datacore, Bases, Dataview,
Tasks, Templater, QuickAdd, Meta Bind, JS Engine, Minimal theme, PowerShell,
Markdown, Git.

## Global Constraints

- Work only in existing isolated worktree `feat/obsidian-phase2`.
- Preserve atomic commits; never amend or rewrite pushed history.
- Keep FNS as sole live sync and optional FNS storage disabled.
- Preserve `G:\Obsidian\Notion` path, length, and SHA-256 identity.
- Never print, copy, or commit credentials, Dusk Todoist token, secret-bearing
  plugin data, private notes, provider identifiers, or raw logs.
- Use current official plugin releases and verify release assets.
- Keep typed dates and filenames ISO; render dates as `dd/mm/yyyy`.
- Do not claim physical Android evidence.
- Update `docs/active-goal.md` after every material checkpoint.
- Stop only at a failed safety gate that cannot be resolved from current
  official/source evidence. Ordinary compatibility defects use best judgment.

---

## Planned file map

| Path | Responsibility |
|---|---|
| `docs/research/2026-07-24-dusk-runtime-redesign.md` | Source facts, risks, accepted and rejected findings. |
| `docs/research/2026-07-24-dusk-runtime-inventory.md` | Exact source hashes, plugin versions, retained components, and deviations. |
| `docs/research/2026-07-24-phase-2-implementation-evidence.md` | Observed backup, runtime, startup, FNS, and Notion results. |
| `docs/roadmap/phase-2-customization.md` | Executable contract. |
| `docs/decisions/decision-log.md` | DEC-037. |
| `docs/active-goal.md` | Live checkpoint. |
| `vault-template/HUB/Home.md` | Core fallback Home. |
| `vault-template/SYSTEM/Guides/vault-operating-guide.md` | Human/agent use of rich surfaces and fallback. |
| `vault-template/SYSTEM/Config/dashboard.css` | Repository-owned safe visual fallback; Dusk snippets stay source-attributed. |

Third-party Dusk/Discord code deployed in `G:\Obsidian\SYSTEM\Components` is not
committed unless its redistribution license is verified. Inventory records
source, hash, destination, and reason.

### Task 1: Record approved redesign

**Files:**

- Modify: `docs/active-goal.md`
- Modify: `docs/system-design.md`
- Modify: `docs/architecture/recommended-architecture.md`
- Modify: `docs/roadmap/phase-2-customization.md`
- Modify: `docs/decisions/decision-log.md`
- Modify: `docs/README.md`
- Modify: `docs/generated-work-index.md`
- Create: `docs/research/2026-07-24-dusk-runtime-redesign.md`
- Create: `docs/superpowers/specs/2026-07-24-dusk-runtime-recreation-design.md`
- Create: `docs/superpowers/plans/2026-07-24-dusk-runtime-recreation.md`

- [ ] Run Markdown link, secret, and whitespace checks.

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: all exit `0`.

- [ ] Commit approved scope.

```powershell
git add docs
git diff --cached --check
git commit -m "docs(obsidian): approve rich dusk runtime"
git push
```

### Task 2: Establish fresh recovery and source inventory

**Files:**

- Create: `docs/research/2026-07-24-dusk-runtime-inventory.md`
- Modify: `docs/active-goal.md`

- [ ] Close Obsidian after resolving exact process path. Create
  `G:\Obsidian Backups\phase-2-pre-rich-dusk-<timestamp>\vault`.

- [ ] Generate sorted SHA-256 manifests for live source and backup. Compare
  exact relative path, length, and hash. Generate separate Notion manifest.

Expected:

- whole-vault source and backup rows match exactly;
- Notion baseline has 164 files unless a new user file was intentionally added;
- backup remains outside vault and repository.

- [ ] Record, without values:

- Obsidian version;
- current enabled plugin IDs and versions;
- current startup measurements;
- FNS config SHA-256;
- exact Dusk source paths and commits;
- selected component hashes;
- filenames rejected because they can contain credentials.

- [ ] Verify inventory contains no token-like value.

```powershell
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

- [ ] Commit inventory.

```powershell
git add docs/research/2026-07-24-dusk-runtime-inventory.md docs/active-goal.md
git commit -m "docs(obsidian): inventory dusk runtime"
git push
```

### Task 3: Resolve current runtime dependencies

**Files:**

- Modify: `docs/research/2026-07-24-dusk-runtime-inventory.md`
- Modify: `docs/active-goal.md`

- [ ] For each candidate dependency, verify official repository, latest stable
  release, manifest `isDesktopOnly`, minimum Obsidian version, release date,
  open compatibility issues, scorecard Health and Review, and exact Dusk
  behavior consuming it.

Required candidates:

```text
datacore
dataview
obsidian-tasks-plugin
templater-obsidian
quickadd
obsidian-meta-bind-plugin
js-engine
obsidian-style-settings
note-toolbar
lazy-plugins
tabs
```

- [ ] Download exact release assets to a temporary directory. Compare each
  downloaded asset SHA-256 with the release API digest when supplied. Inspect
  manifest and configuration schema before live installation.

- [ ] Install only dependencies consumed by selected dashboards. Never
  overwrite Fast Note Sync plugin files or configuration.

- [ ] Launch Obsidian once with components absent. Verify every plugin loads
  independently and no FNS config hash changes.

- [ ] Commit retained/rejected matrix.

```powershell
git add docs/research/2026-07-24-dusk-runtime-inventory.md docs/active-goal.md
git commit -m "docs(obsidian): select dusk dependencies"
git push
```

### Task 4: Recreate visual shell and four surfaces

**Files:**

- Modify: `vault-template/HUB/Home.md`
- Modify: `vault-template/SYSTEM/Config/dashboard.css`
- Modify: `vault-template/SYSTEM/Guides/vault-operating-guide.md`
- Modify: `docs/research/2026-07-24-dusk-runtime-inventory.md`

**Live destinations:**

```text
G:\Obsidian\HUB\Home.md
G:\Obsidian\HUB\Map of Content.md
G:\Obsidian\HUB\Mail Box.md
G:\Obsidian\SYSTEM\Mobile Hub\
G:\Obsidian\SYSTEM\Components\
G:\Obsidian\SYSTEM\Config\Bases\
G:\Obsidian\SYSTEM\Config\Scripts\
G:\Obsidian\SYSTEM\Config\Snippets\
G:\Obsidian\SYSTEM\Templates\
```

- [ ] Reconstruct dark Minimal settings and Dusk snippets field-by-field.
  Keep warm red accent `#ba4949`, Dusk dark scheme, colorful headings, and
  bounded full-width dashboard classes.

- [ ] Recreate Homepage with current folder paths and no Todoist/custom-frame
  network dependency. All primary navigation buttons resolve.

- [ ] Deploy current Map of Content and Priority Matrix components. Adapt only
  path/config values. Preserve source attribution and hashes.

- [ ] Recreate Mail Box using current STAGING review paths and page-task
  properties. Review queue and ordinary inline Tasks stay visibly distinct.

- [ ] Recreate area/project templates and contextual related-note tables.
  Use Bases for ordinary file tables and Datacore for rich controls.

- [ ] Create narrower mobile Home, Map of Content, and Mail Box notes using
  same source paths and properties.

- [ ] Put implementation `.base`, `.jsx`, JavaScript, and JSON under `SYSTEM`;
  keep HUB human-facing.

- [ ] Render dates as `dd/MM/yyyy`; verify stored typed values remain ISO.

- [ ] Commit repository-owned shell, guide, and inventory updates.

```powershell
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
git add vault-template docs
git commit -m "feat(obsidian): recreate dusk workspace"
git push
```

### Task 5: Restore current modular actions

**Files:**

- Modify: `docs/research/2026-07-24-dusk-runtime-inventory.md`
- Modify: `docs/active-goal.md`

- [ ] Inspect Dynamic Form script for filesystem, network, system-command,
  overwrite, and path-traversal behavior. Configure QuickAdd with reviewed
  vault-relative destinations and collision-safe note naming.

- [ ] Verify Priority Matrix property write-back against synthetic notes.

- [ ] Attempt Habit Streak RPG in isolated component folder. Keep it only when
  clean relaunch and basic create/update action work without console error.
  Otherwise record exact failure and install no broad replacement unless a
  maintained mobile-declared alternative matches its concrete behavior.

- [ ] Reproduce Dusk capture, daily-note, focus, and mobile floating-action
  workflows using smallest retained command set.

- [ ] Configure Lazy Loader only after immediate runtime works. Delay one
  optional plugin at a time and clean-relaunch. Revert any delayed plugin that
  misses initialization.

- [ ] Commit action and startup decisions.

```powershell
git add docs/research/2026-07-24-dusk-runtime-inventory.md docs/active-goal.md
git commit -m "docs(obsidian): verify dusk actions"
git push
```

### Task 6: Verify Windows runtime and preservation

**Files:**

- Modify: `docs/research/2026-07-24-phase-2-implementation-evidence.md`
- Modify: `docs/active-goal.md`

- [ ] Run three clean startup trials and compare median and mean with fresh
  pre-rich measurements. Record measurement definition.

- [ ] Inspect runtime and screenshots for:

```text
Homepage
Map of Content
Mail Box
area/project page
Priority Matrix
mobile companion notes at desktop width
```

- [ ] Run synthetic action matrix:

- navigation;
- create note;
- template application;
- task completion;
- page-task status;
- Base inline edit;
- Datacore reactive refresh;
- `dd/mm/yyyy` display and ISO sort;
- attachment embed;
- offline edit/reopen.

- [ ] Verify FNS public health, Windows plugin load, unchanged secret config
  hash, and existing current-file/attachment behavior without repeating
  destructive personal-vault history tests.

- [ ] Regenerate Notion manifest and compare every relative path, length, and
  SHA-256 with baseline.

- [ ] Disable rich plugins temporarily and prove fallback `HUB/Home.md` opens.
  Restore selected runtime and clean-relaunch.

- [ ] Record physical Android checklist as pending.

- [ ] Commit evidence.

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
git add docs/research/2026-07-24-phase-2-implementation-evidence.md docs/active-goal.md
git commit -m "docs(obsidian): record dusk verification"
git push
```

### Task 7: Final review and pull-request update

**Files:**

- Modify: `docs/active-goal.md`
- Modify: PR #4 body

- [ ] Review requirements line-by-line against DEC-037 and this plan. Inspect
  branch diff from `origin/main`; fix Critical and Important findings in new
  commits.

- [ ] Run complete repository suite.

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Expected: every command exits `0`.

- [ ] Verify clean branch and pushed commits.

```powershell
git status --short --branch
git log --oneline --decorate origin/main..HEAD
git push
```

- [ ] Update PR #4 with scope, decisions, retained plugin inventory, exact
  verification, rollback, parity gaps, and deferred Android/four-week gates.

- [ ] Mark goal complete only after PR is ready and no required work remains.

## Self-review

- Spec coverage: every fixed requirement maps to Tasks 2 through 7.
- Placeholder scan: no placeholder or unspecified test step remains.
- Type consistency: machine dates stay ISO; visible dates use `dd/mm/yyyy`.
- Safety consistency: FNS and Notion gates appear before, during, and after live
  changes.
- Scope consistency: public/shared Dusk code is source material; credentials,
  sample/private content, and wholesale `.obsidian` copying remain excluded.
