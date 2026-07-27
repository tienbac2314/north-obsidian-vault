# Phase 2 Preparation handoff

Status: repository recovery complete; Phase 2 Preparation has not started.

Branch: `docs/phase2-preparation-reset`.

Authoring baseline: `dfa77eba373239dd6c407ce722caac256dcb3517`, tree
`6af169b5b63479d7a1d8e9f2f55cfd328d1ee4cb`. This handoff is committed after
that baseline. Before continuing, compare local and remote branch tips with
`git rev-parse HEAD` and the external recovery state.

## Read first

1. [Active goal](active-goal.md)
2. [Phase 2 Preparation reset](architecture/phase-2-preparation-reset.md)
3. [DEC-040](decisions/decision-log.md#dec-040-reset-phase-2-preparation)
4. [Historical lessons](archive/2026-07-27-phase-2-preparation-lessons.md)
5. `C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State\RESUME.md`
6. `C:\Users\TienBac\Documents\New project\Dusk-Phase2-Recovery-State\CURRENT-STATE.md`

## Current state

- Phase 1 FNS foundation remains accepted current baseline. It does not claim
  every roadmap Release 1 gate passed.
- Recovery removed obsolete five-agent machinery, historical worktrees and
  branches, PR #7, and approved external evidence packages. `main` history was
  not rewritten.
- Populated `Dusk_light` is future behavioral reference. Compare
  `Dusk_light_empty` later as candidate. Full Dusk is limited to at most three
  bounded experiments after a gap is proven.
- Recovery performed no fresh Obsidian, Android, ADB, FNS, or Computer Use
  acceptance test. Old evidence supplies questions only.

## Recovery archive

Cold archive: `G:\Dusk-Phase2-Cold-Archive-20260727`.

- Post-sanitation ledger contains 9,349 files and 1,678,533,143 bytes; ledger
  SHA-256 is `4855A185F6A86881449B0E409B361558E1596541BA069575559313C84A1241CE`.
- Nine bundles verify. Seven branch restores, three non-empty patch checks, and
  exact unreachable commit/tree restore passed.
- Sanitation intentionally removed 976 plugin `data.json`, browser-profile,
  and raw-log files totaling 70,201,565 bytes. They are not restorable from the
  archive. `state\SECURITY-EXCLUSIONS.csv` identifies them without secret values.
- Use `git bundle verify <bundle>` before restoration. Restore an archived
  branch into a new repository with `git fetch <bundle> <ref>:refs/heads/restored`.

## First Phase 2 Preparation action

Refresh current Dusk GitHub, Discord, plugin-release, and open-issue evidence.
Inspect immutable populated `Dusk_light` completely, including default vault
structure and templates. Then choose one disposable candidate and approve its
safety and test contract before native testing.

First native regression priority is Android daily new-note creation, followed
by weekly and monthly creation. Update plugins, retry compatible disabled
plugins, verify Dataview JavaScript settings, and evaluate DatacoreJS. On both
desktop and Android, create a synthetic note in every section, inspect editing
and reading modes, maximize desktop Obsidian, scroll every surface vertically
and horizontally, and capture a screenshot before leaving each checkpoint.

## Safety and orchestration

- Keep `G:\Obsidian`, Dusk source vaults, FNS, personal notes, credentials, and
  device state outside disposable tests.
- Use synthetic writes only and preserve restoration or discard proof.
- Main agent remains decider and editor. At most one Luna visual Computer Use
  subagent may operate UI checks; do not recreate a swarm.
- Phase 2 Execution starts only after Preparation produces fresh evidence and
  an approved customization plan.

## Suggested skills

- `using-superpowers` for workflow routing.
- `brainstorming` before customization design.
- `writing-plans` after design approval.
- `verification-before-completion` before any promotion claim.
