# Active goal

Updated: 2026-07-24

## Objective

Execute [Phase 2 setup and Obsidian customization](roadmap/phase-2-customization.md):
research current FNS storage and maintained Obsidian options, preserve the
Notion import unchanged, port useful Dusk behavior without its obsolete runtime,
customize `G:\Obsidian` with a minimal fast plugin set, verify recovery and sync
safety, document decisions, and deliver a reviewed pull request.

Status: in progress on `feat/obsidian-phase2`.

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
- Current vault plugins are FNS `2.4.0` and Importer `1.8.12`.
- Dusk inventory contains 58 plugin artifacts and 27 template/code/CSS files;
  no Dusk credential or plugin data file has been read.
- FNS `3.6.0` storage adapters and Google Drive bridges were reviewed. All
  optional providers remain disabled under DEC-036.
- NotebookLM discovery and adversarial synthesis completed; material claims
  were independently checked.
- Accepted core-first Dusk/QOL set is recorded in DEC-036 and current research.
- Windows launch-to-window baseline median is 901 ms across three trials.
- Full 312-file vault recovery copy and matching SHA-256 manifests were created
  outside vault and repository before customization.

## Next action

Implement accepted vault template and runtime configuration, then verify
startup, FNS, Notion byte preservation, rollback, and repository checks.

## Stop conditions

- Do not expose or copy credentials.
- Do not rewrite, sort, or move Notion content.
- Do not add a second synchronization authority.
- Do not claim Android or four-week human evidence that was not run.
- Preserve a verified recovery copy before vault customization.

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
