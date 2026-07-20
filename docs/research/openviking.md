# OpenViking evaluation

## Verified capabilities

- Accessed 2026-07-21. Pilot must record exact deployed release/commit before relying on lifecycle behavior.
- Official [repository](https://github.com/volcengine/OpenViking), [resource API](https://docs.openviking.ai/en/api/02-resources), [filesystem API](https://docs.openviking.ai/en/api/03-filesystem), [setup](https://docs.openviking.ai/en/getting-started/04-setup-for-agent), and [changelog](https://docs.openviking.ai/en/about/02-changelog).
- OpenViking exposes hierarchical context resources, memories, skills, sessions, server/CLI, explicit resource ingestion/task state, filesystem move/remove operations, and configurable embedding/VLM endpoints.
- Local directory ingestion honors `.gitignore`; reread/watch behavior depends on source type. Uploaded temporary snapshots are not generic permanent directory mirrors.
- Recent changelog fixes cover locks, move/URI mapping, queue/task persistence, and vector recovery. Lifecycle remains version-sensitive.

## Fit

OpenViking complements Obsidian when used asymmetrically:

- Obsidian owns human-readable pages.
- OpenViking first stores only derived retrieval representation. Native agent memories are separate non-rebuildable state and stay disabled until independent authority, retention, deletion, and backup policy exists.
- Hermes reads recall results, then verifies exact vault file before proposing change.

It overlaps a knowledge SQLite database, so no separate structured knowledge DB is planned. It does not replace tiny operational SQLite needed for Telegram durable receipt, proposal state, idempotency, and file concurrency.

## Projection contract

Use explicit manifest mapping vault identity/path/hash and sensitivity policy to OpenViking URI/task/observed state. Reconciler excludes `.git`, `.obsidian`, conflicts, proposals, system state, secrets, and restricted paths. It explicitly schedules verified add/move/remove/update operations. Vault remains canonical during failure.

Do not assume arbitrary directory watcher can infer rename, authorship, or authorization. Exact content-update sequence must be verified against pinned version before implementation.

## Model policy

VLM/L0/L1 derivations may use allowed 9Router route because outputs are rebuildable. Embeddings must use exact immutable contract and fail closed. Compare exact no-substitution 9Router route with local Ollama `embeddinggemma` on bilingual retrieval and ARM64 throughput.

## Promotion gate

Postpone until first Obsidian release passes. Promote only if pinned-version lifecycle, restore/rebuild, deletion, privacy isolation, and prewritten retrieval evaluation all pass. OpenViking outage must never block note creation, sync, review, or accepted vault edit.
