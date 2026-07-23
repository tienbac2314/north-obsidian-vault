# Active goal before documentation flattening

Status: superseded snapshot archived on 2026-07-22. Content below is preserved verbatim and contains obsolete paths. Use [current active goal](../../active-goal.md).

```markdown
# Active goal

Updated: 2026-07-22

## Objective

Land concise repository authority for Obsidian, FNS, Drive Attachments, and short-lived Git branches. After merge, execute synthetic human-sync pilot before personal data or Hermes vault access.

## Read before continuing

1. [`../../AGENTS.md`](../../AGENTS.md)
2. [Final system design](../design/system-design.md)
3. [First rollout implementation plan](../implementation/first-rollout.md)
4. [Current sync and attachment evidence](../research/2026-07-22-sync-and-extension-reevaluation.md)
5. [Decision log](../decisions/decision-log.md)
6. [Unresolved questions](../decisions/unresolved-questions.md)
7. [Git workflow](branch-workflow.md)

Do not treat `docs/archive/`, `docs/superpowers/`, chat history, or NotebookLM output as current instruction. Promote a conclusion into final design or implementation plan before acting on it.

## Settled behavior

- Obsidian Markdown is canonical human library.
- Ordinary notes stay untouched until moved to `INBOX/Pending Agent Review`.
- Hermes later creates separate deterministic proposals; existing-note edits require explicit command and fresh read.
- Telegram remains ordinary Hermes chat, not Obsidian ingestion.
- OpenViking, embeddings, custom watcher/service, SQLite workflow state, and Telegram capture remain deferred.
- 9Router remains existing generation gateway.

## Human-sync pilot

- FNS is only whole-vault transport on Windows and Android.
- Drive Attachments `0.74.0` runs on Windows only.
- Pasted images upload directly to private Drive; other dropped files require choosing Drive.
- Insert ordinary Markdown links for Android portability.
- FNS synchronizes links and local upload-failure fallbacks.
- No Hermes, MCP, REST, headless client, Git automation, Cloud Preview local deletion, or second sync transport.
- Personal migration waits for all gates in [first rollout plan](../implementation/first-rollout.md).

## Infrastructure boundary

Sanitized inspection found Hermes gateway supervisor ambiguity and rapid PM2 restarts. Do not add vault workload until one supervisor and stable health are proven. Do not change VPS services during documentation work.

## Next action

Merge current documentation PR into `main`. Then start Phase 1 of [first rollout implementation plan](../implementation/first-rollout.md) from a new short-lived task branch. Stop before VPS changes unless repository deployment contract and read-only preflight pass.

## Handoff rule

Update this file only with current checkpoint, exact next action, and unresolved blockers. Preserve durable design in `docs/design/`, executable steps in `docs/implementation/`, rationale in `docs/decisions/`, evidence in `docs/research/`, and superseded context in `docs/archive/`.
```
