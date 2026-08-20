# Custom File Explorer Sorting

## Goal

Restore Custom File Explorer sorting in live North without adding normal startup load or changing Notebook Navigator, Quick Switcher, Android, or vault content.

## Design

- Enable installed `custom-sort` v3.1.6 in North.
- Keep On-Demand mode `lazyOnDemand`.
- Preserve current `SORT ORDER` bookmark integration, context submenu, active sorting state, and 1-second initial delay.
- Load plugin only when its commands or sorting surface are used.

## Verification

- Confirm manifest, enabled-plugin entry, and On-Demand mode.
- Restart North and confirm it opens normally.
- Open Custom Sort from File Explorer and confirm submenu/settings surface.
- Confirm `SORT ORDER` remains available.
- Confirm Quick Switcher remains enabled.
- Keep rollback under `G:\Cua Bac\North-backups\North-recent-files-restore-20260820` plus a new pre-change copy if needed.

## Rollback

Remove `custom-sort` from North's enabled community-plugin list and restore its prior On-Demand entry. Do not delete plugin files or vault notes.
