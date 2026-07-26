# Phase 2 Preparation reset

Status: approved on 2026-07-27. This design governs repository recovery and
Phase 2 Preparation; it does not authorize Phase 2 Execution or live promotion.

## Purpose

Restore one comprehensible project path without rewriting accepted history:

- keep current `main` and its completed Phase 1 FNS foundation;
- move failed Phase 2 material out of active use while retaining useful lessons;
- define a small Phase 2 Preparation stage before any new Dusk execution; and
- make future work understandable without chat history or old agent machinery.

This recovery changes repository authority and preserves evidence. It does not
run Obsidian, ADB, Android, FNS, package installers, or Computer Use.

## Names and release mapping

Project phases and roadmap releases answer different questions:

| Project stage | Meaning | Roadmap relationship |
|---|---|---|
| Phase 1 | Existing FNS foundation and current safe baseline | Does not claim every Release 1 exit gate passed |
| Phase 2 Preparation | Inspect Dusk, select candidate, create fresh disposable desktop/Android evidence, define safety/test contract, and approve customization plan | Promotes no release |
| Phase 2 Execution | Implement and validate approved customized workspace | Must respect every applicable Release 1 and Release 2 gate |

Roadmap labels `Release 0` through `Release 5` remain unchanged. Current files
must not use `Goal 1` as another name for Phase 2 Preparation.

## Baseline and authority

Recovery uses Option A:

- base commit: `571fde461571d842c3912964f86adfa9b0314092`;
- base tree: `ac711cdb04e368b28480ae389b3142ce5e44f5f3`;
- branch: `docs/phase2-preparation-reset`; and
- isolated worktree: `C:\Users\TienBac\Documents\New project\personal-knowledge-pipeline-phase2-reset`.

`main` and existing historical branches remain unchanged. DEC-039 and its
reversal record remain accepted history. New authority may summarize or
supersede active instructions, but must not rewrite what happened.

Current design modules, accepted decisions, roadmap, and active goal remain
authority. Cold archives, old pull requests, research, screenshots,
`docs/archive/`, and `docs/superpowers/` remain evidence only.

## Candidate repository shape

Recovery implementation must stay small:

- remove the five obsolete `.codex/agents/dusk-*.toml` and
  `.codex/agents/obsidian-*.toml` profiles from the candidate tree;
- remove the two obsolete 2026-07-24 Dusk subagent design and plan files;
- rewrite `docs/active-goal.md` around Phase 2 Preparation;
- add the project-phase mapping to the existing roadmap;
- record one accepted reset decision;
- keep one concise historical-lessons document;
- keep this design, one executable preparation plan, and one short handoff; and
- update existing documentation indexes only where reachability requires it.

No new validator, agent framework, dashboard, installer, or audit subsystem is
part of recovery.

## Dusk source strategy

Future work uses the populated `Dusk_light` vault as behavioral reference. It
shows the intended Home, Map of Content, Mail Box, PARA/ZETA relationships,
page tasks, daily/weekly/monthly notes, dynamic actions, templates, hotkeys,
search, desktop/mobile Home behavior, and mobile sorting.

`Dusk_light_empty` may become the later customization candidate after source
comparison. Full Dusk is not a second end-to-end candidate. Phase 2 Preparation
may run at most three bounded full-Dusk experiments, and only for gaps first
proven against `Dusk_light`.

GitHub, Discord, package, and plugin evidence must be refreshed when Phase 2
Preparation begins. Historical captures may identify questions but cannot pass a
current gate.

## Future Phase 2 Preparation validation contract

Phase 2 Preparation must create fresh evidence from disposable vaults. It must:

- keep `G:\Obsidian`, source vaults, FNS state, personal notes, and credentials
  outside test scope;
- maximize desktop Obsidian and verify native desktop and tablet resolution;
- capture a screenshot before leaving each checkpoint;
- scroll every relevant vertical and horizontal surface to its end;
- inspect editing/source mode for configuration and reading view for rendered
  behavior;
- create a new note in every user-facing section, including daily, weekly,
  monthly, project, area, resource, archive, fleeting, and permanent paths;
- verify template insertion, path, metadata, navigation, and rendered result;
- record actual plugin load state and settings on desktop and Android after
  updates, not initial-import defaults;
- explicitly check Dataview JavaScript-query settings and DatacoreJS behavior;
- test command and hotkey IDs against installed plugin versions;
- cover current Dusk GitHub and Discord extension changes; and
- restore or discard every synthetic write with proof.

Daily creation on Android is first priority because prior evidence showed a
broken new-note/template path. Weekly and monthly creation follow the same
end-to-end contract.

Future Phase 2 Preparation uses one main agent as decider and editor. At most one Luna
visual Computer Use subagent may operate the UI; it remains read-only outside
explicit disposable-test writes. Recovery uses one separate Sol xhigh reviewer
only after plan and destructive manifest exist.

## Evidence and archive design

Cold archive root is `G:\Dusk-Phase2-Cold-Archive-20260727`. Before any source
deletion, it must contain:

- every preserved Git ref and a patch per unique branch;
- clean snapshots for registered historical worktrees;
- audit packages 1 and 2 plus the desperate handoff package;
- historical Dusk evidence and its metadata needed to interpret findings;
- current external recovery state;
- the unique unreachable intermediate commit
  `f97eff4816156f7138682ec6dca23d9d21cc7317`;
- checksums, source-to-archive mapping, exclusions, and restoration commands; and
- one successful restoration spot-check from archived bytes.

Archive creation is copy-first. Deletion requires a later exact manifest and
explicit user approval. Missing sources are recorded, not guessed. Name
collisions, checksum mismatches, unexpected reparse points, detected secrets,
or personal content stop the affected item. Secret values must never be
printed. Source archives and `G:\Obsidian` are retained and never modified by
cleanup.

## Gates and failure handling

Work proceeds in this order:

1. User reviews this written specification.
2. One executable recovery plan names every file, command, check, and rollback.
3. Cold archive and exact destructive manifest are prepared without deletion.
4. One fresh read-only Sol xhigh reviewer checks spec, plan, manifest, and diff.
5. Critical findings are fixed and re-reviewed.
6. User approves or rejects exact destructive actions.
7. Only approved actions run; repository checks and archive restoration checks
   run again.
8. Branch is handed off without merging to `main`.

Any failed baseline check, ambiguous target, dirty unrelated worktree, archive
verification mismatch, or reviewer-critical finding stops the dependent step.
No failure widens scope automatically.

## Completion criteria

Recovery is complete only when:

- root `main` remains byte-identical to its starting commit and tree;
- candidate branch contains only approved authority, lessons, plan, and links;
- all tracked Markdown is reachable and repository validation passes;
- cold archive has verified checksums and restoration proof;
- every deletion matches a user-approved exact target;
- reviewer has no unresolved critical finding;
- future agent can start from documentation map, active goal, reset decision,
  this design, execution plan, and handoff without prior chat; and
- no old evidence is represented as fresh desktop or Android acceptance.
