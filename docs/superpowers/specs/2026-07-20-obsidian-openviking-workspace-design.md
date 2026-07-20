# Obsidian, Hermes, OpenViking, and 9Router workspace design

Status: revised design; implementation not started.

Date: 2026-07-20.

Adversarial review: 2026-07-21.

## Purpose

Build a personal engineering workspace that produces better judgment, reusable knowledge, and visible growth. Obsidian is the normal place to write, read, and edit. Telegram is optional quick capture. Hermes coordinates explicit workflows. OpenViking may provide derived machine context. 9Router supplies replaceable generation and vision models.

The design must remain useful when every agent component is down. Plain Markdown and attachments in the logical Obsidian vault are the canonical human library.

## Product rules

1. Writing must not require classification, frontmatter, a template, or an agent.
2. New material may stay in `INBOX/Unsorted` until a weekly review.
3. Moving a note into `INBOX/Pending Agent Review` authorizes inspection and a proposal, not overwrite.
4. Every existing human note is review-required. Filesystem events cannot reliably prove who edited a synced file.
5. Hermes may auto-create only bounded agent artifacts in `SYSTEM/AGENT PROPOSALS` or another explicitly generated path.
6. OpenViking is a rebuildable projection, never a second editable copy of a curated note.
7. Git records accepted changes and supports rollback. It does not grant edit authority and is not backup by itself.
8. Optional Telegram capture is acknowledged only after a local durable commit independent of Hermes, OpenViking, 9Router, and upstream models.
9. No 9Router combo or provider fallback may change embedding identity inside one index generation.
10. Notes forbidden from external processing stay out of 9Router and external embedding/VLM calls.
11. Missing sensitivity label fails closed to `local_only`; external classification cannot decide whether disclosure is allowed.
12. Copied content is untrusted data and cannot supply agent/tool instructions.

## Authority model

| Component | Owns | Must not own |
|---|---|---|
| Logical Obsidian vault | Canonical human-visible Markdown, Canvas, attachments, reviews | Agent job state or Telegram delivery queue |
| Obsidian clients | Human creation, editing, moves, approvals | Hidden agent state |
| Replication layer | File convergence between devices and VPS replica | Authorization, backup, or knowledge semantics |
| Deterministic workspace service | Proposals, expected hashes, approvals, atomic writes, job journal | Content judgment |
| Hermes | Intent routing, research, synthesis, tool orchestration | Unrestricted filesystem mutation or sole durable state |
| OpenViking | Later derived vault retrieval projection | Canonical curated notes; native memory/imported-resource state before separate policy |
| 9Router | Replaceable generation/VLM routing | Capture durability or substitutable embeddings |
| Telegram ingress | Optional raw delivery durability and idempotency | Knowledge interpretation |
| Git | Accepted-history audit and rollback | Sync authority, ownership detection, independent backup |

## Vault structure

Structure adapts Dusk's PARA and Zettelkasten ideas without its old plugin runtime:

```text
HUB/
    Home.md
    Agent Queue.md
INBOX/
    Unsorted/
    Pending Agent Review/
PARA/
    PROJECTS/
    AREAS/
    RESOURCES/
    ARCHIVES/
ZETA/
    FLEETING/
    LITERATURE/
    PERMANENT/
DAILY/
    DAILY/
    WEEKLY/
    MONTHLY/
SYSTEM/
    TEMPLATES/
    ATTACHMENTS/
    AGENT PROPOSALS/
    GUIDE/
```

Folders are choices, not capture requirements. `INBOX/Unsorted` is default destination. PARA answers “what action or responsibility does this support?” Zettelkasten answers “how mature is my understanding?” A note may stay unsorted indefinitely without breaking system.

Templates are optional prompts. Minimum useful review asks:

- What did I learn in my own words?
- Where did I see or use it?
- What will I do differently or test next?
- Which project, area, or prior note does it relate to?

Daily notes are optional. Weekly synthesis is required growth loop; monthly synthesis compresses weekly reviews. AI drafts questions and summaries, but user-owned wording is final understanding.

## Direct Obsidian workflow

1. User creates or edits any note normally.
2. Sync copies bytes to other devices and VPS working replica when available.
3. Git automation may checkpoint changed files, but ordinary notes trigger no agent work.
4. OpenViking projection may refresh asynchronously for paths permitted by policy.
5. Moving a note into `INBOX/Pending Agent Review` creates a Hermes proposal request.
6. Hermes reads exact source and allowed context, then writes a proposal artifact containing target path, expected SHA-256, proposed patch/content, rationale, sources, and validation result.
7. User approves, rejects, or edits proposal. Only deterministic workspace tool applies approved change.
8. Base-hash mismatch marks proposal stale. Nothing overwrites newer bytes.
9. Accepted mutation gets a narrow Git commit. Rejected proposal leaves source unchanged.

