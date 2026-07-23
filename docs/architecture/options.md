# Architecture options

Status: current architecture decision context under [system design](../system-design.md), aligned with [2026-07-22 reevaluation](../research/2026-07-22-sync-and-extension-reevaluation.md).

## Criteria

- Seamless, UI-rich Obsidian use on Windows and Android.
- Local writing works during network, sync, VPS, gateway, or model outage.
- One whole-vault synchronization authority.
- Conflicts, deletes, and recovery remain visible and testable.
- Attachments are understandable on Android.
- Later Hermes access cannot inherit broad authority silently.
- 2-core/12-GB ARM64 Oracle VPS remains operable.
- Free/self-hosted preference without treating price as security proof.

## Human workspace options

### A. Local Obsidian only

Lowest operational and trust burden. Valid fallback when sync experiments fail. Does not meet desired Windows/Android convergence but proves canonical Markdown remains useful without stack.

### B. FNS human pilot

Guided setup, WebSocket updates, history, trash, attachments, and Web UI provide best desired daily experience. Selected for synthetic human pilot. Server readability, open conflict/permission/external-file reports, and independent-recovery requirements prevent immediate personal or agent promotion.

### C. Syncthing core plus Syncthing Manager

Plain-file portability, enrolled-device transport, visible conflict copies, versioning controls, and rich local Obsidian status UI. Strongest currently available path to ordinary VPS filesystem and later Hermes. Lower-ranked daily UX because Android background service and device-local Manager setup add complexity; semantic note conflicts remain manual.

### D. Self-hosted LiveSync

Deep operational history, E2EE, Obsidian-native history/conflict support, and official CLI make it strongest mature long-term candidate. Current encrypted CLI push issue `#1036` blocks researched bidirectional Hermes path. Reconsider after released fix and Oracle ARM64 validation.

### E. Stacked sync transports

Rejected. FNS plus Syncthing, LiveSync, Google Drive whole-vault sync, or another engine can race on rename/delete/conflict and erase causal evidence. A fallback replaces failed transport after full snapshot and shutdown.

## Sync comparison

| Option | Human UX | Plain filesystem | Main risk | Current position |
|---|---|---|---|---|
| FNS | Best integrated target experience | Requires unpromoted API/headless bridge | Server trust, conflicts, permissions, external writers | Preferred isolated human pilot |
| LiveSync | Rich and mature | Official CLI, encrypted push currently broken | Complexity and CLI issue `#1036` | Reconsider after fix |
| Syncthing + Manager | Good status/control UI | Native folder on every peer | Android service and manual whole-file conflicts | Replacement fallback |
| Google Drive Sync | Whole-vault plugin | Cloud folder semantics | Competing writer and stale release | Rejected |
| Git transport | Strong history | Native files | Poor live mobile UX and merge burden | Not sync transport |

Obsidian Health and Review are triage signals, not one security ranking. Passed FNS plugin review does not scan server. LiveSync Risks does not prove malware. Syncthing core has no Obsidian scorecard; Manager score covers UI plugin, not core correctness.

## Attachment options

| Option | Strength | Limitation | Decision |
|---|---|---|---|
| FNS vault attachments | Same capture path, native links/embeds, mobile rendering, offline bytes | Uses device/server storage; large-file and recovery behavior unproven | Selected release-one authority |
| FNS Cloud Preview | Remote media preview under same product | Server dependency; restore gaps; optional local deletion | Auto-delete off; consider later only |
| Drive Attachments | Private direct upload, dedupe, durable Drive IDs, Windows sidebar | Desktop-only; Android capture bypasses it and splits authority | Rejected for seamless pilot |
| Loft | Google Drive image paste on desktop/mobile; Passed review | Images only; anyone-with-link access; tokens in vault data | Rejected for private arbitrary files |
| MinIO or legacy S3 uploaders | Mobile manifests and paste/drop support for several file types | Public object access, stale maintenance, incomplete formats or recovery | Rejected for release one |
| Bunny Publisher | Current Passed mobile plugin and remote media publishing | Command-driven CDN publishing, not symmetric private capture | Rejected for capture; later publishing only |
| Attachment Imagebed Manager | Arbitrary types and mobile manual conversion | Automatic scan is desktop-only; public S3 URL and second authority | Rejected for seamless capture |
| Drive Embedder | Easy public embed | Makes files public | Rejected for private notes |
| External Attachments | Renders absolute external paths | No upload or portable Android path | Rejected |
| Google Drive whole-vault sync | One cloud backend | Competes with FNS and warns about outside edits | Rejected |

## Agent access options after human pilot

### FNS MCP or REST

Potentially seamless, but current permission and cross-vault reports require direct least-privilege tests. Human pilot does not authorize it.

### Third-party FNS headless client

Could materialize VPS files, but lies outside Obsidian Passed review and must prove external-writer survival, conflict safety, and recovery. Not current.

### Replace FNS with Syncthing

Provides plain VPS files and reuses filesystem-first Hermes design. Costs daily UX and requires full transport migration gate. Preferred fallback when early Hermes filesystem access becomes primary.

### LiveSync CLI

Best mature encrypted future path after `#1036` is fixed and tested. No private patch for first release.

### Desktop Local REST API

Depends on desktop Obsidian staying open and exposes another local interface. Rejected for server-scheduled first design.

## Proposal interfaces later

| Option | Strength | Weakness | Decision |
|---|---|---|---|
| Separate Obsidian proposal note | Visible on desktop/mobile; plain Markdown; no custom plugin | User resolves manually | Chosen later boundary |
| Automatic existing-note patch | Less manual copy | Stale overwrite and sync race | Reject unattended patch; later exact reviewed apply plan only |
| Telegram approval | Fast remote chat | Makes optional channel critical | Postponed |
| Custom Obsidian plugin | Tailored UI | New desktop/mobile lifecycle | Rejected until repeated need |

## Decision

Pilot FNS alone for live Markdown and attachment synchronization with synthetic human data. Keep every attachment inside vault, Cloud Preview automatic local deletion off, and independent recovery outside FNS. Delay Hermes access. Replace FNS only after failed gate or explicit priority change. Keep LiveSync as mature promotion candidate, not scorecard casualty.
