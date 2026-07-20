# Hermes and Telegram current state

Status: read-only snapshot from 2026-07-19; may be stale.

- Hermes Gateway was connected to one Telegram DM through polling.
- Hermes used custom OpenAI-compatible loopback route served by 9Router.
- Toolsets included files, vision, memory, scheduling, web, and code execution.
- No durable-before-agent Telegram receipt or polling-offset behavior was tested.
- Hermes documented gateway/session/agent hooks and session-end memory lifecycle do not by themselves prove persistence before `Saved`.

## Revised implication

Direct Obsidian becomes main input. Existing bot can later serve quick capture and commands. Do not modify current gateway during design.

Optional Telegram integration requires separate deterministic ingress with SQLite WAL before acknowledgment, then Hermes processing and vault proposal. Broad current Hermes tool access should not be reused as unrestricted vault mutation authority.