No watcher tries to infer human versus agent authorship. First manual edit does not need to “claim” a file because existing canonical notes are always human-owned.

Queue ledger permits one active proposal per path/hash/action. Approval applies content and approved destination move as one reviewed workflow, then source leaves pending queue. Rejection records rejected path/hash and does not retrigger until content changes or user explicitly retries. An unchanged rejected file may stay queued without looping.

## Deterministic mutation boundary

Hermes must not receive a generic unrestricted write tool. Workspace service enforces:

- realpath containment under vault root;
- explicit readable and writable path allowlists;
- rejection of `.git`, `.obsidian`, sync-conflict files, secrets, backup directories, and system state;
- byte-preserving or narrowly parsed edits rather than whole-file YAML reserialization;
- same-directory temporary write, flush, atomic replace, and parent-directory durability where supported;
- expected-base SHA-256 optimistic concurrency;
- per-path agent lease and stable-file check before apply;
- idempotency key per requested mutation;
- persisted proposal/apply journal;
- post-write validation before Git commit;
- post-write result hash and staged Git blob must equal approved bytes;
- explicit reviewed operations for moves, renames, merges, archive, and delete.

A small SQLite WAL journal is allowed for operational jobs, proposals, idempotency, and Telegram ingress. It is not a knowledge database and does not duplicate vault content as canonical truth. Git helper stages only intended paths, verifies staged blob identity, and commits approved bytes. If sync changes working tree after staging, commit remains exact and workflow enters reconciliation.

## Safe write policy

| Action | Default |
|---|---|
| Create proposal artifact | Automatic |
| Create disposable generated report under approved generated path | Automatic |
| Update existing canonical Markdown | Review and expected hash |
| Move, rename, merge, archive, delete | Always review; user/Obsidian preferred in first release |
| Edit `.canvas` | Review; creation postponed until explicit use case |
| Change `.obsidian`, Git, sync, or system files | Forbidden through Hermes |

Managed sections may be evaluated later, but marker-based auto-edit is not part of first release.

## Replication and Git

No paid Obsidian Sync subscription is assumed. Provider remains experimental until tested on actual Windows/Android/VPS clients.

Candidate set:

- Self-hosted LiveSync: strongest mobile-first candidate with CouchDB and newer headless CLI support, but must prove ARM64 resource use, bootstrap/recovery, conflict behavior, and coexistence rules.
- Remotely Save plus compatible remote storage/VPS client: broad storage choice and simpler server, but must prove headless VPS convergence, encryption interoperability, deletes/renames, and same-note conflict behavior.
- Syncthing: desktop/VPS replication is mature, but official Android app was discontinued in December 2024; only acceptable if user knowingly adopts and validates a maintained community Android client.
- Git transport: useful for controlled desktop-first/manual flows, but poor default mobile live sync. Keep audit and transport roles distinct.

Never run two live sync engines over same vault. Exclude `.git`, most `.obsidian` state, temp files, conflict copies, proposal journals, and system databases according to selected provider contract. Never auto-merge `.sync-conflict` files; surface them for review.

Git automation uses one active branch in live vault, dedicated Hermes identity, and narrow commits. No automated pull/rebase/reset/checkout in live replica. Encrypted off-host backup remains separate and requires restore drills.

## OpenViking projection

OpenViking enters after core vault workflow is stable. First role is derived vault projection only. Native agent memories/imported resources are separate non-rebuildable state and remain disabled until independent retention, deletion, backup, and authority policy exists. Projection uses explicit desired/observed manifest, not assumed arbitrary-directory watching.

Manifest records stable note ID where available, current vault path, content hash, sensitivity policy, OpenViking URI/task identity, source model contract, and last successful projection state. Reconciliation scan:

1. discovers permitted vault files;
2. excludes `.git`, `.obsidian`, conflict files, proposals, private/system paths, and unsupported binaries;
3. compares content/path to manifest;
4. schedules explicit add, move, remove, or rebuild operations using verified APIs;
5. records success only after OpenViking confirms it;
6. leaves vault untouched on projection failure.

Exact content-update semantics must be tested against pinned OpenViking version before implementation. Do not invent a mirror contract from `add_resource` or watcher behavior.

## Optional Telegram capture

Hermes gateway/session hooks occur inside agent lifecycle and do not prove durable-before-`Saved` receipt. Telegram therefore uses separate deterministic ingress if enabled:

