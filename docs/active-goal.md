# Active goal

Updated: 2026-07-24

## Objective

Execute [Phase 2 setup and Obsidian customization](roadmap/phase-2-customization.md):
preserve FNS and the unchanged Notion import while recreating the latest
available Dusk experience as closely as practical in `G:\Obsidian`. Ship all
four Dusk surfaces, current Datacore components, dark Dusk styling, useful
templates and actions, selective startup optimization, and user-facing
`dd/mm/yyyy` dates. Verify recovery, sync safety, startup, and Windows runtime;
document decisions and deviations; update the existing reviewed pull request.

Status: Phase 2/2.5 implementation and independent review complete on
`feat/obsidian-phase2`. PR
[#4](https://github.com/tienbac2314/north-obsidian-vault/pull/4) is open,
mergeable, and ready for human merge.

This work prepares Release 2. It does not complete the roadmap's four-week
human-use gate or unrun physical Android matrix.

## Current checkpoint

- Phase 1 PR #3 merged into `main`.
- Isolated worktree created from verified `origin/main`.
- Baseline link, initializer, secret, Mermaid, and whitespace checks passed.
- Agent Reach, OpenCLI, NotebookLM, Oracle VPS access, and the local vault are
  available.
- BrowserAct is excluded. Use the in-app browser only when rendered interaction
  is needed; Computer Use is the last resort.
- `G:\Obsidian\Notion` currently contains 164 files. Its paths and bytes are
  preservation inputs, not transformation scope.
- Pre-change vault plugins were FNS `2.4.0` and Importer `1.8.12`.
- Legacy Dusk inventory contains 58 plugin artifacts and 27
  template/code/CSS files. Newer local Discord material contains Datacore Map
  of Content, Priority Matrix, discontinued Habit Streak RPG, and a
  QuickAdd-dependent Dynamic Form. No Dusk credential or secret-bearing plugin
  data file has been read.
- FNS `3.6.0` storage adapters and Google Drive bridges were reviewed. All
  optional providers remain disabled under DEC-036.
- NotebookLM discovery and adversarial synthesis completed; material claims
  were independently checked.
- DEC-037 supersedes the core-first Phase 2 experience in DEC-036. Release-one
  safety boundaries remain unchanged.
- Windows launch-to-window baseline median is 901 ms across three trials.
- Full 312-file vault recovery copy and matching SHA-256 manifests were created
  outside vault and repository before customization.
- Core-first Home, three Bases, six simple templates, one shallow folder-order
  rule, Minimal theme, Homepage, Minimal Theme Settings, and Custom Sort are
  installed on Windows.
- Earlier core-first runtime inspection confirmed Home startup, plugin load, Base rendering,
  theme/snippet activation, exact root-folder order, and zero visible error
  views. Custom Sort stays instant after delayed startup missed its layout hook;
  idle Lazy Loader was removed.
- Final post-change normal launch mean is 880 ms across three trials versus 940 ms
  baseline. Notion still matches all 164 baseline paths, lengths, and hashes.
- At the earlier core-first checkpoint, Importer and Lazy Loader were removed.
  DEC-037 later reintroduced Lazy Loader for three verified optional delays;
  Importer remains removed.
- At the earlier core-first checkpoint, public FNS health, loaded Windows
  plugin, unchanged FNS configuration hash, and deployment contract tests
  passed. Final review later changed only Configuration Sync from on to off.
- Baseline repository suite passes on a clean branch. Atomic commits already
  remain pushed normally and PR #4 is open against current `main`.
- NotebookLM authentication was refreshed and both designated notebooks were
  queried. Their claims remain non-authoritative until independently verified.
- Current objective, design, and execution checklist are preserved in tracked
  files before rich runtime mutation.
- Fresh pre-rich recovery checkpoint contains 334 files and 64,550,986 bytes.
  Source and backup manifests match exactly. Notion baseline remains 164 files
  and 1,095,099 bytes.
- Fresh launch-to-main-window baseline is 958, 869, and 916 ms; median 916 ms.
- Public legacy Dusk and user-supplied Discord sources were hashed. Current
  Priority Matrix commit and MIT license were verified.
- Fourteen selected Dusk dependencies were downloaded from official releases.
  Every available GitHub SHA-256 digest matched.
- QuickAdd `2.12.3` and Meta Bind `1.4.15` are pinned as newest releases
  compatible with Obsidian `1.12.7`; their newest releases require Obsidian
  `1.13.x`.
- One preflight launch showed all 18 candidate plugins in Obsidian's loaded
  registry. Independent review later removed unused Templater and JS Engine;
  final runtime has 16.
  FNS configuration hash remained unchanged.
- Open mobile compatibility reports confirm that manifest support does not
  equal rich-view parity. Desktop remains primary; plain mobile companion views
  and physical Android deferral remain required.
- Dark Minimal Dusk shell, current Map of Content, current Priority Matrix,
  adapted Mail Box, Project/Area templates, and three mobile companions are
  deployed.
- Windows runtime rendered Home, Map, Priority Matrix, Mail Box, Project, Area,
  and mobile companion notes without visible component errors.
- DataviewJS is enabled for reviewed Dusk-owned files; inline DataviewJS stays
  disabled. Home displays `dd/mm/yyyy`, while stored typed dates remain ISO.
- Two invalid empty Canvas files were the source of Datacore index errors.
  Their paths were preserved and repaired to valid empty Canvas JSON.
- Dynamic Form passed static review, an allowed-root create test, and a
  traversal-rejection test. Exact synthetic output was removed.
- Note Toolbar provides one compact floating menu for Home, Map, Mail, Matrix,
  Today, Capture, and Search without Dusk's missing hotkey or Hider plugins.
- Priority Matrix displayed `25/07/2026`; dragging a synthetic note from Do
  First to Schedule wrote the expected status property. Test note was removed.
- Habit Streak RPG was rejected at isolated preflight because its discontinued
  build stores device-specific state in `window.localStorage`, outside FNS.
- Lazy Loader keeps critical plugins instant, delays Editing Toolbar by five
  seconds, and delays Iconic and Omnisearch by fifteen seconds. Clean runtime
  inspection confirmed all delayed instances loaded without visible errors.
- Final launch-to-window trials were 916, 824, and 847 ms; median 847 ms.
- Notion still matches all 164 baseline path, length, and SHA-256 rows. Review
  changed only FNS Configuration Sync from enabled to disabled; note sync
  remained enabled and runtime reported incremental sync complete.
- Final live matrix passed for nine desktop-rendered rich and mobile-companion
  files. Complete virtualized root order remained
  `HUB`, `STAGING`, `DAILY`, `PARA`, `ZETA`, `Notion`, `SYSTEM`.
- Full repository gate passes: links and reachability, link regression tests,
  vault initializer, filename-only secret scan, nine Mermaid renders, and
  whitespace.
- Independent review found and corrected two authority violations. FNS
  Configuration Sync now persists disabled while note sync stays enabled.
  DEC-038 records the already-connected Notion tree as a bounded personal-data
  exception rather than falsely claiming the synthetic gate held.
- Final completion checkpoint has 409 files and 84,267,967 bytes with zero
  manifest differences. It replaces Configuration Sync as rich-runtime
  recovery.
- Distinct `SYSTEM/Core Hub` pages plus tested enabled-plugin switch provide
  small rollback without overwriting rich HUB files or disabling FNS.
- Homepage now opens Home even from empty workspace; cold relaunch passed with
  sidebars collapsed, one visible floating toolbar, and no visible error.

## Next action

Merge PR #4 when ready. Before Android reconnects, verify Configuration Sync is
off locally and run physical smoke matrix. Keep further personal-data expansion
frozen until Android and recurring independent-backup gates pass. Four-week
human observation remains next Release 2 gate.

## Stop conditions

- Do not expose or copy credentials.
- Do not rewrite, sort, or move Notion content.
- Do not add a second synchronization authority.
- Do not claim Android or four-week human evidence that was not run.
- Preserve a verified recovery copy before vault customization.
- Keep machine-readable date properties in ISO form when required by Obsidian;
  format visible dates as `dd/mm/yyyy`.
- Never copy Dusk wholesale. Select and inspect exact non-secret files.

## Authority

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- [Architecture modules](architecture/recommended-architecture.md)
- [Behavior and experiments](behavior/capture-to-digest.md)
- [First release](roadmap/mvp.md)
- [Phased roadmap](roadmap/phased-roadmap.md)
- [Phase 2 setup and customization](roadmap/phase-2-customization.md)
- [Decision log](decisions/decision-log.md)
- [Git workflow](git-workflow.md)

`docs/archive/`, `docs/superpowers/`, chat history, and NotebookLM output remain history or working evidence unless promoted into current modules or accepted decisions.
