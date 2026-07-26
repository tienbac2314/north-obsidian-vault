# Active goal

Updated: 2026-07-27

## Objective

Complete repository recovery: preserve the completed Phase 1 FNS foundation,
remove failed Phase 2 machinery from active use, retain its useful lessons in
one verified cold archive, and leave one executable Phase 2 Preparation handoff.

Status: Phase 1 foundation complete. Repository recovery is active. Phase 2
Preparation has not started. No Dusk
source, plugin set, desktop result, Android result, or live promotion is
currently accepted.

## Stage mapping

- Phase 1: existing FNS foundation and current safe baseline. This does not
  claim every roadmap Release 1 exit gate passed.
- Phase 2 Preparation: inspect Dusk, select candidate, create fresh disposable
  desktop/Android evidence, define safety and test contracts, and approve one
  customization plan.
- Phase 2 Execution: implement and validate the approved customized workspace.
- Roadmap Release 0 through Release 5 remain evidence gates, not aliases for
  project phases.

## Current authority

- [DEC-039](decisions/decision-log.md#dec-039-archive-hand-built-phase-2-and-restart-import-first)
  preserves the reversal of closed PR #4.
- [DEC-040](decisions/decision-log.md#dec-040-reset-phase-2-preparation)
  selects current `main` as recovery base and makes old Phase 2 evidence
  historical only.
- [Phase 2 Preparation reset](architecture/phase-2-preparation-reset.md)
  defines source, validation, archive, safety, and review boundaries.
- [Implementation plan](superpowers/plans/2026-07-27-phase-2-preparation-reset.md)
  defines exact recovery order.

## Next action

Finish verified cold archive and review. Request exact destructive approval.
Run only approved cleanup, verify repository and archive again, then publish
the future-agent handoff without merging to `main`.

## Safety

- Do not revive PR #4 or PR #7.
- Do not treat historical screenshots or plugin state as current acceptance.
- Do not modify source vaults, `G:\Obsidian`, FNS, personal data, credentials,
  or device state during recovery.
- No Phase 2 Preparation native validation begins during recovery. A later
  Preparation session refreshes current Dusk GitHub, Discord, plugin, desktop,
  and Android evidence before approving an Execution plan.

## Authority

- [Documentation map](README.md)
- [System design](system-design.md)
- [Recommended architecture](architecture/recommended-architecture.md)
- [Evidence-gated roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Phase 1 implementation evidence](research/2026-07-23-fns-implementation-evidence.md)
- [Phase 2 reversal](archive/2026-07-24-phase-2-reversal.md)
