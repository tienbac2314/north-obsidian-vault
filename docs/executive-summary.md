# Executive summary

Status: current product overview. Detailed authority lives in linked modular design and roadmap files.

This project designs a low-friction personal engineering workspace, not a note-collection machine. Obsidian is the canonical human library on Windows and Android. Capture stays loose: write anywhere, use `STAGING/Unsorted` when destination is unclear, and spend roughly two minutes recording raw material. Structure, own-words explanation, practice, and review happen later.

Release one is deliberately small in runtime scope but deeply specified:

- Fast Note Sync is the only whole-vault transport in a synthetic human-only pilot.
- Screenshots, images, video, audio, PDF, and other files remain ordinary vault attachments on both Windows and Android; FNS synchronizes their native links and bytes.
- FNS Cloud Preview automatic local deletion stays off. No Drive, S3, CDN, or other live attachment-offload plugin enters release one.
- Independent recovery must restore FNS state, vault content, attachments, and history/trash evidence. Sync history is convenient recovery, not backup.
- Hermes, 9Router generation, FNS APIs, headless clients, Git automation, and external vault writers stay outside the human-sync pilot.

FNS leads because integrated Obsidian setup, history, trash, full attachment handling, and mobile experience matter most to daily use. Its Passed Obsidian Review does not cover its server, deployment, API permissions, conflict behavior, or recovery. Physical Windows/Android conflict, rename, attachment, Android-background, server-restore, and seven-day observation gates decide promotion. FNS failure triggers a clean replacement evaluation, never a second transport or attachment authority on the same vault.

Hermes remains proposal-only through Release 3. Raw queued note or sidecar request for already-filed note records review intent after human sync, recovery, gateway stability, transport, and least-privilege gates pass. Authenticated receipt outside synchronized vault binds exact approved source before provider read. Hermes then creates separate deterministic proposal. Later Release 4A may add reviewed accepted filing and one weekly changed-note link digest through immutable authenticated approval and deterministic transactional executor. Daily full-vault scan and unattended mutation remain excluded.

Minimalization means fewer runtime components and fewer automatic powers. It does not mean deleting the design context needed to understand authority, failures, security, recovery, user behavior, and promotion order.

## Design map

- [System design](system-design.md) - complete product behavior, authority, release boundaries, and gates.
- [Recommended architecture](architecture/recommended-architecture.md) - components and their contracts.
- [Architecture options](architecture/options.md) - rejected and fallback choices.
- [Operational data and file contracts](architecture/data-model.md) - canonical bytes, links, recovery evidence, and later proposals.
- [Failure handling](architecture/failure-handling.md) - safe degradation and recovery order.
- [Security contract](architecture/security.md) - trust boundaries and acceptance tests.
- [Architecture diagrams](architecture/diagrams.md) - human pilot and later agent promotion.
- [Capture-to-growth behavior](behavior/capture-to-digest.md) - daily, weekly, and monthly workflow.
- [Hermes approved apply and link gardening](behavior/hermes-apply-and-link-gardening.md) - later exact filing, dependency updates, weekly recommendations, and rollback.
- [In-vault operating guide](../vault-template/SYSTEM/Guides/vault-operating-guide.md) - detailed human and agent instructions shipped with vault.
- [Interaction examples](behavior/interaction-examples.md) - concrete normal and failure scenarios.
- [Behavioral and architecture experiments](behavior/experiments.md) - evidence required for promotion.
- [First production-worthy release](roadmap/mvp.md) - executable release plan.
- [Evidence-gated roadmap](roadmap/phased-roadmap.md) - broader sequence without premature scope.

Evidence and decision history: [current sync and attachment reevaluation](research/2026-07-22-sync-and-extension-reevaluation.md), [decision log](decisions/decision-log.md), and [unresolved questions](decisions/unresolved-questions.md).
