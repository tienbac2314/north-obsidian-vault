# Sync, history, and attachment reevaluation

Date: 2026-07-22. Status: current evidence record. Scope: Obsidian on Windows and Android, an ARM64 Oracle VPS, and later Hermes access. This consolidates the focused 2026-07-22 refresh while preserving the earlier [sync and agent extension evaluation](../archive/research/sync-and-agent-extensions.md) as archived background.

## Questions

1. Do current Obsidian scorecards overturn older sync research?
2. Which of Fast Note Sync, Self-hosted LiveSync, or Syncthing with Syncthing Manager best fits a seamless, UI-rich Obsidian experience?
3. Can attachments live in Google Drive while remaining useful on Windows and Android?
4. How should human sync choice interact with later Hermes access?

## Evidence method

Evidence was gathered in this order:

1. Current Obsidian Community plugin pages and Obsidian's explanation of automated review.
2. Official repositories, releases, documentation, source code, roadmaps, and open issues.
3. Reddit reports as anecdotal failure discovery, not proof or comparative benchmarks.
4. The lean NotebookLM notebook for adversarial synthesis and the broader older notebook for source discovery. Material claims were retained only when independently supported.
5. Sanitized, read-only Oracle VPS inspection for current Hermes and 9Router context.

The supplied `C:\Users\bacnt\opencode-dotfiles\docs\history` reference path was unavailable on this workstation. This repository already has an archived [repository history](../archive/snapshots/repository-history.md), an earlier sync record, a dated reevaluation, and an append-only decision log. Findings therefore stay in those existing records instead of creating overlapping `docs/history` files.

## How to read Obsidian scorecards

