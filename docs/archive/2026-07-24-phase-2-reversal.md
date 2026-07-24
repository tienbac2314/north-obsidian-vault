# Phase 2 Dusk recreation reversal

Status: superseded implementation history. Do not execute the archived plan or
merge its branch.

## Outcome

Pull request
[#4](https://github.com/tienbac2314/north-obsidian-vault/pull/4) attempted to
recreate Dusk feature-by-feature. It was closed without merge on 2026-07-24.
The approach produced useful research and working experiments, but too much
custom reconstruction, documentation, and configuration for a legacy vault
that already ran on Windows and Android with smaller known mobile defects.

The live vault was restored to its exact pre-Phase-2 content baseline. Next
work evaluates direct import of a user-tested Dusk variant plus separately
reviewed Discord deltas and plugin upgrades. No Dusk source, plugin ledger, or
promotion plan is accepted yet.

## Preserved state

Exact Git history remains on branch
[`feat/obsidian-phase2`](https://github.com/tienbac2314/north-obsidian-vault/tree/feat/obsidian-phase2)
at commit `5c689ef`. It includes:

- Phase 2 customization and implementation evidence;
- Dusk runtime inventory and redesign research;
- DEC-036 through DEC-038;
- architecture, security, failure, roadmap, active-goal, specification, and
  implementation-plan changes;
- runtime verification and review corrections.

Inspect a preserved file without switching branches:

```powershell
git show feat/obsidian-phase2:docs/research/2026-07-24-dusk-runtime-inventory.md
git show feat/obsidian-phase2:docs/research/2026-07-24-dusk-runtime-redesign.md
git show feat/obsidian-phase2:docs/research/2026-07-24-phase-2-customization.md
git show feat/obsidian-phase2:docs/research/2026-07-24-phase-2-implementation-evidence.md
git show feat/obsidian-phase2:docs/roadmap/phase-2-customization.md
```

The full superseded runtime remains outside repository and synchronized vault
at:

```text
G:\Obsidian Backups\phase-2-overengineered-archive-20260724-161231
```

Final archive evidence recorded during rollback:

- 409 files;
- 84,268,113 bytes;
- canonical content-manifest SHA-256
  `8F9B6F26BA095EC16D1FDB30FA917974C7924422C585E7F64C770F2A1CF0B8C8`.

## Restored live-vault baseline

Rollback verification recorded:

- 312 total files;
- 294 non-`.obsidian` baseline rows with zero differences;
- 164 Notion files with zero baseline differences;
- no `SYSTEM/Components/Dusk`;
- no `SYSTEM/Core Hub`;
- only `fast-note-sync` enabled and loaded;
- FNS note synchronization enabled;
- FNS Configuration Sync disabled;
- Obsidian core Sync disabled;
- FNS incremental runtime idle without visible error.

FNS downloaded 29 removed Phase 2 files during rollback because server state
interpreted local absence as a download request. Those exact paths were
deleted through Obsidian while FNS was connected, remained absent after idle,
and passed final manifest comparison. Future mass rollback must account for
this behavior.

## Reusable findings

Reuse observed source inventories, hashes, plugin manifests, compatibility
failures, security boundaries, Windows behavior, and mobile questions after
revalidation. Do not inherit the archived solution or plugin selection by
default.

Keep these boundaries:

- FNS remains sole live synchronization authority.
- Obsidian core Sync and FNS Configuration Sync remain disabled.
- Preserve `Notion` and `SYSTEM/Media`.
- Never read, print, copy, or commit `.obsidian/todoist-token` or secret-bearing
  plugin data.
- Test imports and plugin changes in disposable vaults with FNS disabled.
- Back up and manifest before any live promotion.

## Next design direction

Compare the tested populated and empty Dusk variants, establish exact source
authority, reproduce baseline behavior before upgrades, apply Discord
components separately, and test plugin migrations in isolated increments.
Promote only after concise design, executable plan, Windows evidence, Android
evidence or accepted defects, secret exclusion, rollback proof, and independent
review.

This record preserves why the previous work stopped. It does not authorize a
new Dusk runtime.
