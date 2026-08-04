# Phase 2 Preparation handoff

Status: Wave 4 closed; structure-refactor Tasks 1-6 accepted; Wave 5 is
`COMPLETE_WITH_EXPLICIT_GATES` after disposable repairs and affected reruns.
Wave 6/Task 7, Wave 7/Task 8, and Wave 8/Task 9 are `NOT STARTED`.

Branch: `docs/phase2-preparation-reset`.

Current product branch: `docs/phase2-preparation-reset`. Resolve current
product HEAD/tree with `git rev-parse HEAD` and `git rev-parse 'HEAD^{tree}'`.
The protected product `main` and detached `bf23` worktree remain unchanged.

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
- Wave 4 accepted disposable findings include Journals as sole periodic owner,
  Templater daily creation repair, retained Datacore `0.1.29` after BRAT was
  disabled, and disabled credential-bearing Todoist. Wave 5 repaired the
  Journals/Templater cursor-marker integration defect, duplicate/ghost
  surfaces, stale mappings/status items, and six proven zero-reference bloat
  candidates. Projects remains enabled on Windows because QuickAdd and Note
  Toolbar consume its command.
- Getting Started guide Markdown navigation remains in scope. Its 82 image
  references/81 unique basenames depict full-Dusk reference media and are not
  Dusk_light acceptance requirements. No full-vault media was imported.
- Part 2 current orchestration has no fixed Terra main or persistent Luna
  operator. Main may use Computer Use directly. Another agent, if needed, is a
  separate full user-visible `gpt-5.6-luna` task with `max` reasoning created
  only after a durable checkpoint and given exclusive target ownership.

## Recovery archive

Cold archive: `G:\Dusk-Phase2-Cold-Archive-20260727`.

- Pre-final-ledger observation recorded on 2026-07-27 at the pre-audit baseline:
  the non-definitive ledger contains 9,349 rows representing
  1,678,533,143 bytes; ledger SHA-256 is
  `4855A185F6A86881449B0E409B361558E1596541BA069575559313C84A1241CE`.
  Archive then had 9,756 files excluding the ledger because final restoration
  proofs were added afterward. These counts are not final publication facts.
  Resolve live archive identity from durable recovery state; do not use this
  ledger as a complete path set or regenerate it before Task 7 Step 5 is
  authorized.
- Nine bundles verify. Seven branch restores, three non-empty patch checks, and
  exact unreachable commit/tree restore passed.
- Sanitation intentionally removed 976 plugin `data.json`, browser-profile,
  and raw-log files totaling 70,201,565 bytes. They are unavailable in the
  sanitized corpus. `state\SECURITY-EXCLUSIONS.csv` identifies them without
  secret values.
- Use `git bundle verify <bundle>` before restoration. Restore an archived
  branch into a new repository with `git fetch <bundle> <ref>:refs/heads/restored`.

## Wave 5 result and next action

Wave 5 used disposable/profile `W5-INTEGRATED-UPDATED-LIGHT-20260803` and the
registered Android serial `01234ABC`. Windows and Android affected reruns
passed after the disposable Journals finalizer, duplicate/ghost cleanup,
mapping/status repair, and six proven zero-reference removals. Raw evidence,
rollback, and the 29-row R8 repair manifest remain outside this product
repository. Known gates remain explicit in Part 2 ledgers; self-review is next.
Do not start Wave 6/Task 7, Wave 7/Task 8, or Wave 8/Task 9.

## Safety and orchestration

- Keep `G:\Obsidian`, Dusk source vaults, FNS, personal notes, credentials, and
  device state outside disposable tests.
- Use synthetic writes only and preserve restoration or discard proof.
- Main session owns decisions, edits, Git, verification, debugging, evidence
  disposition, and may perform Computer Use. Do not call `spawn_agent` or use
  Codex subagents. If another agent is needed, create one full user-visible
  Luna-max task only after a durable checkpoint; one task owns each target at a
  time and main verifies its result.
- Phase 2 Execution starts only after Preparation produces fresh evidence and
  an approved customization plan.
- Push only compact updates on `docs/phase2-preparation-reset`; do not create a
  pull request or merge. Tasks 7-9 and Wave 6 remain not started.

## Suggested skills

- `using-superpowers` for workflow routing.
- `brainstorming` before customization design.
- `writing-plans` after design approval.
- `verification-before-completion` before any promotion claim.
