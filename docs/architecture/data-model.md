# Operational data and file contracts

Markdown files are canonical human knowledge. SQL names below are design contracts for operational state, not duplicate note database.

## Canonical vault artifact

- `path`: current vault-relative path.
- `content_sha256`: exact base identity for proposal.
- optional stable `id`: recommended for agent-created/processed notes, never mandatory for ordinary capture.
- body and optional YAML remain readable without plugins.
- Git commit records accepted version history.

## `proposal`

- `id`, `workflow_id`, `target_path`, `operation`.
- `expected_base_sha256`, `proposed_object_ref`, `proposal_sha256`.
- `purpose`, `rationale`, `source_refs`, `processor/prompt/schema/route versions`.
- `status`: `drafting|proposed|approved|rejected|stale|applying|applied|failed|uncommitted`.
- `created_at`, `decided_at`, `applied_at`, `git_commit`.
- `approved_result_sha256`, `staged_git_blob`, `backup_generation_id` when applicable.

Approval is idempotent. Apply succeeds only when current target hash equals expected hash or operation is collision-free new-file creation.

One active proposal exists per target path/base hash/action. Rejected hash stays suppressed until explicit retry or content change. Approved queue workflow includes reviewed destination/removal from pending queue.

## `job`

- `id`, `kind`, `idempotency_key`, payload/object reference.
- `state`, `available_at`, `lease_owner`, `lease_expires_at`, `attempt`, `error_class`.
- Kinds include proposal draft, apply, Git reconcile, OpenViking projection, Telegram attachment, and status delivery.

## `projection_manifest`

- stable vault identity when available, current path, current content hash.
- sensitivity/data policy and desired state.
- OpenViking URI/task/reference, observed hash/path/state, embedding/index contract, last success/error.

Manifest is rebuildable from vault plus policy except remote identity mapping; backup it with operational journal.

## Optional `telegram_capture`

- unique non-secret bot identity plus `update_id`.
- message/chat/reply/media-group identifiers; timestamps/edit version.
- raw text/object reference; attachment metadata/checksum/state.
- sensitivity, received/committed timestamps, processing status.

Raw event is immutable; edits append versions. Receipt database uses WAL on durable local filesystem with full synchronous commits. Text/link commit precedes `Saved`; media metadata commit precedes `Saved metadata; attachment pending`, while final attachment confirmation requires bytes and checksum.

## Model run evidence

- purpose and data class;
- requested route/exact contract and actual model when available;
- processor, prompt, schema, model-policy versions;
- status, attempt, latency, token count, error class;
- source/proposal IDs.

Never store credentials or unnecessary raw prompt/note bodies in operational logs.

Missing data policy resolves locally to `local_only`. External provider cannot classify whether source may be disclosed.

## Idempotency

- proposal draft: target hash + operation + workflow/prompt/schema versions;
- apply: proposal ID + proposal hash;
- projection: vault identity/path + content hash + projection/index contract;
- Telegram: bot identity + `update_id`;
- attachment: stable Telegram file ID plus content hash after download.

## Provenance

```text
accepted note version -> Git commit -> approved proposal -> model run -> source note/capture/context refs
```

User-authored changes may have only Git provenance. OpenViking representation points back to exact vault path/hash and never becomes independent curated truth.
