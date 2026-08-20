# Custom File Explorer Sorting Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restore Custom File Explorer sorting in live North while keeping its startup load on demand and preserving current sort behavior.

**Architecture:** The plugin is already installed in North and already has an On-Demand `lazyOnDemand` entry. Add only its active community-plugin registration, preserve its existing data settings, restart North, and verify the native File Explorer surface. No vault notes, Notebook Navigator settings, Quick Switcher, or Android files change.

**Tech Stack:** Windows PowerShell, Obsidian North, Custom File Explorer sorting 3.1.6, On-Demand Plugins.

## Global Constraints

- Target only `G:\Cua Bac\North`.
- Keep `custom-sort` mode `lazyOnDemand`.
- Preserve `SORT ORDER` bookmark integration, context submenu, `suspended=false`, and `delayForInitialApplication=1000`.
- Do not change Notebook Navigator, Quick Switcher, Android, or vault notes.
- Back up `community-plugins.json`, On-Demand `data.json`, Custom Sort `data.json`, and `workspace.json` before mutation.

---

### Task 1: Back up exact North configuration

**Files:**
- Read: `G:\Cua Bac\North\.obsidian\community-plugins.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\on-demand-plugins\data.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\custom-sort\data.json`
- Read: `G:\Cua Bac\North\.obsidian\workspace.json`
- Create: `G:\Cua Bac\North-backups\North-custom-sort-restore-20260820\`

- [x] **Step 1: Copy the four exact files to the dated rollback folder**

Run:

```powershell
$north = 'G:\Cua Bac\North'
$backup = 'G:\Cua Bac\North-backups\North-custom-sort-restore-20260820'
New-Item -ItemType Directory -Force -Path $backup | Out-Null
Copy-Item -LiteralPath "$north\.obsidian\community-plugins.json" -Destination "$backup\community-plugins.json" -Force
Copy-Item -LiteralPath "$north\.obsidian\plugins\on-demand-plugins\data.json" -Destination "$backup\on-demand-data.json" -Force
Copy-Item -LiteralPath "$north\.obsidian\plugins\custom-sort\data.json" -Destination "$backup\custom-sort-data.json" -Force
Copy-Item -LiteralPath "$north\.obsidian\workspace.json" -Destination "$backup\workspace.json" -Force
Get-ChildItem -LiteralPath $backup | Select-Object Name,Length
```

Expected: four backup files exist; no vault note is copied or changed.

### Task 2: Enable existing Custom Sort registration

**Files:**
- Modify: `G:\Cua Bac\North\.obsidian\community-plugins.json`

- [x] **Step 1: Add `custom-sort` once to the enabled community-plugin list**

Insert `"custom-sort"` beside the existing community plugin IDs, preserving JSON formatting and every other entry. Do not edit plugin data or On-Demand mode.

- [x] **Step 2: Verify exact configuration values**

Run:

```powershell
$north = 'G:\Cua Bac\North'
$community = Get-Content -Raw "$north\.obsidian\community-plugins.json" | ConvertFrom-Json
$ondemand = Get-Content -Raw "$north\.obsidian\plugins\on-demand-plugins\data.json" | ConvertFrom-Json
$custom = Get-Content -Raw "$north\.obsidian\plugins\custom-sort\data.json" | ConvertFrom-Json
[pscustomobject]@{
  CommunityEnabled = @($community) -contains 'custom-sort'
  Mode = $ondemand.settings.plugins.'custom-sort'.mode
  UserConfigured = $ondemand.settings.plugins.'custom-sort'.userConfigured
  Suspended = $custom.suspended
  ContextSubmenu = $custom.customSortContextSubmenu
  BookmarksIntegration = $custom.automaticBookmarksIntegration
  InitialDelay = $custom.delayForInitialApplication
}
```

Expected: `CommunityEnabled=True`, `Mode=lazyOnDemand`, `UserConfigured=True`, `Suspended=False`, `ContextSubmenu=True`, `BookmarksIntegration=True`, `InitialDelay=1000`.

### Task 3: Restart and verify runtime behavior

**Files:**
- Read: `G:\Cua Bac\North\.obsidian\community-plugins.json`
- Read: `G:\Cua Bac\North\.obsidian\plugins\on-demand-plugins\data.json`

- [x] **Step 1: Restart only the North Obsidian window**

Close the exact North window gracefully, start Obsidian with `--vault=G:\Cua Bac\North`, then foreground and maximize North before inspection.

- [x] **Step 2: Verify native File Explorer sorting surface**

Open North File Explorer, open a folder context menu, and confirm `Custom sort` appears as its own submenu. Confirm `SORT ORDER` bookmark integration remains available. Do not change sort order during this check.

- [x] **Step 3: Verify no unrelated runtime change**

Confirm Quick Switcher remains available, Notebook Navigator remains unchanged, and North opens normally after restart. Record that Android was not mutated.

### Task 4: Commit the durable implementation record

**Files:**
- Modify: `docs/README.md`
- Create: `docs/superpowers/specs/2026-08-20-custom-file-explorer-sorting-design.md`
- Create: `docs/superpowers/plans/2026-08-20-custom-file-explorer-sorting.md`

- [x] **Step 1: Run documentation checks**

Run:

```powershell
rtk git diff --check
rtk powershell -NoProfile -File scripts/check-markdown-links.ps1
rtk powershell -NoProfile -File scripts/check-secrets.ps1
```

Expected: all commands pass.

- [x] **Step 2: Commit documentation**

Run:

```powershell
rtk git add docs/README.md docs/superpowers/specs/2026-08-20-custom-file-explorer-sorting-design.md docs/superpowers/plans/2026-08-20-custom-file-explorer-sorting.md
rtk git commit -m "docs: plan custom file sorting"
```

Expected: one clean documentation commit on `docs/north-ux-personalization`.

## Rollback

Remove only `custom-sort` from `G:\Cua Bac\North\.obsidian\community-plugins.json`, restore the four files from `G:\Cua Bac\North-backups\North-custom-sort-restore-20260820\`, restart North, and leave plugin files and vault notes intact.
