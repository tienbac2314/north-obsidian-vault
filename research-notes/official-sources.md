# Official source register

Access date for every source below: **2026-07-19**.

This register separates statements published by component owners from project interpretation. Repository commit hashes were read through the GitHub API. Web documentation without a commit hash is identified by the version or page date visible at access time.

## Capture and interface sources

### Telegram Bot API

- Source: [Telegram Bot API](https://core.telegram.org/bots/api)
- Official: Yes, Telegram.
- Version: Bot API 10.2, published 2026-07-14.
- Verified facts: incoming updates carry increasing `update_id` values suitable for duplicate suppression and ordering recovery; `reply_to_message` exposes same-chat reply context; `media_group_id` identifies grouped media; pending updates are retained no longer than 24 hours; webhooks retry non-2xx deliveries.
- Interpretation: Telegram provides durable-enough delivery signals for an ingestion adapter, but the pipeline must persist an update before acknowledging it and must not treat Telegram as long-term storage.
- Implication: use `(bot identity, update_id)` as an idempotency key and reply/media-group identifiers as strong grouping signals.
- Remaining uncertainty: Hermes Gateway acknowledgement timing and replay behavior require a live capture experiment.

### Notion API

- Sources: [Request limits](https://developers.notion.com/reference/request-limits), [webhook event delivery](https://developers.notion.com/reference/webhooks-events-delivery), [API introduction](https://developers.notion.com/reference/intro).
- Official: Yes, Notion.
- Version: current API examples use `Notion-Version: 2026-03-11`; data-source terminology introduced by the 2025-09-03 API version remains current.
- Verified facts: requests are rate limited and can return 429/529; payloads are capped at 1,000 blocks and 500 KB; rich-text content is limited to 2,000 characters per object; webhook events may be aggregated, delayed, retried, or delivered out of order and contain signals rather than full changed content.
- Interpretation: Notion is a useful review surface, not a reliable raw-event queue or sole source of truth for large copied payloads.
- Implication: write through an outbox, preserve raw content elsewhere, retry with idempotency, and fetch current page state after webhook signals.
- Remaining uncertainty: exact plan-specific API entitlements and attachment limits must be tested with the connected workspace.

### Notion repeating database templates

- Source: [Database templates](https://www.notion.com/help/database-templates).
- Official: Yes, Notion Help Center.
- Version: page current at access date; no document version exposed.
- Verified facts: a database template can repeat daily, weekly, monthly, or yearly and automatically creates a page.
- Interpretation: existing journal can solve page creation without custom automation, but empty repeated pages do not solve reflection.
- Implication: use built-in repetition only if daily blank pages remain desirable; pipeline digests should be event-driven.
- Remaining uncertainty: exact created-time/date-property behavior should be tested in the current workspace.

### Obsidian

- Source: [How Obsidian stores data](https://github.com/obsidianmd/obsidian-help/blob/21a11f649571d2fbf02b4d639c5c352009fe07e9/en/Files%20and%20folders/How%20Obsidian%20stores%20data.md).
- Official: Yes, `obsidianmd/obsidian-help`.
- Commit: `21a11f649571d2fbf02b4d639c5c352009fe07e9` on `master`.
- Verified facts: notes are Markdown-formatted plain-text files in a local vault folder; external editors may modify them; Obsidian maintains a rebuildable metadata cache.
- Interpretation: Obsidian is a portable future reading/editing interface over files, not necessary for first capture loop.
- Implication: a Markdown export boundary preserves a low-cost migration path.
- Remaining uncertainty: mobile synchronization choice and plugin requirements have not been selected.

## Processing and model sources

### Hermes Agent

- Sources: [repository README](https://github.com/NousResearch/hermes-agent), [memory providers](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/memory-providers.md), [FAQ](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/reference/faq.md).
- Official: Yes, Nous Research.
- Commit: `e598cef87465981fcea1c0339edfcf5d9716c917` on `main`; latest release observed `v2026.7.7.2`.
- Verified facts: one Gateway process supports Telegram and other channels; custom OpenAI-compatible model endpoints are supported; built-in local memory remains active while at most one external memory provider is selected; OpenViking and Supermemory are bundled external-provider choices.
- Interpretation: Hermes can orchestrate capture and scheduled synthesis, but its conversational session state should not be the only raw store.
- Implication: keep Telegram ingestion/persistence in a small adapter and invoke Hermes or a model worker after persistence.
- Remaining uncertainty: safest extension point for capture-before-agent execution needs a code-level spike against the installed version.

### 9Router

- Sources: [README](https://github.com/decolua/9router/blob/master/README.md), [architecture](https://github.com/decolua/9router/blob/master/docs/ARCHITECTURE.md), [Docker deployment](https://github.com/decolua/9router/blob/master/DOCKER.md), [releases](https://github.com/decolua/9router/releases).
- Official: Yes, `decolua/9router`.
- Commit: `0513bf393fb0eedd2baecdadb54b6129976a706c` on `master`; latest release and deployed version observed `v0.5.35`.
- Verified facts: 9Router exposes an OpenAI-compatible API; supports model-combo and account-level fallback; translates provider formats; tracks usage; current Docker documentation identifies SQLite persistence and automatic migration backups. Request logging may contain full headers and bodies when enabled.
- Interpretation: 9Router is valuable centralized generation routing, but fallback changes model identity and therefore conflicts with embedding-index consistency.
- Implication: route replaceable classification/synthesis generation through 9Router; pin embeddings to one explicit provider, model, dimensions, and index generation.
- Remaining uncertainty: architecture document was last updated 2026-02-06 and still describes older JSON storage while current Docker docs and deployment use SQLite.

### Supermemory

- Sources: [official changelog](https://supermemory.ai/changelog/), [how it works](https://supermemory.ai/docs/concepts/how-it-works), [ingestion](https://supermemory.ai/docs/add-memories), [search](https://supermemory.ai/docs/search).
- Official: Yes, Supermemory.
- Commit: `566be208981aa23ef20a85fd50a737861b1b10b2` on `main`; self-hosted release observed `server-v0.0.5`.
- Verified facts: local server 0.0.5 supports pluggable embeddings but locks provider/model choice to prevent incompatible vectors; ingestion supports caller-supplied IDs; search supports hybrid retrieval; inferred memories can be reviewed before durability in hosted product flows.
- Interpretation: Supermemory supplies useful experiment ideas but adds semantic processing before basic capture reliability is proven.
- Implication: keep it outside MVP critical path; retain current instance for comparison only.
- Remaining uncertainty: local-server export, restore, and exact memory provenance behavior require dedicated testing.

### OpenViking

- Sources: [repository README](https://github.com/volcengine/OpenViking/blob/main/README.md), [official documentation](https://docs.openviking.ai/), [repository](https://github.com/volcengine/OpenViking).
- Official: Yes, Volcengine.
- Commit: `379c19f66ea60d91a6beab334900a8f1867c682b` on `main`; latest release observed `v0.4.10`.
- Verified facts: OpenViking exposes a hierarchical `viking://` context filesystem with resource, memory, skill, and session concepts; deployments configure storage, embedding, and optional VLM services; vector indexes can be reindexed independently or with semantic artifacts.
- Interpretation: strong possible future context backend, but younger and operationally broader than MVP needs.
- Implication: postpone until a file/SQLite corpus and measured retrieval failures justify it; pilot with pinned embeddings and backup/restore.
- Remaining uncertainty: data migration from this pipeline and stable identity/isolation semantics need a version-pinned pilot.

## Research provenance rule

Each supporting document links back to this register or to a redacted local observation. Marketing claims, benchmark claims, and star counts are not treated as architecture evidence. When an official source conflicts with the running deployment, the deployment observation is recorded as current fact and the source is marked potentially stale.
