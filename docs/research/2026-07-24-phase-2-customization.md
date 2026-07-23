# Phase 2 FNS storage and Obsidian customization review

Reviewed: 2026-07-24

Status: current implementation evidence for Phase 2 and Phase 2.5. Product
behavior remains authoritative in linked design and decision files.

## Question

Which FNS storage option and smallest Obsidian customization set provide:

- one seamless Windows and Android vault;
- useful Dusk-like navigation and learning views;
- explicit folder order and fast startup;
- native attachments with no second synchronization authority;
- simple rollback and continued use when community plugins fail?

## Method

Agent Reach verified GitHub, Reddit, YouTube, and general web access. Evidence
included official documentation, tagged source, current releases, open issues,
Obsidian plugin scorecards, forum and Reddit reports, and selected YouTube
transcripts.

The older NotebookLM notebook suggested sources only. The lean notebook
challenged the proposed decision after receiving current repository scope and
verified sources. NotebookLM output did not become authority automatically.
Its useful cautions were independently checked; unsupported proposals and
claims were rejected.

Local inventories covered:

- `G:\Obsidian`: 312 files before customization;
- `G:\Obsidian\Notion`: 164 files and 1,095,124 bytes;
- current community plugins: FNS `2.4.0` and Importer `1.8.12`;
- Dusk: 58 plugin artifacts and 27 template, script, or CSS files;
- newer Dusk Discord material: Datacore dashboards plus discontinued Habit
  work and QuickAdd-dependent dynamic forms.

No Dusk credential or plugin data file was read.

## FNS Storage Configuration

### Observed

FNS server `3.6.0` exposes exactly six optional storage types:

| Type | Server adapter | Required external boundary |
|---|---|---|
| `localfs` | server filesystem | configured server path |
| `oss` | Aliyun OSS | endpoint, region, bucket, key and secret |
| `s3` | AWS S3 | endpoint, region, bucket, key and secret |
| `r2` | Cloudflare R2 | endpoint, account, bucket, key and secret |
| `minio` | MinIO | endpoint, bucket, key and secret |
| `webdav` | WebDAV | endpoint, username, password, custom path |

Sources:

