# Phase 2 setup and Obsidian customization

Updated: 2026-07-24

## Status and naming

This is the executable scope for the active Phase 2 setup and Phase 2.5
customization work. It prepares the bounded personal pilot described by
[the phased roadmap](phased-roadmap.md), but it cannot complete that release's
four-week human-use exit gate in one implementation session.

Corrective DEC-038 records that the explicit Notion-in-live-vault requirement
already crossed the synthetic boundary. This phase contains that existing
personal data; it does not count skipped Android, recurring-backup, or formal
promotion gates as passed.

The agent has standing authority to make bounded best-judgment decisions,
self-review them against this contract, and continue without synchronous
approval. Physical Android testing and human observation must be recorded as
pending rather than claimed.

## Outcome

Prepare and implement a rich, coherent Obsidian workspace on `G:\Obsidian`
while keeping Fast Note Sync as the sole live synchronization authority.
Recreate the latest available Dusk experience as closely as practical without
copying credentials, private content, or uninspected plugin state. Preserve the
Notion import unchanged for later Hermes work.

Work from current `main` on a short-lived feature branch. Preserve atomic
commits, verify each material change, push normally, and open a pull request.

## Evidence workflow

1. Research current official documentation, releases, source repositories,
   issue trackers, the Obsidian plugin catalog and scorecards, Obsidian Forum,
   Reddit, and useful YouTube demonstrations.
2. Prefer Agent Reach for public evidence.
3. Use older NotebookLM notebook
   `8ce765d2-f356-43a0-8717-e29975e6b257` only for source discovery.
4. Use lean NotebookLM notebook
   `c1fd2c71-0e8f-47c7-97ed-22e4f5f989ae` for adversarial synthesis.
5. Independently verify every material NotebookLM claim before promoting it
   into design authority.
6. Use the in-app browser only when rendered page interaction is required.
   Do not use BrowserAct. Computer Use is the last resort.
7. Separate observed facts, inferences, recommendations, accepted decisions,
   rejected alternatives, and rollback paths.

## Fast Note Sync storage decision

Research every current Fast Note Sync Storage Configuration provider:

- supported data path and intended use;
- authentication and secret handling;
- maintenance and compatibility state;
- recovery behavior and operational cost;
- whether it replaces or merely backs the server's default storage.

Determine whether Google Drive is supported natively. If not, evaluate
bridges such as WebDAV, rclone-backed storage, mounted filesystems, and
compatible object-storage gateways.

Prefer the existing FNS defaults. Do not deploy a Google Drive bridge, second
sync engine, or additional storage service unless verified evidence shows a
clear benefit, safe recovery, and acceptable complexity. A rejected bridge is
a valid result and must be documented.

Accepted result: keep all providers disabled. FNS `3.6.0` supports local
filesystem, Aliyun OSS, AWS S3, Cloudflare R2, MinIO, and WebDAV as optional
backup/export targets. It has no native Google Drive adapter. rclone/WebDAV,
mounted Drive, and object gateway bridges add more state and secrets than this
phase justifies. See [current evidence](../research/2026-07-24-phase-2-customization.md).

## Content preservation

- Create and verify a recovery copy of vault content and `.obsidian`
  configuration before customization.
- Preserve `G:\Obsidian\Notion` byte-for-byte.
- Do not rename, rewrite, sort, synthesize, classify, or move Notion notes.
- Reserve Notion transformation and integration for Hermes Phase 3.
- Never read, copy, print, or commit Dusk's `.obsidian/todoist-token` or any
  other credential.
- Do not import Dusk sample notes or private content.

## Dusk experience port

Inventory Dusk dashboards, templates, properties, commands, CSS behavior,
plugin dependencies, public legacy source, and user-supplied Discord updates.

- Ship Homepage, Map of Content, Mail Box/task dashboard, and area/project
  pages.
- Prefer current Datacore for rich interactive components. Use native Bases
  for ordinary file/property tables when behavior remains equivalent.
