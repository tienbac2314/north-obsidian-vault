# Unresolved questions

Status: current design gates.

## Sync validation

- Does current FNS remain reliable under this Android device's background and battery restrictions, reboot, and delayed reconnect?
- Do offline same-note edits, case-only rename, bulk attachment-folder moves, deletes, server restarts, and upgrades preserve recoverable bytes?
- Can current FNS server restore its complete database into an empty environment, and which independent recovery copy protects against server or database loss?
- Does a vault-restricted token remain inside its vault under direct tests, and do externally created files survive background synchronization?
- Which `.obsidian` configuration can safely sync across Windows and Android after content-only behavior passes?
- Does FNS Cloud Preview preserve expected Windows and Android rendering while local deletion remains off?
- Do platform-native Windows and Android capture actions produce same vault-local file, link/embed, privacy, rename/move/delete, duplicate, and recovery outcomes?
- Do large video, audio, PDF, and arbitrary binary attachments converge through FNS within acceptable time and storage limits without retry loops or missing embeds?
- Which independent recovery destination, encryption boundary, cadence, and retention policy restore vault attachments without relying on live FNS state?
- If FNS fails, does Syncthing core plus Syncthing Manager pass background, conflict, versioning, and restore tests strongly enough to replace it?
- Has Self-hosted LiveSync encrypted CLI issue `#1036` been fixed upstream and verified on Oracle ARM64 strongly enough to become the mature sync and headless-access alternative?

## Hermes review contract

- Which transport can enforce proposal-only and Release 4A read/write scopes on Oracle ARM64 without exposing broader FNS authority?
- Which authenticated Windows/Android interaction creates one-time request/apply receipt without trusting synchronized Markdown or reusing FNS credential?
- Can chosen transport provide real compare-and-swap, or must approved apply use exclusive maintenance window with FNS and every other client quiescent?
- Which deterministic executor implementation enforces canonical path rules, transaction journal, atomic replace, rollback, and replay-safe result identity?
- Where do hash-only receipts/journals and private preimages live, and how are 15-minute, 90-day, 30-day-plus-backup, and failure-hold retention rules verified?
- Which exact PARA/ZETA roots enter weekly changed-note allowlist, and which personal or employer-derived roots remain denied?
- Which standard link sections are safe for first additive patch promotion without harming human prose?
- Which recovery mechanism proves exact restoration for multi-note approved apply?
- How does operator safely rebaseline lost path/hash checkpoint without sending whole vault to provider?

## Deployment and privacy

- Does selected sync/headless client work on Oracle ARM64 and survive restart?
- What caused the observed Hermes gateway restart pattern, and what bounded health check proves it is stable?
- Are 9Router request bodies, headers, and provider responses retained anywhere?
- Which personal or employer-derived notes may reach external providers?
- What visible failure signal shows that pending work waited because Hermes, 9Router, sync, or provider was unavailable?

## Later promotion, not first design

- Does OpenViking improve bilingual retrieval enough to justify another authority/index lifecycle?
- Does a fixed embedding contract outperform plain filename, link, and text search?
- Is any Telegram-to-Obsidian capture path still useful after direct Obsidian habit is established?

## Evidence limits

- FNS is selected only for an isolated human-sync pilot; no sync option has passed actual Windows/Android recovery tests or personal-data promotion.
- LiveSync issue `#1036` and Fast Note Sync security/permission reports may change; refresh them only when deciding or implementing sync.
- No runtime service was changed during simplification research.
- 9Router fallback, logging, backup, and restore remain observations rather than controlled tests.
