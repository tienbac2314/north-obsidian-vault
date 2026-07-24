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

Status: rich Dusk redesign approved on `feat/obsidian-phase2`; PR
[#4](https://github.com/tienbac2314/north-obsidian-vault/pull/4) remains open
while implementation continues.

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
- Runtime inspection confirmed Home startup, plugin load, Base rendering,
  theme/snippet activation, exact root-folder order, and zero visible error
  views. Custom Sort stays instant after delayed startup missed its layout hook;
  idle Lazy Loader was removed.
- Final post-change normal launch mean is 880 ms across three trials versus 940 ms
  baseline. Notion still matches all 164 baseline paths, lengths, and hashes.
- Importer and Lazy Loader are removed from enabled runtime and synchronized
  configuration, then recoverably archived beside the pre-change backup.
- Public FNS health, loaded Windows plugin, unchanged FNS configuration hash,
  and deployment contract tests pass.
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

## Next action

Resolve current plugin releases and scorecards, install exact inspected
dependencies one group at a time, then implement the rich runtime task-by-task
from the tracked
[Dusk recreation plan](superpowers/plans/2026-07-24-dusk-runtime-recreation.md).

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