1. Verify allowlisted sender/chat and derive stable key from bot identity plus `update_id`.
2. Commit raw update and initial outbox/job into SQLite WAL configured for full synchronous durability on same durable filesystem as WAL.
3. For text/link, send `Saved` only after commit. For media, send `Saved metadata; attachment pending`; send `Attachment saved` only after bytes and checksum persist.
4. Download attachments and invoke Hermes asynchronously; attachment expiration/retrieval failure stays visible.
5. Publish resulting proposal or note into vault through same mutation boundary.

If SQLite/disk fails, never say `Saved`. If Hermes, OpenViking, 9Router, upstream provider, sync, or Obsidian fails, raw capture remains queued.

## 9Router and model policy

Use current self-hosted 9Router for replaceable classification, summaries, research synthesis, and permitted VLM/OCR. Capture and vault edits do not depend on it. Record purpose, requested route, actual model when exposed, prompt/schema version, latency, and status without private bodies or credentials.

Provider fallback is allowed only where substitution is semantically tolerable. Missing label defaults to `local_only`; uncertain workplace content defaults to no external processing. Policy resolves locally before request. Full request/header/body logging must remain disabled or redacted and be verified at runtime.

Hermes treats note/article/AI text as inert source data. Drafting context separates trusted user intent from untrusted source delimiters and runs without shell, write, deployment, credential, or messaging tools. Research tool calls require explicit user intent and may not be initiated by instructions inside source material.

Embeddings require one immutable contract: provider, exact model, dimensions, normalization/preprocessing, chunker, metric, and index-generation ID. Compare:

- exact fail-closed 9Router route with no model substitution; and
- local pinned Ollama model, starting with `embeddinggemma` because bilingual English/Vietnamese fit matters.

Benchmark retrieval quality, ARM64 2-core throughput, memory, rebuild time, privacy, and outage behavior. Never use a 9Router combo for embeddings. Local VLM/reasoning inference is excluded unless benchmark later proves usable; it is not an emergency fallback.

## First production-worthy release

Included:

- plain Dusk-inspired vault structure and short guide;
- direct Obsidian capture with optional templates;
- one validated free replication method;
- Git checkpoints plus encrypted off-host backup and restore drill;
- weekly and monthly learning reviews;
- proposal-only Hermes workflow with deterministic apply boundary;
- path/sensitivity exclusions and visible failure queue;
- existing 9Router for permitted replaceable generation.

Excluded until evidence gate:

- OpenViking projection and vector retrieval;
- Telegram ingestion;
- Canvas generation;
- automatic moves, renames, merges, deletion, link repair, or bulk taxonomy;
- managed-section auto-edit;
- local VLM/reasoning fallback.

This is not a throwaway barebones phase. It establishes final authority, file format, sync, history, backup, review, privacy, and mutation contracts before adding derived services.

## Acceptance gates

- Ordinary Obsidian editing works with agents offline.
- Same-note concurrent-edit and offline-device tests lose no bytes and expose conflicts.
- Restore drill rebuilds vault and Git history from off-host backup.
- Queueing a note never changes source before approval.
- Approved proposal applies once; stale hash never overwrites current note.
- Rejected unchanged queue item does not loop; accepted workflow moves source out of pending queue.
- Hermes cannot write outside allowlist or into `.obsidian`/`.git`.
- Prompt-injection fixtures cannot invoke tools, disclose extra context, or alter mutation/data policy.
- 9Router outage leaves note creation, sync, review, and proposal queue intact.
- Weekly review produces one own-words insight and one changed action for three of four trial weeks.
- External-model policy blocks restricted test notes and logs no raw body.

## Retained, changed, rejected, postponed, and experimental

Retained: Obsidian-first library, Dusk-inspired optional structure, Git audit, Hermes orchestration, OpenViking as derived context, 9Router generation role, pinned embeddings, durable optional Telegram ingress.

Changed: default edit governance is proposal-only for existing notes; operational SQLite returns for jobs/ingress; sync choice is evidence-gated; OpenViking receives explicit reconciled projection; taxonomy is never required during capture.

Rejected: inferred manual ownership from filesystem events, OpenViking as Telegram durability boundary, OpenViking and Obsidian as symmetric stores, external classification of disclosure policy, Git as sole sync/backup, automatic conflict merging, unrestricted note writes, embedding combos, paid Obsidian Sync assumption.

Postponed: Canvas automation, bulk organization, managed-section auto-write, vector search, Telegram as main interface, local VLM fallback.

Experimental: LiveSync versus Remotely Save; exact 9Router embedding route versus local `embeddinggemma`; OpenViking update/reconcile behavior; privacy classification and retrieval-quality gates.
