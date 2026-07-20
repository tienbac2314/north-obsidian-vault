# Hermes Agent evaluation

## Evidence

- Official [repository](https://github.com/NousResearch/hermes-agent) and [gateway internals](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/gateway-internals.md).
- Hermes supports messaging gateways, custom OpenAI-compatible endpoints, tools, scheduling, local memory, and external memory providers including OpenViking.
- Documented hooks cover gateway/session/agent/command lifecycle. External memory flush occurs after session lifecycle. This does not prove durable Telegram receipt before model execution or `Saved`.
- Current deployment routes Hermes generation to loopback 9Router.

## Revised role

Hermes is workflow orchestrator:

- inspect explicitly queued Obsidian note;
- retrieve permitted OpenViking context when available;
- call 9Router for research/synthesis;
- produce structured proposal;
- report status and request approval.

Hermes must not own canonical note bytes, raw Telegram durability, mutation authorization, or unrestricted vault shell. Deterministic workspace service performs apply after policy and hash checks.

All copied note, web, AI, and Telegram content is untrusted data. Proposal drafting runs with no shell, write, deployment, credential, or messaging tools. Source text cannot request more context, change data class, approve mutation, or initiate a tool. Explicit user-requested research uses separate allowlisted tools and query arguments derived from trusted user intent.

## Required tool contract

- `read_vault`: allowed paths only, exact bytes/hash.
- `create_proposal`: target, expected hash, patch/content, rationale, sources, validation.
- `approve/reject`: explicit user action.
- `apply_proposal`: deterministic and idempotent; no LLM decision.
- `query_openviking`: permitted scopes only; derived results require source verification.

Moves, renames, merges, delete, archive, `.canvas`, `.obsidian`, `.git`, and system paths stay unavailable in first release.

## Failure behavior

Hermes or 9Router outage leaves queue unchanged. Invalid output becomes failed proposal. Concurrent edit makes proposal stale. OpenViking outage falls back to exact vault inspection or delays context-dependent work.
