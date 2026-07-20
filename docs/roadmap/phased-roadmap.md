# Evidence-gated roadmap

Phases describe promotion order, not disposable implementations. First release establishes final authority and storage boundaries.

## Release 1: Obsidian workspace

- Vault structure, guide, optional templates, weekly/monthly review.
- Validated free sync, Git audit, encrypted backup/restore.
- Proposal-only Hermes, deterministic mutation service, 9Router data policy.
- Gate: [first-release acceptance](mvp.md).

## Release 2: Derived agent context

- Pin OpenViking version and test resource lifecycle.
- Add projection manifest and reconciler for allowed vault paths.
- Compare filename/link/text search with OpenViking on prewritten bilingual queries.
- Compare exact 9Router embedding route with local `embeddinggemma`.
- Gate: better retrieval with provenance, rebuild proof, stable embedding contract, acceptable ARM64 cost, no restricted-data leak.

## Release 3: Optional quick capture

- Add allowlisted Telegram ingress with full-synchronous SQLite WAL, durable-before-`Saved` text/link contract, and separate media metadata/attachment acknowledgments.
- Drain into Hermes and vault proposal workflow.
- Test duplicate updates, attachment retry, disk failure, 9Router/Hermes/OpenViking outage, and recovery.
- Gate: no lost or duplicate captures and no false acknowledgment.

## Release 4: Broader workflows

- Consider Canvas creation, managed sections, automatic generated reports, and richer project research chains only from repeated concrete demand.
- Moves, renames, merge, archive, delete, and bulk taxonomy remain reviewed.

## Deliberately absent

Paid Obsidian Sync assumption, Git branch switching in live vault, two simultaneous sync engines, automatic conflict merge, unrestricted agent shell, symmetric OpenViking/Obsidian editing, fallback embeddings, and local CPU VLM emergency path.
