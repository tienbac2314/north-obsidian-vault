# Hermes approved apply and link gardening

Status: current later-release behavior under [system design](../system-design.md) and DEC-031. Nothing here authorizes current runtime access.

## Purpose

Two needs share one review surface:

1. User accepts Hermes proposal and wants final note filed with approved related-note updates.
2. User files or edits note manually but misses useful links to existing knowledge.

Hermes may recommend both. It may apply only exact human-approved plan after separate promotion. It never receives open-ended authority to organize vault or rewrite related notes.

## Activation order

Capability remains disabled until:

- human FNS pilot and independent recovery pass;
- proposal-only Hermes pilot passes;
- proposal-assisted learning proves useful;
- agent transport supports least-privilege reads, authenticated approval outside synchronized Markdown, compare-and-swap or a proven exclusive maintenance window, bounded writes, and rollback evidence;
- user approves exact scan allowlist and denied paths;
- deterministic non-model executor passes synthetic filing, path-escape, stale-target, concurrent-edit, interruption, rollback, prompt-injection, and recovery tests;
- result and recovery-receipt retention is approved.

Proposal-only Release 3 does not mutate existing notes. Approved apply and link gardening begin only in Release 4A.

## Accepted proposal apply

Hermes proposal may include:

```markdown
## Proposed filing

Destination: ZETA/Permanent/Connection Pool Saturation.md

## Proposed dependent updates

- PARA/Projects/API Rewrite.md
  - Add [[Connection Pool Saturation]] under `## Related knowledge`
- ZETA/Permanent/Backpressure.md
  - Add reciprocal link under `## Connections`

## Human review

