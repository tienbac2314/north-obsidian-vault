# Hermes Agent evaluation

## Evidence

- Official [repository](https://github.com/NousResearch/hermes-agent) and [gateway internals](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/gateway-internals.md).
- Hermes supports messaging gateways, custom OpenAI-compatible endpoints, tools, scheduling, local memory, and external memory providers including OpenViking.
- Documented hooks cover gateway/session/agent/command lifecycle. External memory flush occurs after session lifecycle. This does not prove durable Telegram receipt before model execution or `Saved`.
- Current deployment routes Hermes generation to loopback 9Router.

## Revised role

Hermes already ships a filesystem-first [Obsidian skill](https://github.com/NousResearch/hermes-agent/blob/main/skills/note-taking/obsidian/SKILL.md). Given a plain VPS vault through `OBSIDIAN_VAULT_PATH`, it can list, search, read, create, append, and patch Markdown without a custom note service. Hermes also supports remote HTTP/SSE MCP servers, and Fast Note Sync publishes a specific Hermes configuration.

Simplified Hermes role under evaluation:

- inspect explicitly queued Obsidian note;
- read only queued note and explicitly linked context;
- use existing Obsidian filesystem skill or vetted sync-service MCP;
- call configured model through existing 9Router-backed Hermes provider;
- create a separate proposal note or perform an explicitly approved update.

One narrow custom workflow skill may encode queue paths, proposal naming, forbidden paths, and review rules. Custom Python workspace service, SQLite proposal state, Telegram ingress, and OpenViking are no longer assumed.

All copied note, web, and AI content is untrusted data. Source text cannot request more context, approve mutation, or initiate unrelated tools. First release avoids automatic application: Hermes creates a separate proposal, so a malformed or stale result cannot overwrite its source.

## Native scheduling replaces custom watcher

Official [Scheduled Tasks documentation](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/cron.md) confirms Hermes already supplies scheduling machinery for background pending-note review:

- recurring jobs run from the existing gateway ticker every 60 seconds;
- each run gets a fresh agent session and may attach the bundled Obsidian skill;
- `workdir` can bind the job to an existing vault directory and load its local instructions;
- job schedules, pause/resume/manual run, local output, failure metadata, and run history are built in;
- a file lock prevents overlapping scheduler ticks;
- Hermes records claimed executions in its own bounded `executions.db` ledger before provider dispatch.

That internal Hermes ledger is not a custom pipeline database and needs no new service. A scheduled job can scan `INBOX/Pending Agent Review`, create only missing deterministic proposal paths, and return `[SILENT]` when there is no work. Official [cron troubleshooting guidance](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/guides/cron-troubleshooting.md) notes that cron runs are fresh sessions, require the gateway to remain running, and cannot use interactive clarification. Therefore the review skill and job prompt must be self-contained.

Manual invocation remains available for debugging or immediate runs. The user selected native Hermes cron for automatic discovery in the first design; no filesystem watcher or separate scheduler is justified.

## Candidate minimal contract

- Notes outside `INBOX/Pending Agent Review` are never processed by scheduled review workflow.
- Queued note authorizes reading and proposal creation, not silent overwrite of another note.
- Default output is a separate Markdown proposal visible in Obsidian.
- Existing-note update requires explicit user command or approval and a fresh read immediately before patching.
- Git records accepted changes and provides rollback; it does not decide authorization.
- OpenViking and Telegram remain outside first design.
- Scheduled mode uses deterministic proposal paths derived from source path plus content hash; duplicate calls or stale proposals are tolerable because source notes are never auto-applied.

Moves, renames, merges, delete, archive, `.canvas`, `.obsidian`, `.git`, and system paths stay unavailable in first release.

## Skills versus deterministic tools

Hermes' bundled skill provides ordinary file operations, not a security boundary. Keep workflow skill narrow and task-scoped. Prefer create-only proposal files. Existing-note edits use targeted patching after a fresh read. If later tests show prompt policy is insufficient for path containment or concurrent edits, add the smallest deterministic guard then; do not pre-build a general transaction service.

## Failure behavior

Hermes or 9Router outage leaves queue and ordinary notes unchanged. Sync outage leaves local Obsidian usable. Invalid output creates no accepted note. Existing-note edit failure stops and asks for review. OpenViking has no first-release role.

Detailed historical extension evidence: [sync and agent extension evaluation](../archive/research/sync-and-agent-extensions.md).