- Include the current Map of Content and Priority Matrix. Attempt the
  discontinued Habit Streak RPG only behind a removable component boundary;
  record a replacement or omission if current Datacore cannot run it safely.
- Use the QuickAdd Dynamic Form when current source passes inspection and
  bounded create-note testing.
- Fix small compatibility failures. Replace large broken dependencies with the
  closest maintained equivalent.
- Treat visual and workflow parity as the target. Plugin-count minimalism alone
  is not a reason to remove a required Dusk behavior.
- Do not copy Dusk's `.obsidian` directory wholesale.
- Select exact dashboards, scripts, snippets, settings, and assets. Never copy
  Todoist tokens, provider configuration, secret-bearing plugin data, sample
  notes, or private content.
- Use signed-in Discord through Coccoc only when supplied/public sources are
  broken or omit required current files.

## Templates and properties

Keep raw capture template-optional and fast. Recreate Dusk's useful template
and property behaviors, but remove fields with no active consumer. Useful
properties include:

- note type;
- status;
- created or modified date;
- source;
- aliases;
- tags.

User-visible dates render as `dd/mm/yyyy`. Typed Obsidian date properties and
sortable filenames remain ISO `YYYY-MM-DD`; slashes must never enter filenames
because they create directories. Avoid duplicated metadata and fields without
a known consumer.

## Minimal QOL scope

Research and test a curated set covering:

- explicit top-level folder ordering;
- controlled or lazy community-plugin startup;
- useful homepage and navigation;
- fast search;
- low-friction capture;
- predictable attachment naming;
- mobile compatibility;
- reduced ribbon, sidebar, and status-bar clutter.

Do not install a plugin solely because Dusk used it. Each retained plugin must
map to a reproduced behavior and needs:

- one explicit problem it solves;
- current maintenance evidence;
- Windows and Android compatibility assessment;
- startup and resource impact;
- security boundary;
- uninstall rollback.

Remove Obsidian Importer after the Notion import is verified complete if no
continuing workflow needs it.

Accepted baseline remains FNS, Minimal theme, Minimal Theme Settings, Homepage,
and Custom File Explorer sorting. Rich-runtime candidates are Datacore,
Dataview, Tasks, Templater, QuickAdd, Meta Bind, JS Engine, Style Settings,
Note Toolbar, and Lazy Loader. Install only current inspected releases and
record exact retained versions after runtime testing.

FNS, Homepage, Datacore, and dashboard-critical dependencies load immediately.
Custom Sort remains immediate because delayed startup misses its layout hook.
Lazy Loader may remain only when at least one optional plugin is measurably
safe to delay.

Keep FNS Configuration Sync disabled on every device. Plugin configuration is
machine-local and recoverable only from verified offline checkpoint until a
cross-platform subset receives a separate decision and test.

## Performance and sync safety

Measure Obsidian startup before and after customization. Keep only changes that
deliver useful behavior without unacceptable startup or interaction cost.

Customization must not break:

- FNS connection and convergence;
- normal Markdown editing;
- attachment sync;
- FNS history and recycle-bin access;
- offline writing;
- vault portability without community plugins.

No Google Drive attachment plugin, second whole-vault transport, Hermes writer,
FNS API client, or external filesystem writer enters this phase.

## Verification and delivery

Verify:

- vault recovery-copy hashes;
- unchanged Notion paths, bytes, and hashes;
- Obsidian reopen and startup measurements;
- folder order and homepage behavior;
- simplified templates and properties;
- links, embeds, search, commands, and attachment naming;
- selected plugin startup and rollback;
- FNS health, connection, current-file sync, history, trash, and attachment
  behavior where safe unattended checks exist;
- credential and personal-data exclusion from Git;
- repository links, tests, Mermaid diagrams, secrets, and whitespace.

Perform a final design and implementation review. Fix critical and important
findings before delivery. The pull request must contain scope, affected
decisions, plugin inventory, evidence, rollback instructions, exact validation
commands, and remaining physical Android and four-week human-pilot work.
