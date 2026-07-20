# NotebookLM adversarial design review

Date: 2026-07-21. Private notebook/conversation identifiers intentionally omitted.

## Method

Six current project documents were added to existing Obsidian-focused notebook. Questions attacked sync, authority, note mutation, Telegram durability, taxonomy, OpenViking lifecycle, 9Router, embeddings, privacy, and VPS constraints. Follow-ups explicitly requested retractions and ended with “What important question are we not asking yet?” Important claims were then checked against official project documentation.

NotebookLM was research partner, not source of truth. Its answers mixed useful critique, inference, stale statements, and unsupported specifics.

## Retained

- Plain Markdown remains canonical and portable.
- Git is useful for history and rollback but separate from edit permission.
- Existing human notes should not receive unrestricted automatic writes.
- Telegram durability must precede model processing.
- 9Router should serve replaceable generation, while embedding identity remains fixed.
- Local CPU vision/reasoning inference is poor default on 2-core ARM64 VPS.
- Sensitive work notes require explicit external-processing policy.

## Changed after challenge

- Obsidian moved from future projection to primary input and canonical human library.
- No filesystem watcher may infer human/agent ownership; sync events lack trustworthy author identity.
- Queue placement authorizes proposal only. Approved write uses expected hash and deterministic tool.
- Small SQLite WAL is allowed for operational proposal/job state and optional Telegram ingress, not knowledge storage.
- OpenViking is explicit manifested projection. Arbitrary directory watching and update behavior are not assumed.
- Full Dusk structure remains available, but capture never requires PARA/Zettelkasten choice.
- Sync provider must pass actual device experiment before approval.

## Rejected NotebookLM output

- Paid Obsidian Sync/headless client: violates user's no-subscription constraint.
- Blanket rejection of Self-hosted LiveSync as too heavy: official project documents low-resource/Raspberry Pi deployment and newer CLI, but fit still needs benchmark.
- Syncthing as obvious Android answer: official Android app was discontinued and repository archived in December 2024.
- Automatic merge of `.sync-conflict` files: official Syncthing behavior propagates them as normal files; automation can create conflict loops.
- OpenViking as durable Telegram receipt: ingestion triggers parsing/persistence/semantic work and is unnecessary critical dependency.
- Direct OpenViking directory-mirror/watch assumptions: official APIs support resource and filesystem operations, but do not prove desired arbitrary mirror semantics.
- Invented Go microservice, fixed external models, endpoint choices, resource measurements, vulnerability claims, and named implementation libraries without sufficient evidence.
- Proposed direct Hermes writes despite simultaneously rejecting unrestricted mutation.

## Postponed

- Canvas generation and layout updates.
- Automatic reorganization, moves, renames, merges, delete, archive, and link repair.
- Managed-section auto-write.
- OpenViking/vector retrieval until plain search baseline fails.
- Telegram as main interface.
- Local VLM/reasoning fallback.

## Required experiments

1. Self-hosted LiveSync versus Remotely Save on Windows, Android, VPS: offline same-note edits, attachments, rename, delete, conflicts, restart, restore, ARM64 resource use.
2. OpenViking pinned-version add/update/move/delete and reconciliation behavior.
3. Dedicated exact 9Router embedding route versus local Ollama `embeddinggemma`: bilingual retrieval, throughput, memory, rebuild, privacy, outage.
4. Proposal service: forbidden paths, stale hashes, crash replay, apply-once, Git failure recovery.
5. Data-class enforcement and proof restricted content never reaches external models or raw request logs.

## Most important unasked questions

- Which notes may legally or ethically leave VPS for external models?
- What happens when primary desktop is offline for days and VPS has pending proposals?
- Which files must be excluded from Hermes/OpenViking context to prevent secrets, system metadata, conflicts, and proposals from feeding themselves back?
- What evidence proves weekly review changes behavior rather than creating another archive?
- Can full system be restored from off-host backup without any live SaaS or primary device?

## Official verification used

- [Syncthing Android repository](https://github.com/syncthing/syncthing-android)
- [Syncthing conflict handling FAQ](https://docs.syncthing.net/users/faq.html#what-if-there-is-a-conflict)
- [Self-hosted LiveSync repository](https://github.com/vrtmrz/obsidian-livesync)
- [Self-hosted LiveSync releases](https://github.com/vrtmrz/obsidian-livesync/releases)
- [Remotely Save repository](https://github.com/remotely-save/remotely-save)
- [Hermes gateway internals](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/gateway-internals.md)
- [OpenViking resource API](https://docs.openviking.ai/en/api/02-resources)
- [OpenViking filesystem API](https://docs.openviking.ai/en/api/03-filesystem)
- [OpenViking setup](https://docs.openviking.ai/en/getting-started/04-setup-for-agent)
- [OpenViking changelog](https://docs.openviking.ai/en/about/02-changelog)
- [9Router architecture](https://github.com/decolua/9router/blob/master/docs/ARCHITECTURE.md)
- [Ollama embeddings](https://docs.ollama.com/capabilities/embeddings)

## Decision effect

Result is narrower but more durable: rich Obsidian-first foundation now, optional derived intelligence later. This keeps user's preferred structure and agent potential without asking sync, model, or vector systems to guarantee properties they do not expose.
