# Documentation map

Root [`README.md`](../README.md) is repository entrypoint. [`AGENTS.md`](../AGENTS.md) defines contributor rules.

## Current design authority

Read [executive summary](executive-summary.md) for orientation, then use modules needed for decision or implementation:

- [System design](system-design.md) - complete product behavior, release boundaries, authority, stack, and promotion gates.
- Architecture: [recommended architecture](architecture/recommended-architecture.md), [options](architecture/options.md), [data contracts](architecture/data-model.md), [failure handling](architecture/failure-handling.md), [security](architecture/security.md), and [diagrams](architecture/diagrams.md).
- Behavior: [capture to growth](behavior/capture-to-digest.md), [Hermes approved apply and link gardening](behavior/hermes-apply-and-link-gardening.md), [interaction examples](behavior/interaction-examples.md), and [experiments](behavior/experiments.md).
- In-vault manual: [vault operating guide](../vault-template/SYSTEM/Guides/vault-operating-guide.md).
- Roadmap: [first production-worthy release](roadmap/mvp.md) and [evidence-gated roadmap](roadmap/phased-roadmap.md).
- Decisions: [decision log](decisions/decision-log.md) and [unresolved questions](decisions/unresolved-questions.md).
- Current checkpoint: [active goal](active-goal.md).
- Repository operation: [Git workflow](git-workflow.md).

Summaries navigate. They never replace detailed modules. Minimalization applies to runtime components and automatic authority, not to design explanation.

## Current evidence

- [Sync, history, and attachment reevaluation](research/2026-07-22-sync-and-extension-reevaluation.md)
- [NotebookLM adversarial review](research/notebooklm-adversarial-review.md)
- [Obsidian](research/obsidian.md)
- [Hermes](research/hermes.md)
- [9Router](research/9router.md)

Research supports decisions but does not authorize implementation. Refresh time-sensitive facts only when relevant gate or decision begins.

## Preserved work

- [Skill-generated work index](generated-work-index.md) - working specifications and plans, some superseded.
- [Archive index](archive/README.md) - historical investigations and dated snapshots.

Git history preserves prior forms of current design modules. Do not duplicate them into another “legacy design” tree solely to keep old wording.
