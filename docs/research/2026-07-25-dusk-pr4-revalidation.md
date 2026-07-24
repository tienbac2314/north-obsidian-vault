# Archived PR #4 Dusk finding revalidation

Date: 2026-07-25

Archive reviewed:

```text
branch: feat/obsidian-phase2
commit: 5c689ef
```

Status labels:

- **Confirmed**: current source, public evidence, or disposable runtime agrees.
- **Stale**: once valid but version/context changed.
- **Contradicted**: current evidence disagrees for the current source bundle.
- **Still unknown**: no safe current test resolves it.

The archived branch remains historical. None of its live-vault modifications
is authority after DEC-039 and PR #6.

## Revalidation ledger

| Archived finding | Verdict | Current evidence and reuse rule |
|---|---|---|
| Public legacy Dusk plus supplied Discord files are separate provenance layers | **Confirmed** | Current sole local authority contains four legacy variants and a distinct `new from discord` directory. Keep provenance separate |
| Git Priority Matrix supersedes loose local copies | **Confirmed** | `DuskWasHere/Priority_Matrix` remains unarchived at the same inspected commit `bb0b67de694b9171b5ae80d6522303cfacf2ecc8`, MIT licensed, last pushed 2026-01-25. Use as reference only |
| Obsidian 1.12.7 requires compatible, not always newest, plugin releases | **Confirmed** | Official Update all selected Datacore 0.1.29, Dataview internal 0.5.68, Tasks 8.3.0, QuickAdd 2.12.3, Meta Bind 1.4.15, Note Toolbar 1.34.12, Tabs 1.2.1, Editing Toolbar 4.0.11, Omnisearch 1.29.3, and Iconic 1.1.10 |
| Dataview 0.5.70 release asset reports internal 0.5.68 | **Confirmed** | Obsidian installed/reported 0.5.68. Do not rewrite the manifest |
| Newest QuickAdd, Meta Bind, Templater, and Admonition may require newer Obsidian | **Confirmed/currentized** | 1.12.7 installed QuickAdd 2.12.3, Meta Bind 1.4.15, Templater 2.20.6, and Admonition 11.0.0 while upstream had newer releases |
| Selected trimmed runtime could remove Templater and JS Engine because deployed notes did not call them | **Contradicted for source** | Current source Home contains a JS Engine block and source templates contain Templater expressions. The archive's removal applied only to its rewritten runtime |
| Repository-owned mobile companions avoided Datacore and Tabs | **Contradicted for source** | Current source Mobile Map of Content and Mobile Mail Box contain `datacorejsx`; Mobile Home contains Tabs and several executable/query blocks |
| Lazy Plugins 1.0.24 was justified by delayed optional plugins | **Stale/context-specific** | Lazy Plugins is not installed in any source variant. No current per-plugin startup profile justifies adding it |
| Style Settings 1.0.9 and selected Dusk visual CSS worked | **Confirmed narrowly** | Style Settings remains in source and loaded. Current visuals render, but archived repository-owned CSS was a redesign, not source payload |
| Archived adapted Dynamic Form had path guards, no network/shell/delete/rename, and passed traversal rejection | **Confirmed only for adapted copy** | Current raw Discord `DynamicFormScript.js` is a different hash and accepts configurable vault paths. Do not reuse the archived safety conclusion without porting/reviewing its guards |
| Priority Matrix drag could write `eisenhower_status` while preserving ISO date storage | **Still unknown for current copy/mobile** | Static current code has read/create/modify authority and public commit matches, but Goal 1 did not execute drag/write on physical Android |
| Habit Streak RPG stores category state in `window.localStorage`, creating device divergence | **Confirmed** | Current source explicitly gets/sets `habitStreakRpg_customCategories` in `window.localStorage`; it also relies on `dc.require` and global window functions |
| Habit Streak RPG was discontinued and should not be deployed | **Confirmed as conservative disposition** | Supplied context calls it discontinued; no current public release/provenance was established. Large executable surface remains unjustified |
| Archived selected Windows runtime rendered nine surfaces with no visible error | **Confirmed only for archived redesign** | Corrected source-safe copies displayed disabled DataviewJS task cards and raw Datacore source on Home, Map of Content, and Mail Box. Plugin configuration required to reproduce source behavior was intentionally excluded |
| Median 847 ms launch represented Dusk performance | **Stale/context-specific** | Archive correctly labeled this a narrow window metric for a trimmed 16-plugin runtime. Corrected full Windows reload completed within 4 seconds; corrected Android full startup became ready between 11.7 and 19.7 seconds |
| Physical Android remained deferred | **Contradicted/superseded** | Current Goal 1 used an authorized Android 14 physical device for first open, updates, popups, restart, rotation, background/resume, keyboard, locale, and surface captures |
| Whole `.obsidian` copy, Todoist, Custom Frames, sharing/publishing, and private workspace state should be rejected | **Confirmed** | Current sanitization enforced the same boundary; credential/config paths remained unopened |
| FNS Configuration Sync can silently become enabled and must be rechecked | **Confirmed as a reusable gate** | Archive found and corrected that drift. Current disposable FNS was absent/off, and current live policy still requires Configuration Sync off |
| Imported Notion tree integrity checks proved Dusk source safety | **Stale/non-transferable** | They proved the archived live operation did not alter that specific tree. They do not prove current source/runtime safety or authorize new personal data |
| Empty Canvas `{}` repair was required | **Stale/non-source** | No `.canvas` file exists in the current supplied Dusk source root. This belonged to the archived live-vault state |
| Homepage `openWhenEmpty: false` caused an empty-window cold-launch edge | **Still relevant but not reproduced** | Current source Home opened during tests, but Goal 1 did not isolate that exact condition. Retain as a regression case, not a confirmed current defect |

## Reusable findings

- Version selection and exact compatible release evidence.
- Separate provenance for legacy vault, Discord capture, and public Priority
  Matrix repository.
- Whole-vault rollback, not single-plugin downgrade.
- ISO stored dates with locale-specific display.
- Explicit rejection of credentialed/network/config-sync paths during design.
- Executable-note review and path guards before any Dynamic Form or Priority
  Matrix trial.
- Physical Android as a required promotion gate.

## Findings not reusable unchanged

- Archived live folder/template/CSS layout.
- Its 16-plugin selected runtime and Lazy Plugins delays.
- Its guarded Dynamic Form copy as if it were the supplied raw script.
- Its clean Windows result as evidence for the current 43/44-plugin source.
- Its mobile-companion architecture.
- Its 847 ms launch metric.
- Any private/live-vault integrity result as permission to promote Dusk now.
