# Operational data and file contracts

Status: current data and file contract under [system design](../system-design.md).

Markdown files and ordinary vault attachments are canonical human knowledge. No workflow database or hidden metadata store is required for current human pilot. Service databases, product history, and recovery manifests support operation but never replace readable vault authority.

## Vault artifacts

### Human note

- Identity: current vault-relative path plus exact bytes at a point in time.
- Format: ordinary Markdown; YAML and templates remain optional.
- Writer: human through Obsidian or another explicitly approved editor.
- Replication: FNS current-file synchronization during pilot.
- Recovery: independent vault copy, not FNS history alone.
- Automatic meaning: queue and reviewed paths record later workflow intent only; both remain dormant until Hermes promotion, and exact provider read or write additionally requires authenticated receipt where specified.

### Vault attachment

- Identity: vault-relative path plus content hash for test evidence.
- Reference: normal Obsidian wikilink or Markdown link.
- Authority: byte inside vault.
- Default path: `SYSTEM/Media`.
- Replication: FNS.
- Recovery: independent vault copy.
- Required cases: small, large, duplicate, rename, move, delete, offline edit context, and Android open.
- Capture: platform-native Obsidian actions: paste/drop/select on Windows; paste where supported or capture/select on Android.
- Cloud Preview: automatic local deletion remains off; remote preview never becomes canonical authority.

## FNS service state

FNS server database is live synchronization authority for product history, trash, device/vault/account relationships, and pending convergence. Exact schema is product-owned and must not become application contract.

Repository-owned deployment contract records only:

- pinned image or release;
- storage and configuration paths;
- loopback service bind and TLS ingress boundary;
- registration bootstrap/closure procedure;
- stop, start, upgrade, backup, empty-path restore, and rollback commands;
- sanitized fixture counts and expected results.

Never commit database files, account identifiers, tokens, endpoints, raw logs, or archives.

## Recovery evidence record

Each gate produces a sanitized Markdown record under current research or decision path. Record:

- test date and device roles;
- exact public versions;
- fixture classes and counts, not personal filenames or contents;
- operation sequence;
- expected and observed outcome;
- latency band where useful;
- warning/error category without raw sensitive log;
- recovery time and pass/fail;
- independent-copy identifier stored outside repository.

Fixture hashes stay outside repository when they could expose private identifiers. Repository may record equality result or synthetic public hash.

## Independent recovery set

Minimum human-pilot recovery set:

- FNS stopped-service storage and required configuration;
- one current vault snapshot covering notes and every attachment;
- operator documentation and pinned versions;
- sanitized manifest of expected note, history, trash, and attachment counts.

Restore target must be empty and isolated. A copy is not accepted until restored service works and one empty client rebuilds. Independent plain-vault restore must also open notes and attachments without live FNS.

## Later proposal artifact

After Hermes promotion, proposal remains ordinary Markdown under:

```text
STAGING/Agent Proposals/<deterministic-id>.md
```

Candidate contract:

- `id`: derived from canonical source path, exact source SHA-256, and workflow version;
- `source_path`: vault-relative queued note path;
- `source_sha256`: exact queued bytes used;
- `created_at`: human-readable generation time;
- `requested_model`: approved route name when available;
- body: own-words explanation, source-versus-interpretation, relevance, example/caveat, practice step, and suggested links;
- human-review block with exact `Decision: pending` and optional `Feedback:`;
- optional proposed destination and dependent-note patch plan; neither grants authority before later `accept`;
- no claim that proposal metadata grants authority.

Matching identity skips duplicate scheduled work. Changed source creates a new identity. Collision-safe create only; scheduled workflow never overwrites existing proposal.

### Reviewed proposal

User may set proposal decision to `keep`, `revise`, or `reject`, add feedback, and move file to `STAGING/Reviewed`. Reviewed proposal is human-owned Markdown. Movement authorizes Hermes to read that proposal only. `revise` may create one new proposal identified by original proposal identity, exact reviewed bytes, and workflow version. `keep` and `reject` authorize no automated write. No decision authorizes source mutation, filing, deletion, or global preference learning.

After separate Release 4A promotion, `accept` records intent for exact unchanged displayed filing and dependent-note patches. Changing any destination, target, hash, or patch requires `revise` and replacement proposal. Write authority additionally requires authenticated one-time approval receipt outside synchronized vault. Receipt binds reviewed proposal path and SHA-256, immutable plan hash, workflow version, authenticated session, and expiry. Any mismatch grants no write.