- [enabled type API](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/docs/REST_API.md#get-enabled-storage-types)
- [server storage configuration](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/internal/config/storage.go)
- [storage client dispatch](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/pkg/storage/storage.go)

These providers are backup/export destinations, not FNS live transport. Backup
jobs can create full or incremental ZIP archives or mirror current notes and
attachments to selected storage. `sync` backup mode also propagates deletions.
Validation writes then deletes a test object.

Sources:

- [backup request modes](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/internal/dto/backup.go)
- [archive and mirror behavior](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/internal/service/backup_service.go)
- [storage validation](https://github.com/haierkeys/fast-note-sync-service/blob/3.6.0/internal/service/storage_service.go)

Google Drive is not a native provider. Empty WebGUI Type list remains expected
because current deployment disables all six optional providers.

### Google Drive bridges

[rclone supports Google Drive](https://rclone.org/drive/) and can expose a Drive
remote through [a WebDAV server](https://rclone.org/commands/rclone_serve_webdav/).
That bridge requires a Google OAuth token or service-account credential, an
always-running rclone process, WebDAV authentication, and a protected listener.
A public listener also needs TLS or a trusted reverse proxy. Cloud-object VFS
semantics and caching add another operational boundary.

Mounting Drive then selecting `localfs` has the same extra daemon and remote
filesystem boundary. Running a separate object-storage gateway adds still more
state. A scheduled direct `rclone copy` could later move an already-created
independent recovery artifact to Drive, but it is not a reason to enable FNS
Storage Configuration now.

### Decision

Keep every optional FNS storage provider disabled in Phase 2. Do not deploy
Google Drive bridge, storage mirror, or second sync engine. Select independent
backup destination only with a restore-tested recovery design; FNS backup
history alone still shares server and credential failure domains.

## Dusk experience without Dusk runtime

### Useful behavior

Dusk provides:

- clear Home entrypoint and current-focus navigation;
- PARA, Zettelkasten, daily, template, and system areas;
- project, meeting, source, permanent, daily, and weekly note shapes;
- property-driven lists and dashboards;
- deliberate visual hierarchy.

### Rejected runtime

Dusk's Home and templates depend on a chain including Dataview or Datacore,
Tasks, Templater, QuickAdd, Meta Bind, JS Engine, Charts, Todoist, Iconic, and
custom scripts. Newer Discord dashboards still require Datacore, while dynamic
form requires QuickAdd. Copying that runtime would violate mobile, startup,
credential, and no-bloat requirements.

Obsidian core [Bases](https://github.com/obsidianmd/obsidian-help/blob/master/en/Bases/Introduction%20to%20Bases.md)
can filter note properties into table and list views, embed views in notes, and
work without DataviewJS. Core [Properties](https://help.obsidian.md/properties),
[Templates](https://help.obsidian.md/plugins/templates), Bookmarks, Search,
Daily Notes, Backlinks, and File Recovery cover accepted starter behavior. A
2025 video supports simpler core replacement and better mobile rendering but
is community evidence rather than implementation contract:
[Dataview vs Obsidian Bases](https://www.youtube.com/watch?v=1Mgsdpy7awE).

### Decision

Recreate Dusk's useful experience with concise Home, three core Bases, six
optional core templates, Minimal theme, and one small dashboard CSS snippet.
Do not install Dusk's dependency chain or import sample/private content.

## Community plugin review

Obsidian scorecards are automated triage, not security audits. Health describes
maintenance signals; Review describes code-review signals. Both were checked
against releases, manifests, source, and relevant issues.

| Component | Retain | Evidence and bounded use |
|---|---|---|
| Fast Note Sync `2.4.0` | Yes | Sole live sync; never delayed. Existing server and client safety gates remain. |
| Homepage `4.4.4` | Yes | Excellent Health, Passed Review, desktop/mobile, 2026-06-03 release. Open one Markdown Home note, not a mobile workspace. |
| Minimal theme `8.2.2` | Yes | 2026-07-15 release. CSS theme only; vault remains usable with default theme. |
| Minimal Theme Settings `8.2.3` | Yes | Excellent Health, Passed Review, desktop/mobile, 2026-05-11 release. One bounded theme controller. |
| Custom File Explorer sorting `3.1.6` | Yes | Excellent Health, Caution Review, desktop/mobile, 2025-07-24 release. One shallow root rule only; no recursive date scans or bookmark mutation. |
| Lazy Loader `1.0.24` | No | Excellent Health, Passed Review, desktop/mobile, 2026-05-31 release. Runtime testing found no safe delayed plugin: FNS, Homepage, and theme settings must be instant, while delayed Custom Sort loaded but missed automatic initial application. Keeping an idle manager would add bloat without startup benefit. |
| Importer `1.8.12` | No after verification | Import is complete. Archive plugin files in recovery copy and remove from enabled runtime. |

Scorecard sources:

- [Lazy Loader](https://community.obsidian.md/plugins/lazy-plugins)
- [Custom File Explorer sorting](https://community.obsidian.md/plugins/custom-sort)
- [Homepage](https://community.obsidian.md/plugins/homepage)
- [Minimal Theme Settings](https://community.obsidian.md/plugins/obsidian-minimal-settings)

[Lazy Loader's forum thread](https://forum.obsidian.md/t/87627) and
[original Reddit discussion](https://www.reddit.com/r/ObsidianMD/comments/1ekea52/install_this_plugin_loader_to_make_your_obsidian/)
contain large reported startup improvements on plugin-heavy vaults. These are
anecdotes, not a performance promise for this small vault. Local before/after
measurement decides whether startup remains acceptable.

### Rejected additions

- **Attachment Management and other rename/move plugins:** current source is
  maintained and mobile-declared, but unresolved reports include random mobile
  renames, Android failures, iOS link failures, orphaning, and rename loops.
  Examples: [issue 92](https://github.com/trganda/obsidian-attachment-management/issues/92),
  [issue 116](https://github.com/trganda/obsidian-attachment-management/issues/116),
  and [Paste Image Rename issue 107](https://github.com/reorx/obsidian-paste-image-rename/issues/107).
  Core `SYSTEM/Media` with original filenames is more portable.
- **Style Settings and Hider:** extra UI controllers are not required. Minimal
  Theme Settings plus one inspectable CSS snippet cover accepted visual needs.
- **Lazy Loader:** current retained plugins all require instant startup. Delayed
  Custom Sort missed initial application, and an idle loader added no useful
  behavior. Reconsider only after a later nonessential plugin has measured
  startup cost and verified delayed behavior.
- **Notebook Navigator:** Excellent Health and Passed Review, but it replaces
  file explorer and adds preview, indexing, and navigation behavior beyond the
  stated problem.
- **Omnisearch or semantic search:** core Search is sufficient for starter
  vault. Add an index only after measured retrieval failure.
- **Dataview, Datacore, Tasks, Templater, QuickAdd, Meta Bind, JS Engine,
  Charts, Todoist, Iconic:** large dependency and startup surface for behavior
  core Bases, Templates, links, and callouts can provide.
- **Google Drive attachment or whole-vault plugins:** create split desktop and
  mobile behavior or a second live byte authority, conflicting with FNS-only
  design.

## NotebookLM review disposition

Accepted cautions:

- FNS and Homepage must load immediately.
- Sorting must avoid recursive filesystem/date scans.
- Notion needs path, length, and SHA-256 comparison after implementation.
- Future Hermes remains proposal-only and cannot inherit FNS credentials.

Rejected output:

- Notion is a folder in current vault, not a separate token-scoped FNS vault.
  Issue `#346` remains a later agent-transport blocker but does not justify
  moving or rewriting import during this task.
- Raw FNS already binds to loopback behind dedicated TLS tunnel; adding another
  private-network product is not part of customization.
- Hider and Style Settings add unnecessary runtime.
- A 1.2-second mobile gate was unsupported and cannot be claimed without a
  physical Android run.
- Direct rclone upload remains a later independent-backup option, not current
  storage configuration.

## Implementation and rollback

Before changes, a complete vault copy and two matching SHA-256 manifests were
created outside vault and repository. Notion-only baseline has 164 files,
1,095,124 bytes, and manifest SHA-256
`AAD7631CB063E27CA1357F2DE068FBE1DA0CAF57525E0AFCC9C272E98A2C4D36`.

Implementation keeps Markdown and `.base` files useful without community
plugins. Disable any retained plugin by removing its ID from
`.obsidian/community-plugins.json`; restore its prior directory/config or full
vault from verified recovery copy. Restore default theme by clearing
`cssTheme`. No rollback requires a second sync engine.

Windows launch-to-main-window baseline on Obsidian `1.12.7`:

| Trial | Milliseconds |
|---|---:|
| 1 | 1,020 |
| 2 | 901 |
| 3 | 898 |

Median: 901 ms. This measures window readiness, not editor interaction or
physical Android readiness.

Final post-customization normal launch trials were 973 ms, 841 ms, and 825 ms.
Median was 841 ms and mean was 880 ms, compared with 901 ms median and 940 ms
mean before customization. This small sample does not support a general speed
claim. It does show no obvious launch regression. See
[implementation evidence](2026-07-24-phase-2-implementation-evidence.md).

## Remaining gates

- Physical Android homepage, folder-order, template, attachment, offline,
  background, history, trash, and startup checks.
- Four-week bounded personal human observation.
- Independent FNS and vault restore cadence and destination decision.
- Any later FNS API/MCP or Hermes transport decision, including issue `#346`.