Decision: pending
Feedback:
```

User changes decision:

- `accept`: record intent to apply exact unchanged displayed plan;
- `revise`: authorize one replacement proposal using feedback and no other write;
- `reject`: authorize no write.

Changing destination, target list, target hash, or patch text is a revision request, never an accepted override. Hermes must create replacement proposal with new exact plan and hashes.

User moves reviewed proposal to `STAGING/Reviewed`. Movement authorizes read of reviewed file, not mutation. Hermes calculates exact reviewed-file SHA-256, shows destination, target count, and hash through authenticated interactive channel, then requests one-time confirmation. User confirmation creates local approval receipt outside synchronized vault. Receipt binds reviewed path and SHA-256, plan hash, workflow version, authenticated session, and expiry. It contains no note body. `Decision: accept` without matching unexpired receipt grants no write.

Unused confirmation expires after 15 minutes. Used hash-only approval receipt and transaction journal remain 90 days for replay and audit defense. Preimage bundle remains at least 30 days and until one verified independent recovery copy includes post-transaction state, whichever is later. Failed, rolled-back, or unknown transaction retains journal and preimages until human recovery is verified.

On `accept`, Hermes:

1. verifies authenticated approval receipt against unchanged reviewed bytes and immutable displayed plan;
2. hands plan to deterministic executor; model receives no shell or generic file-write authority;
3. canonicalizes every path, resolves existing parents, and rejects whole transaction when any path fails containment;
4. fresh-reads source, proposed destination, and every listed dependent note;
5. preflights whole transaction against proposal-time hashes and destination-nonexistence sentinel;
6. creates privacy-equivalent preimage recovery bundle outside synchronized vault;
7. obtains proven compare-and-swap protection or exclusive maintenance window with FNS and other clients quiescent;
8. compares exact bytes again immediately before each atomic replace or collision-safe create;
9. creates clean final note and applies only displayed dependency patches as one logical transaction, journaling exact preimage and executor-written postimage hash after each write;
10. rolls back already-written file only when current bytes still equal executor postimage; concurrent mismatch preserves all versions, marks unknown state, and requires human recovery;
11. writes separate collision-safe sanitized result receipt keyed by immutable approval identity;
12. never modifies reviewed authorization bytes, discovers extra targets, or deletes source automatically.

If rollback fails or current bytes differ from journaled executor postimage, executor stops all later items and all retries without overwriting current file. User preserves every version and restores through approved recovery path before re-enabling apply. Retry uses original approval identity and transaction journal: committed result returns prior receipt, rolled-back result may retry only after current bytes equal original preconditions, and unknown state requires human recovery. Digest recommendation is one transaction; unrelated approved recommendations may continue only after failed item rolled back completely and failure was not containment or executor-integrity breach.

Path contract uses vault-relative forward-slash paths only. Reject absolute, UNC, device, drive-qualified, empty-segment, `.`, `..`, backslash, colon, control-character, trailing-dot/space, Windows reserved-name, symlink, junction, and reparse-point paths. Normalize Unicode to NFC for identity, reject two vault paths equal after invariant case-fold plus NFC, resolve existing parents, and require resolved target remain inside exact allowlisted root. New destination requires existing contained parent. No note text may supply path.

Apply plan may propose exact prose patch, but first promotion limits old-note changes to additive links inside approved sections. Arbitrary prose rewrite needs exact diff preview and separate later decision.

## Weekly link gardening

Hermes runs one weekly changed-note scan plus manual on-demand scan. Daily promotion requires measured backlog or missed-link evidence and new decision. Daily full-vault scan is rejected.

Scan rules:

- scan only explicitly allowed PARA and Zettelkasten roots;
- select notes changed since last successful scan;
- use filename, aliases, existing links, tags, and plain-text search before any derived retrieval;
- read changed note plus narrow candidate notes returned by those searches;
- exclude attachments, archive, SYSTEM, STAGING workflow history, denied private roots, and unlisted folders;
- create no proposal when no useful recommendation exists.

Default hard limits per weekly or manual run:

- at most 20 changed notes and 5 candidate notes per changed note;
- enumerate at most 2,000 allowlisted paths by filename only;
- inspect content of at most 100 distinct Markdown files and 1 MiB locally, counting every body read for aliases, links, tags, or text search;
- send at most 250 KiB of selected note text to provider;
- skip any single note over 64 KiB rather than silently truncate it;
- at most 10 model requests, 20 recommendations, and 15 minutes wall time;
- one digest only, with overflow count and reason but no private filenames in operational logs.

Process changed notes by oldest unprocessed checkpoint then canonical path. Rank candidates by exact filename, alias, existing link, tag, then plain text; break ties by canonical path. No hidden index bypasses read budget. Approved existing local index may return paths only; reading candidate body still counts. Checkpoint advances only for notes fully processed under current workflow version. Overflow and skipped notes remain eligible next run. Repeated overflow requires scope reduction or new explicit budget decision; it never silently raises limits.

One run creates at most one digest:

```text
STAGING/Agent Proposals/YYYY-MM-DD Link Review <run-id>.md
```

`run-id` is first 12 hexadecimal characters of SHA-256 over scan kind (`weekly` or `manual`), prior checkpoint generation, sorted canonical changed-note path/hash set, and workflow version. Digest uses create-only semantics. Existing matching identity means duplicate run stops without overwrite; identity collision with different input is visible failure. Checkpoint advances only after digest create succeeds, matching existing result is verified, or completed zero-recommendation result is journaled.

Each recommendation contains changed note, suggested related note, reason, exact proposed patch, proposal-time target hashes, and:

```markdown
Decision: pending
Feedback:
```

User changes each item to `apply`, `revise`, or `ignore`, then moves digest to `STAGING/Reviewed`. As with accepted proposal, synchronized Markdown records intent only. Authenticated one-time confirmation binds exact reviewed digest hash and selected item plan hashes before executor receives write authority.

- `apply`: exact unchanged displayed patch only, after authenticated confirmation and transaction checks;
- `revise`: new recommendation only;
- `ignore`: no write.

One stale or failed recommendation stops that recommendation. Unrelated approved items continue only after complete rollback and no containment or executor-integrity failure. Separate result receipt names skipped item and reason without modifying reviewed digest or exposing private note content in operational logs.

## Incremental checkpoint

Reliable changed-note selection needs small rebuildable manifest stored outside vault, repository, FNS, and backup authority. It contains only:

- vault-relative allowlisted path;
- content hash;
- last successful scan time;
- workflow version;
- generation derived from canonical checkpoint bytes.

Manifest is operational cache, not knowledge, authorization, or proof of backup. Loss causes no note mutation. Next scan requires explicit safe rebaseline rather than guessing from filesystem time. No workflow SQLite, watcher, or derived content index is required.

Checkpoint `generation` is SHA-256 over canonical bytes composed of workflow version, last-successful-scan UTC, then canonical path plus content hash entries sorted by path; generation field itself is excluded. Path contract rejects control characters, so serialization is unambiguous. Stored generation must equal recomputed value before scan.

## Human-visible retention

`STAGING/Reviewed` is working history, not permanent inbox. During monthly review, human may move completed proposal, digest, and separate result together to `PARA/Archive/Agent Reviews/YYYY/`, or delete them after useful content has been filed and independent recovery is current. No agent archives or deletes these files automatically. Sidecar request may be deleted by human after final result; raw queued source follows normal filing decision.

## Privacy and prompt-injection boundary

Scheduled read access is broader than explicit queued-note review and needs separate approval. Note content remains untrusted data. It cannot:

- widen scan roots;
- select extra tools, providers, credentials, or targets;
- authorize apply;
- change schedule or retention;
- override human review block.

Provider receives only approved changed note and narrow candidate context required for recommendation. Full-vault prompt construction is prohibited.

## Rollback

Disable link-gardening schedule and revoke its write capability independently of proposal-only Hermes. Preserve reviewed plans and recovery evidence. Restore touched files through proven recovery path when exact patch reversal is unsafe. Human Obsidian, FNS, and manual filing remain usable.
