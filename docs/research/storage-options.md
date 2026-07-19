# Raw and durable storage options

## Requirements

Storage must preserve immutable source/provenance, accept duplicate delivery safely, work during every model/Notion outage, support attachments, permit export/deletion, and remain operable on a 2-core/12-GB VPS.

## Comparison

| Option | Durability/idempotency | Portability | Attachments | Operations | Fit |
|---|---|---|---|---|---|
| Append-only JSONL + files | Good with fsync/atomic rename; indexes separate | Excellent | Filesystem paths/checksums | Simple until updates/queries | Good prototype, weak concurrent state machine |
| SQLite + content-addressed files | Transactions, unique keys, outbox, FTS | Excellent with schema/export | Strong | Low; backup discipline required | Recommended MVP |
| Notion database | API retries/idempotency must be built externally | Export exists but platform-shaped | API limits/workflow | SaaS dependency | Review projection only |
| Markdown vault | Human-readable, Git-friendly | Excellent | Native files | Conflict/index handling | Durable-note export, not event queue |
| Supermemory/vector store | Ingestion IDs and semantic retrieval | Product-specific export | Extraction support | More processing/model dependencies | Experiment after baseline |
| OpenViking | Rich hierarchical context/semantic index | OVPack/filesystem concepts | Resource ingestion | Highest current complexity | Future context backend pilot |

## Recommendation

Use SQLite in WAL mode for metadata/state and content-addressed filesystem objects for binaries/large text. Raw capture transaction stores body inline only below a conservative limit; larger payloads use SHA-256 object path with checksum/size/MIME metadata.

Required database properties:

- unique `(source_system, source_account, source_event_id)`;
- immutable original payload reference and checksum;
- explicit processing state and retry timestamps;
- append-only derivation/feedback records;
- transactional outbox for processor and Notion delivery;
- FTS index rebuilt from canonical text;
- schema migrations and application version.

## Backup

- Daily SQLite online backup or `VACUUM INTO`/backup API, never blind copy during writes.
- Content-object snapshot after database backup begins, with manifest/checksums.
- Encrypted off-host copy and retention tiers.
- Monthly restore test to isolated path with row/object/checksum verification.
- Exclude secrets; restore credentials through separate secret manager/config.

## Rejected shortcut

Writing raw Telegram messages directly to Notion or a vector store makes model/SaaS availability part of capture and obscures source lifecycle. It is simpler only on day one.

## Uncertainty

Expected attachment volume and retention are unknown. First two weeks should measure database/object growth before choosing compression or object storage.