Obsidian introduced automated review for every plugin release in May 2026. The official launch post lists developer-policy checks, known-vulnerability scanning, malware and suspicious-pattern detection, disclosure checks, build attestation, and code-quality analysis. It also warns that automated scorecards can contain false positives and false negatives: [The future of Obsidian plugins](https://obsidian.md/blog/future-of-plugins/).

Health and Review are separate signals, not one four-step security ranking:

- **Health** summarizes project maintenance, adoption, responsiveness, and repository hygiene.
- **Review** summarizes automated findings for one published Obsidian plugin artifact.
- A lower Review label does not by itself prove malware, an exploitable vulnerability, or data-loss behavior.
- A Passed Review does not cover a separate server, third-party headless client, deployment configuration, recovery procedure, or runtime correctness.

Snapshot captured 2026-07-22:

| Plugin | Health | Review | Supported conclusion | Unsupported conclusion |
|---|---|---|---|---|
| [Fast Note Sync](https://community.obsidian.md/plugins/fast-note-sync#scorecard) | Excellent | Passed | Plugin `2.4.0` is active, reproducible byte-for-byte, attested, unobfuscated, and has no detected vulnerable dependencies. | FNS server, API authorization, MCP, deployment, conflict handling, and recovery are therefore safe. |
| [Self-hosted LiveSync](https://community.obsidian.md/plugins/obsidian-livesync#scorecard) | Excellent | Risks | Plugin `0.25.83` is highly active and adopted; build, attestation, and vulnerable-dependency checks pass. | Every static-analysis item is an exploitable security defect. Many findings are lint, generated declarations, or deprecations. |
| [Syncthing Manager](https://community.obsidian.md/plugins/syncthing-manager#scorecard) | Excellent | Satisfactory | Plugin `1.4.5` has a clean current artifact and provides a maintained Obsidian UI over local Syncthing. | Its short history and small field population establish long-term reliability. |

The earlier record assessed **Syncthing Integration**, a different plugin with Good Health and Caution Review. It does not describe current Syncthing Manager. Core Syncthing has no Obsidian plugin scorecard.

## Fast Note Sync

### Why it now ranks first for human experience

- The official [Obsidian plugin](https://github.com/haierkeys/obsidian-fast-note-sync) offers guided device setup, real-time WebSocket updates, note history, trash, attachments, and a Web UI through the companion [server](https://github.com/haierkeys/fast-note-sync-service).
- Current plugin `2.4.0` and server `3.6.0` were released on 2026-07-20.
- Obsidian Health is Excellent and Review is Passed.
- The same product owns sync, history, trash, and cloud preview, so the user does not need to reason about a background folder service plus a separate Obsidian control plugin.
- Its normal Markdown links and cross-platform Obsidian plugin fit the desired Windows and Android experience better than a desktop-only Google Drive attachment plugin.

### Creator claims and community counterevidence

In the supplied [Reddit discussion](https://www.reddit.com/r/ObsidianMD/comments/1pn3dsg/recommend_a_nearperfect_realtime_note/), the creator describes a personal workflow without simultaneous edits and sub-second WebSocket propagation. The creator argues this makes conflicts rare, setup easier, large-file behavior better, and synchronization faster than LiveSync. Positive replies support easy setup and low perceived latency.

Those reports support an FNS pilot, not a general conflict guarantee:

- Low online latency does not eliminate offline Android edits, suspended background work, delayed server reconnects, or later Hermes writes.
- One user reports partial synchronization and duplicate notes after a case-only rename, then returned to LiveSync.
- Another participant notes that an entire note is transferred on each change. No independent current benchmark was found comparing FNS, LiveSync, and Syncthing under the same vault and network.
- Current plugin documentation advertises offline auto-merge, while server roadmap items still call for better offline merging and conflict mechanisms. This makes destructive and concurrent cases promotion tests, not assumed behavior.

### Current trust and correctness limits

- End-to-end encryption remains unchecked on the plugin roadmap. The FNS server can read synchronized content.
- Server issue [#339](https://github.com/haierkeys/fast-note-sync-service/issues/339) requests folder-level token permissions because current access is too broad for least-privilege agent use.
- Server issue [#346](https://github.com/haierkeys/fast-note-sync-service/issues/346) reports a vault-restricted token accessing other vaults. It remains open without independent regression proof.
- Security report [#342](https://github.com/haierkeys/fast-note-sync-service/issues/342) is an acknowledged allegation, not a confirmed CVE set or proof that current release is compromised.
- Issue [#391](https://github.com/haierkeys/fast-note-sync-service/issues/391) reports external bot-created files being deleted during background synchronization.
- Issue [#425](https://github.com/haierkeys/fast-note-sync-service/issues/425) reports Git remote changes not returning to clients.
- Issue [#395](https://github.com/haierkeys/fast-note-sync-service/issues/395) reports an upload and rename race. A maintainer commit intends to fix it and current release is newer, but the issue remains open without reporter confirmation.
- Issue [#312](https://github.com/haierkeys/fast-note-sync-service/issues/312) reports incomplete multi-attachment folder moves across macOS and Android, with possible deletion. It targets older releases but remains open.
- Issue [#356](https://github.com/haierkeys/fast-note-sync-service/issues/356) reports attachment-deletion failure with another Obsidian plugin.
- FNS server database is synchronization authority. Its documented local-filesystem mirror is one-way. Official documentation links third-party headless WebSocket clients for a bidirectional Linux filesystem replica; those clients are outside Obsidian's Passed review.

### Bounded pilot decision

FNS is preferred for the first **human-only sync pilot**, because seamless Obsidian history, trash, attachments, and low-friction setup are primary user requirements. Pilot uses an isolated vault and private service exposure. FNS MCP, REST, Git automation, filesystem mirror, third-party headless clients, and Hermes writes remain disabled.

Promotion requires synthetic tests for:

1. case-only rename;
2. offline same-note edits and conflict preservation;
3. small and large attachment upload, rename, delete, and restore;
4. bulk folder move containing several attachments;
5. trash and note-history recovery;
6. Android background, battery restriction, reboot, and delayed reconnect;
7. server restart, upgrade, database backup, and full restore;
8. survival of a file created outside FNS;
9. vault-token isolation and any claimed folder restriction;
10. behavior when two writers act close together.

Failure that risks silent loss, cross-vault access, or deletion of external files stops promotion. Do not solve a failed FNS pilot by running Syncthing against the same live vault.

## Self-hosted LiveSync

### Strengths

- Current plugin `0.25.83` was released on 2026-07-16.
- Health is Excellent, adoption and operational history are much deeper than FNS or Syncthing Manager, and it provides Obsidian-native history, conflicts, and E2EE.
- Official CLI can materialize a real filesystem vault and exposes revision and conflict operations, giving it the strongest long-term path to encrypted human sync plus headless Hermes access.

### Limits

- Open issue [#1036](https://github.com/vrtmrz/obsidian-livesync/issues/1036) reports that E2EE CLI pulls work but pushes crash under Node because the encryption path uses browser-only `FileReader`. This blocks the researched encrypted bidirectional agent path.
- Community reports include successful long-running encrypted VPS use and upgrade or repair loops. These are anecdotal and argue for coordinated upgrades, tested restores, and backups rather than rejection.
- Review Risks reflects a large complex plugin and many automated findings. It is a maintenance and review signal, not proof that LiveSync is less secure than a Passed plugin whose separate server was not scanned.

### Position

LiveSync ranks second for human experience and remains the best promotion candidate for a mature Obsidian-native system. Reconsider after `#1036` is fixed in a release and encrypted bidirectional CLI behavior passes Oracle ARM64 tests. Do not maintain a private patch solely to force first release.

## Syncthing core with Syncthing Manager

### What Manager changes

[Syncthing Manager](https://github.com/gustjose/obsidian-syncthing-manager) is a newer optional Obsidian interface over a local Syncthing REST API. It provides status and progress, devices, pause and resume, conflict diff views, `.stignore` editing, versioning and restore controls, and force-sync actions. API keys use Obsidian's native Keychain.

This directly answers the earlier objection that Syncthing has no rich Obsidian UI. It does not turn Syncthing into semantic note sync:

- Conflict resolver compares whole conflict files and lets the user retain one side; it is not a three-way Markdown merge.
- Android setup with Syncthing-Fork requires access to its loopback GUI on port `8384`. Current instructions disable HTTPS and GUI authentication because Obsidian mobile cannot use the fork's self-signed localhost HTTPS endpoint. Loopback limits network reach, but this remains a device-local trust tradeoff.
- Issue [#16](https://github.com/gustjose/obsidian-syncthing-manager/issues/16) reports an eternal-sync display on a large vault. The maintainer says `1.4.5` adds a layout-ready guard, but the issue remains open awaiting confirmation.
- Current field history is shallow: roughly one thousand installations, about four thousand downloads, thirty GitHub stars, and one primary contributor at capture time.

### Core behavior and backup boundary

[Syncthing core](https://github.com/syncthing/syncthing) replicates ordinary files between enrolled devices. Official [conflict documentation](https://docs.syncthing.net/users/syncing.html#conflicting-changes) says divergent edits create propagated `.sync-conflict-*` files; Syncthing does not semantically merge Markdown.

The supplied community warning correctly separates sync from backup. A delete or bad saved edit can propagate quickly. [Staggered file versioning](https://docs.syncthing.net/users/versioning.html) adds useful recovery depth, but archives only changes received from another device. It does not preserve same-device local edits and does not replace an independent backup. Enable versioning on Windows and VPS if this option is selected, then test restore.

Syncthing's [security model](https://docs.syncthing.net/users/security.html) keeps transfer between authenticated devices. The privacy claim that notes never reach someone else's machine is only true when every enrolled host is physically controlled. An Oracle VPS still holds readable plaintext because Hermes needs ordinary files there. Transport encryption does not make that host unable to read them.

Its strongest advantage remains portability: the authority is a folder of Markdown and attachments, independent of Obsidian. Switching note applications does not require replacing the transport.

### Position

Syncthing core with Syncthing Manager ranks third for desired human experience but first for a plain-file Windows, Android, VPS, and Hermes topology available now. It is the fallback if FNS cannot pass safety gates or if early Hermes filesystem access becomes more important than integrated FNS UX. Selecting it replaces FNS for the whole vault; both never run together.

## Attachment options

### FNS attachment baseline

FNS already includes [Cloud Preview](https://github.com/haierkeys/obsidian-fast-note-sync/blob/master/src/lib/storage/file_cloud_preview.ts). When a normal `![[attachment]]` target is absent locally, the plugin can resolve images, video, audio, and PDF through FNS. The implementation includes mobile PDF handling and an optional `cloudPreviewAutoDeleteLocal` setting.

This remains the portable baseline because Windows and Android keep normal wikilinks under one authority. Costs remain significant: remote preview needs FNS availability, server can read content, attachment restoration is still roadmap work, and open attachment issues exist.

Release rule:

- Keep local attachment fixtures in the pilot so FNS attachment behavior remains tested.
- Keep `cloudPreviewAutoDeleteLocal` off.
- Consider Cloud Preview only for large or cold media after attachment and restore gates pass.
- Never treat remote preview as backup or guaranteed offline access.

### Google Drive plugins evaluated

**Historical checkpoint:** recommendations in this subsection record the first focused comparison. The mobile attachment follow-up below supersedes its Windows-only pilot recommendation.

| Option | Current evidence | Decision |
|---|---|---|
| [Drive Attachments](https://community.obsidian.md/plugins/drive-attachments#scorecard) | Release [`0.74.0`](https://github.com/kim-dongryeong/obsidian-drive-attachments/releases/tag/0.74.0) is desktop-only. Its official README and source confirm private direct-to-Drive upload, durable Drive IDs, content-hash deduplication, a Drive sidebar, direct upload for pasted images, and upload-or-local choice for arbitrary dropped files. `Ctrl+V` interception currently accepts image clipboard files only. Insert formats are plugin-specific private preview, ordinary Markdown link, or a Drive-link note. Health is Excellent; Review is Caution, with passing reproducible-build, attestation, suspicious-pattern, and vulnerable-dependency checks. | Pilot as the Windows attachment-ingress layer. Set **Pasted images** to **Upload to Drive** and **Inserted format** to **Inline Markdown link** so FNS synchronizes portable link text and Android can open Drive. Dragged video, PDF, audio, and other files still require choosing **Upload to Drive**. Do not claim automatic arbitrary-file paste or Android inline preview. |
| [Drive Embedder](https://community.obsidian.md/plugins/drive-embedder#scorecard) | Desktop-only, older, and more adopted. It uploads and embeds media through public links or iframes. | Reject for private notes because embedding intentionally makes uploaded files public. |
| [External Attachments](https://community.obsidian.md/plugins/external-attachments) | New desktop-only renderer for absolute paths outside the vault. It does not provide upload or mobile synchronization. | Reject for cross-device canonical use. Mounted-drive paths are device-specific and Android cannot rely on them. |
| [Google Drive Sync](https://community.obsidian.md/plugins/google-drive-sync) | Whole-vault synchronization plugin, not an attachment layer. Documentation warns against simultaneous outside edits and other sync engines. Health is Good; Review is Caution; latest release is old. | Reject. Never stack it with FNS, LiveSync, or Syncthing. |

Drive Attachments and FNS do not write the same bytes when upload succeeds: Google Drive owns the offloaded file, while FNS synchronizes the Markdown link. Failed-upload behavior is not independently proven. Pilot must verify visible failure and retained source; explicit user local save is required recovery when no automatic fallback appears, and that local attachment then belongs to FNS. This is split content authority, not a second whole-vault sync engine.

The compromise is explicit. Desktop gets private upload and management UI. Android gets a portable link that opens the authenticated Drive app or browser, not the plugin's private inline preview. Google Drive holds readable attachment bytes. FNS still needs local attachment tests and an independent recovery copy; neither Drive links nor FNS history constitute complete backup. Automatic local fallback after failed upload remains an open test, not a documented guarantee.

### Mobile attachment follow-up

This follow-up supersedes the Windows-only Drive Attachments pilot recommendation above. The earlier evidence remains useful, but seamless capture means the same normal action and byte authority on both Windows and Android, not only a link that Android can open.

Drive Attachments declares `isDesktopOnly: true`, and its Obsidian page lists **Desktop only**. When enabled only on Windows:

- attachments pasted or dropped through its Windows handlers can upload to Drive;
- FNS synchronizes the resulting link text to Android;
- attachments created on Android bypass Drive Attachments and remain ordinary vault files synchronized by FNS;
- the vault therefore acquires two capture behaviors and two live attachment authorities.

Official registry and GitHub searches found these closest alternatives:

| Option | Mobile and capture evidence | Privacy, scope, and scorecard consequence | Decision |
|---|---|---|---|
| [Loft](https://community.obsidian.md/plugins/loft#scorecard) | Version `0.1.2`; Desktop and Mobile; paste works on mobile and drag/drop works on desktop. [README](https://github.com/opellen/Loft) limits automatic upload to images. | Health Excellent and Review Passed, but every image is shared as **anyone with the link**, OAuth tokens live in vault plugin data, and non-image files are unsupported. | Reject for private, arbitrary attachments. |
| [Minio Uploader](https://community.obsidian.md/plugins/minio-uploader#scorecard) | Version `1.0.2`; Desktop and Mobile; [README](https://github.com/seebin/obsidian-minio-uploader-plugin) claims paste/drop upload for images, video, audio, PDF, and other files. | Bucket must permit anonymous file access. Health Fair and Review Caution; scorecard reports last commit and release three years ago. Requires another storage service and public object URLs. | Reject for release one. Capability is close, but privacy and maintenance miss requirements. |
| [S3 attachments storage](https://community.obsidian.md/plugins/s3-attachments-storage#scorecard) | Version `0.1.2`; Desktop and Mobile; [README](https://github.com/ttax00/obsidian-s3) supports paste/drop for images, MP4, MP3, and WAV, with unsupported files only as download links. | Health Fair and Review Caution; last commit and release three years ago. Incomplete type support and stale retry/migration behavior do not justify another authority. | Reject. |
| [Bunny Publisher](https://community.obsidian.md/plugins/bunny-publisher#scorecard) | Version `1.1.0`; Desktop and Mobile; media and files can reach Bunny storage. [README](https://github.com/ericmwalk/obsidian-bunny-publisher) documents a command that scans current note rather than symmetric automatic capture. | Health Excellent and Review Passed. This is CDN publishing with generated remote URLs, another service authority, and optional local deletion. | Reject for private seamless capture; reconsider only for deliberate publishing. |
| [Attachment Imagebed Manager](https://community.obsidian.md/plugins/attachment-imagebed-manager) | Version `1.0.6`; Desktop and Mobile; [README](https://github.com/perinchiang/obsidian-plugins-attachment-imagebed-manager) covers arbitrary types but mobile upload is manual. Automatic scanning and delayed deletion are desktop-only. | Requires S3-compatible storage plus public access URL and stores credentials in plugin data. It is migration/management UI, not identical paste behavior across clients. | Reject for release-one capture. |
| Google Drive whole-vault plugins | Some current manifests allow mobile and synchronize vault folders. | These are competing whole-vault transports, not attachment-only ingress. Running one beside FNS creates overlapping writers for notes and attachments. | Reject while FNS is selected. |

Two GitHub results outside the official registry did not change the result. `obsidian-attachment-assistant` contained no releasable plugin manifest at inspection time. `obsidian-attachment-relay` contained design iterations but no implementation or release. Neither is a candidate for a production pilot.

No current official plugin found satisfies all required constraints together: Android support, automatic low-friction capture on both platforms, arbitrary private attachments, offline-readable normal Obsidian links, and no second whole-vault transport. This is a bounded registry and GitHub conclusion, not a claim that no experimental plugin can ever exist.

FNS itself documents full real-time synchronization of images, video, audio, and other non-configuration files on Windows and Android. Its current Obsidian scorecard reports Health Excellent and Review Passed. This does not prove server safety or recovery, but it meets the cross-platform attachment model without another live authority. Release one therefore keeps attachments as ordinary vault files, synchronizes them only through FNS, and leaves Cloud Preview automatic local deletion off.

## Hermes and extension consequence

FNS-first human sync deliberately delays Hermes filesystem writes. Initial extension set is:

1. Fast Note Sync plugin on Windows and Android.
2. Self-hosted FNS server behind private access controls.
3. Ordinary Obsidian attachments on both clients, synchronized by FNS with Cloud Preview automatic local deletion off.
4. No separate live attachment-offload plugin.
5. No FNS MCP, REST, Git automation, third-party headless sync, or Local REST API.
6. No Syncthing, LiveSync, or whole-vault Google Drive sync on the same vault.

Hermes bundled Obsidian skill and scheduled proposal workflow remain designed but disabled. After FNS human pilot:

- test least-privilege FNS API behavior and external-writer survival in a disposable vault;
- if gates pass, design one explicit Hermes transport and authorization boundary;
- if gates fail or a plain VPS filesystem becomes mandatory, replace FNS with Syncthing core plus Syncthing Manager and reuse the existing filesystem-first Hermes design;
- reconsider LiveSync when encrypted CLI push is fixed and ARM64-tested.

Do not add OpenViking, embeddings, Dusk's plugin runtime, Telegram ingestion, or a second sync engine to compensate for transport uncertainty.

## Live VPS observation

Read-only inspection on 2026-07-22 observed:

- 9Router online under PM2, version `0.5.40`.
- Hermes Agent `0.18.2` installed.
- `hermes-gateway` repeatedly restarted under PM2 with exit code `1` and near-zero observed uptime.
- A user-level `hermes-gateway.service` exists but is failed, disabled, and reported outdated by current Hermes CLI. Separate gateway processes were still present outside that active unit.
- No matching Docker container was found for these services.

No raw logs, credentials, private endpoints, account identifiers, or configuration values were copied. Mixed PM2, process, and user-systemd state proves supervisor ambiguity, not a specific crash cause. One authoritative supervisor and stable health remain mandatory before any vault or scheduled-agent access.

## NotebookLM challenge record

NotebookLM authentication was refreshed and both supplied notebooks were queried.

Lean notebook findings retained after independent checks:

- Low latency does not remove multi-writer and offline conflict risk.
- FNS deserves priority for simple human setup and integrated UX.
- Sync, history, and independent backup remain separate guarantees.

Lean notebook claims rejected or narrowed:

- Broad FNS security language was reduced to exact open reports and their unresolved status.
- Syncthing versioning was not described as complete backup because it excludes same-device local edits.
- Google Drive attachment behavior was checked against each plugin's desktop/mobile and privacy model.

The broader notebook helped rediscover generic Obsidian attachment and sync sources but did not contain current Drive Attachments or FNS Cloud Preview evidence. It remains useful for discovery, not authority.

## Decision

- **Preferred human sync pilot:** Fast Note Sync in an isolated vault, with integrated history, trash, and ordinary local-attachment tests on both clients.
- **Pilot boundary:** no Hermes writes, FNS MCP/REST, headless client, Git automation, or second sync transport.
- **Attachment ingress:** use platform-native Obsidian capture plus normal links and embeds on Windows and Android. Vault files remain canonical attachment content; FNS is the only live synchronization transport. Keep Cloud Preview automatic local deletion off.
- **Rejected split:** Drive Attachments remains useful desktop software, but desktop-only upload makes mobile capture asymmetric. Current mobile alternatives either expose objects, cover images or limited formats, require manual mobile conversion, add another service, or duplicate whole-vault sync.
- **Backup boundary:** select and test an independent recovery destination separately. Google Drive may later hold an encrypted or otherwise policy-approved recovery copy, but no Drive plugin or remote URL is part of live attachment capture.
- **Fallback for plain-file Hermes access:** replace FNS with Syncthing core plus Syncthing Manager after its own physical-device and restore gates.
- **Mature promotion candidate:** Self-hosted LiveSync after encrypted CLI issue `#1036` is fixed and verified on Oracle ARM64.
- **Immediate infrastructure gate:** stabilize Hermes gateway before any scheduled or write-capable vault integration.

This is a contextual choice driven by desired Obsidian UX. It is not a universal product ranking, a claim that FNS server passed Obsidian review, or approval to expose a personal vault to Hermes before promotion tests.

## Historical continuity

Earlier findings remain preserved by reference:

- [2026-07-21 sync and agent extensions](../archive/research/sync-and-agent-extensions.md) contains the first official-source and community comparison.
- [NotebookLM adversarial review](notebooklm-adversarial-review.md) records prior accepted challenges and retractions.
- [Decision log](../decisions/decision-log.md) records changes in recommendation without erasing old rationale.
- Git history preserves every detailed checkpoint; archived [repository history](../archive/snapshots/repository-history.md) records the former permanent-dev and generated-clean split.