### Link-review digest

Weekly or manual changed-note gardener creates at most one create-only Markdown digest per run in `STAGING/Agent Proposals`. Filename includes date and 12-character run ID derived from scan kind, prior checkpoint generation, sorted canonical changed-note path/hash set, and workflow version. Each item records changed note, candidate note, reason, exact patch, proposal-time hashes, `Decision: pending`, and optional feedback. Per-item `apply`, `revise`, or `ignore` records intent only after digest moves to `STAGING/Reviewed`; exact reviewed digest and selected plan hashes require authenticated one-time confirmation before write.

Incremental checkpoint is rebuildable external cache containing allowlisted canonical relative paths, hashes, last successful scan UTC, workflow version, and generation. Generation is SHA-256 over canonical workflow version, scan UTC, and path/hash entries sorted by path, excluding generation field. Stored and recomputed generation must match before use. Checkpoint contains no note text and grants no read or write authority.

## Later review authorization

Read-request tuple:

```text
canonical queued request path + exact request bytes + canonical source path + exact source bytes + explicitly named context + approved workflow version
```

Synchronized queue state records intent but cannot prove user identity. Provider read requires authenticated approval receipt outside vault bound to read-request tuple. Possession of FNS, backup, VPS, Hermes, or 9Router credentials does not expand tuple. Notes elsewhere remain unread and unsent. Source text cannot name extra context as instruction unless user explicitly approves it outside source content.

Write-approval tuple:

```text
canonical reviewed path + exact reviewed SHA-256 + immutable plan hash + canonical target paths + target preimage hashes or destination-nonexistence sentinel + workflow version + authenticated one-time receipt
```

Reviewed Markdown remains immutable after approval. Result is separate receipt keyed by write-approval identity. Model proposes; deterministic executor validates and applies.

Unused approval receipt expires after 15 minutes. Used hash-only receipt and transaction journal remain 90 days. Private preimages remain at least 30 days and until verified independent recovery contains post-state; failure evidence remains until recovery. Human may monthly archive completed reviewed file plus result under `PARA/Archive/Agent Reviews/YYYY/` or delete after filing and recovery. Agent never performs this cleanup.

## Canonical vault path

- vault-relative UTF-8 text with `/` separator and Unicode NFC;
- no absolute, UNC, device, drive-qualified, empty, `.`, `..`, backslash, colon, control, trailing-dot/space, or Windows reserved-name segment;
- no symlink, junction, or reparse-point traversal;
- resolved existing parent and target remain below exact allowlisted root;
- no pair of vault paths may collide after NFC plus invariant case-fold;
- new file has existing canonical contained parent.

## Idempotency without workflow SQLite

- FNS deployment: pinned version plus explicit storage paths.
- Sync fixture: fixture identity plus operation sequence.
- Attachment fixture: vault-relative path plus content-hash equality recorded outside repository.
- Recovery generation: timestamped isolated copy plus manifest stored outside live authority.
- Later proposal: source path plus source hash plus workflow version.
- Later accepted apply: authenticated receipt plus reviewed proposal hash, immutable plan hash, canonical target paths, target preimage hashes or destination-nonexistence sentinel, and workflow version.
- Later link digest: changed-note set and hashes plus scan window and workflow version.

Duplicate proposal generation is a visible inconvenience, not data loss. Apply needs small local transaction journal and immutable result receipts for crash-safe idempotency. Journal records exact preimage and executor-written postimage hash for every completed write. Rollback is permitted only while current bytes equal postimage. Neither journal nor receipt is knowledge or sync authority. Current design still rejects general workflow SQLite and model-managed apply state.

## Provenance

```text
source material -> human note -> selected weekly review -> demonstrated action

queued source path/hash -> later model run -> separate proposal -> human edit or keep decision

vault attachment -> ordinary Obsidian link or embed -> FNS replica -> independent recovery fixture
```

Human-authored note needs no agent provenance. FNS history supports convenient recovery but does not make synchronized copies independent backup.

## Logging boundary

Record public versions, states, counts, timings, route names, hashes only when safe, and error classes. Never store credentials, OAuth data, private endpoints, account identifiers, raw note bodies, prompts, model responses, service databases, or archives in repository evidence.
