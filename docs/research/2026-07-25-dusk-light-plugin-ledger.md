# Dusk_light plugin ledger

Date: 2026-07-25

Status: Goal 1 discovery evidence. This ledger is not a retain/remove decision
and authorizes no live-vault change.

## Method and limits

The source `Dusk_light` contains 47 installed plugins. Source configuration
listed 46 as enabled; `daily-note-navbar` was the sole disabled plugin. The
corrected source-safe runtime copy additionally held BRAT, Custom Frames, and
Todoist off,
so no beta installer, embedded frame, Todoist credential, sync, share, or
publish path could run. That deliberate runtime state is the `State` column
below.

Versions after `->` are versions Obsidian 1.12.7 offered and installed on both
Windows and Android. `Min` is that installed release's manifest
`minAppVersion`. `both` means the manifest does not declare desktop-only; it is
not proof of full Android support. Current upstream releases were checked
against the official Obsidian registry and project releases on 2026-07-25.

Every community plugin inherits Obsidian's host permissions. Boundary notes
identify additional behavior established from source or documentation.
Source per-plugin `data.json` was intentionally unopened and excluded from the
corrected copies. Configuration migration and source-config compatibility
therefore remain unproved. Fresh plugin defaults created during each platform's
run stayed on that platform. Startup cost was not isolated per plugin. Rollback
for every update is replacement of the whole disposable vault from its
pre-update checkpoint, not downgrading a single `main.js`.

## Complete inventory

| Plugin and official links | Plain-language role and Dusk surface | Source -> tested | Sanitized test state | Min / platform | Current upstream and boundary | Goal 2 candidate |
|---|---|---:|---|---|---|---|
| [Commander](https://github.com/jsmorabito/obsidian-commander) `cmdr` ([page](https://obsidian.md/plugins?id=cmdr)) | Adds commands to ribbons and other UI; Dusk navigation controls | 0.5.2 -> 0.5.7 | on | 1.4.4 / both | 0.5.7. UI configuration writes | Update only after Android gate |
| [Custom File Explorer sorting](https://github.com/sebastianmc/obsidian-custom-sort) `custom-sort` ([page](https://obsidian.md/plugins?id=custom-sort)) | Rule-based file ordering; Dusk folder presentation | 2.1.14 -> 3.1.6 | on | 1.7.2 / both | 3.1.6. Reads folder metadata and sort specifications | Defer until folder schema exists |
| [Daily Note Navbar](https://github.com/karstenpedersen/obsidian-daily-note-navbar) `daily-note-navbar` ([page](https://obsidian.md/plugins?id=daily-note-navbar)) | Previous/next links for daily notes | 0.2.0 -> 0.2.1 | off | 0.15.0 / both | 0.2.1. Local navigation | Optional |
| [Datacore](https://github.com/blacksmithgu/datacore) `datacore` ([page](https://obsidian.md/plugins?id=datacore)) | Executable query views; Home, Mail Box, Priority Matrix, habit components | 0.1.19 -> 0.1.29 | on | 1.4.11 / both | 0.1.29 compatible. Map and Mail Box render on both; JSX has vault API access | Keep for tested Dusk surfaces; gate writes and review code |
| [Dataview](https://github.com/blacksmithgu/obsidian-dataview) `dataview` ([page](https://obsidian.md/plugins?id=dataview)) | Metadata queries and DataviewJS dashboards | 0.5.67 -> 0.5.68 | on | 0.13.11 / both | 0.5.70 upstream; 0.5.68 was compatible. Two explicit flags restore tested output | Keep for tested Dusk surfaces; gate executable queries |
| [Editing Toolbar](https://github.com/pkm-er/obsidian-editing-toolbar) `editing-toolbar` ([page](https://obsidian.md/plugins?id=editing-toolbar)) | Floating formatting toolbar; now also offers AI rewriting | 2.4.16 -> 4.0.11 | on | 0.14.0 / both | 4.0.11. Optional network/model/API-key boundary | Keep AI off; evaluate toolbar alone |
| [Garble Text](https://github.com/kurakart/garble-text) `garble-text` ([page](https://obsidian.md/plugins?id=garble-text)) | Obscures visible text for screenshots/focus | 1.2.0 -> 1.2.0 | on | 0.12.10 / both | 1.2.0, no release since 2022. View transformation | Remove/defer unless concrete need |
| [Highlightr](https://github.com/chetachiezikeuzor/Highlightr-Plugin) `highlightr-plugin` ([page](https://obsidian.md/plugins?id=highlightr-plugin)) | Colored text highlights | 1.2.2 -> 1.2.2 | on | 0.12.8 / both | 1.2.2, stale. Interacts badly with Settings Search | Hold |
| [Homepage](https://github.com/mirnovov/obsidian-homepage) `homepage` ([page](https://obsidian.md/plugins?id=homepage)) | Opens Dusk Home at startup | 4.0.7 -> 4.4.4 | on | 1.12.2 / both | 4.4.4. Opens configured local note/workspace | Likely retain if Home retained |
| [Home Tab](https://github.com/olrenso/obsidian-home-tab) `home-tab` ([page](https://obsidian.md/plugins?id=home-tab)) | Browser-like new/home tab | 1.2.2 -> 1.2.2 | on | 1.6.0 / both | 1.2.2. Local UI | Possible duplicate of Homepage |
| [Iconic](https://github.com/gfxholo/iconic) `iconic` ([page](https://obsidian.md/plugins?id=iconic)) | Icons for files, folders, tabs, and properties | 1.0.15 -> 1.1.10 | on | 1.12.0 / both | 1.1.10. Writes icon metadata/settings | Optional visual layer |
| [Journals](https://github.com/srg-kostyrko/obsidian-journal) `journals` ([page](https://obsidian.md/plugins?id=journals)) | Daily, weekly, and monthly note definitions | 1.4.3 -> 2.1.10 | on | 1.0.0 / both | 2.1.10. v2 migration can rewrite journal configuration; corrected source-safe run had no source configuration to migrate | Retest on synthetic templates |
| [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) `js-engine` ([page](https://obsidian.md/plugins?id=js-engine)) | Runs JavaScript from notes and components | 0.1.17 -> 0.3.6 | on | 1.4.0 / both | 0.3.6. Arbitrary executable-note and vault-write boundary | Defer |
| [Natural Language Dates](https://github.com/argenos/nldates-obsidian) `nldates-obsidian` ([page](https://obsidian.md/plugins?id=nldates-obsidian)) | Converts phrases such as “next Friday” into dates | 0.6.2 -> 0.6.2 | on | 1.0.0 / both | 0.6.2; absent from current registry. Editor write | Replace/defer |
| [Note Toolbar](https://github.com/chrisgurney/obsidian-note-toolbar) `note-toolbar` ([page](https://obsidian.md/plugins?id=note-toolbar)) | Context-specific note command bars | 1.14.9 -> 1.34.12 | on | 1.11.0 / both | 1.34.12. Invokes configured commands | Possible retain after command audit |
| [Novel Word Count](https://github.com/isaaclyman/novel-word-count-obsidian) `novel-word-count` ([page](https://obsidian.md/plugins?id=novel-word-count)) | File-tree word counts | 3.12.2 -> 4.6.4 | on | 0.13.31 / both | 4.6.4. Reads/indexes notes; failed when no file-explorer leaf existed | Hold on mobile/minimal workspaces |
| [BRAT](https://github.com/TfTHacker/obsidian42-brat) `obsidian42-brat` ([page](https://obsidian.md/plugins?id=obsidian42-brat)) | Installs beta plugins from GitHub | 1.0.3 -> 2.2.0 | off | 1.11.4 / both | 2.2.0. Downloads and executes unreviewed plugin code | Keep off/remove |
| [Admonition](https://github.com/ebullient/obsidian-admonition) `obsidian-admonition` ([page](https://obsidian.md/plugins?id=obsidian-admonition)) | Styled callout blocks | 10.3.2 -> 11.0.0 | on | 1.1.0 / both | 12.0.5 upstream requires Obsidian 1.13; 11.0.0 was compatible | Prefer core callouts where possible |
| [Checklist](https://github.com/delashum/obsidian-checklist-plugin) `obsidian-checklist-plugin` ([page](https://obsidian.md/plugins?id=obsidian-checklist-plugin)) | Aggregates checklist items by tags | 2.2.13 -> 2.2.14 | on | 0.14.5 / both | 2.2.14. Vault-wide indexing; Android OOM report #193 | Hold pending mobile profile |
| [Custom Frames](https://github.com/Ellpeck/ObsidianCustomFrames) `obsidian-custom-frames` ([page](https://obsidian.md/plugins?id=obsidian-custom-frames)) | Embeds external web apps in Obsidian | 2.4.7 -> 2.5.0 | off | 1.2.0 / both | 2.5.0. Network, cookies, credentials, embedded web content | Keep off/remove |
| [Excalidraw](https://github.com/zsviczian/obsidian-excalidraw-plugin) `obsidian-excalidraw-plugin` ([page](https://obsidian.md/plugins?id=obsidian-excalidraw-plugin)) | Drawing/canvas documents | 2.5.2 -> 2.25.3 | on | 1.8.7 / both | 2.25.3. Large executable plugin and attachment writes | Defer until drawing need |
| [Grandfather](https://github.com/noatpad/obsidian-grandfather) `obsidian-grandfather` ([page](https://obsidian.md/plugins?id=obsidian-grandfather)) | Shows ancestor folders in note headers | 1.0.1 -> 1.0.1 | on | 0.9.8 / both | 1.0.1, stale. Local path UI | Replace/defer |
| [Hider](https://github.com/kepano/obsidian-hider) `obsidian-hider` ([page](https://obsidian.md/plugins?id=obsidian-hider)) | Hides selected interface elements | 1.5.1 -> 1.6.2 | on | 1.11.1 / both | 1.6.2. UI settings | Optional; accessibility risk |
| [Hotkeys for specific files](https://github.com/Vinzent03/obsidian-hotkeys-for-specific-files) `obsidian-hotkeys-for-specific-files` ([page](https://obsidian.md/plugins?id=obsidian-hotkeys-for-specific-files)) | Assigns hotkeys to exact notes | 1.4.1 -> 1.4.1 | on | unspecified / both | 1.4.1. Opens configured files | Replace with native commands if feasible |
| [Hover Editor](https://github.com/nothingislost/obsidian-hover-editor) `obsidian-hover-editor` ([page](https://obsidian.md/plugins?id=obsidian-hover-editor)) | Edits notes inside hover popovers | 0.11.21 -> 0.11.30 | on | 1.10.6 / both | 0.11.30. Editor surface injection | Desktop-oriented optional |
| [List Callouts](https://github.com/mgmeyers/obsidian-list-callouts) `obsidian-list-callouts` ([page](https://obsidian.md/plugins?id=obsidian-list-callouts)) | Styles list items by marker | 1.2.9 -> 1.2.9 | on | 1.1.1 / both | 1.2.9. Rendering only | Optional CSS-like layer |
| [Meta Bind](https://github.com/mProjectsCode/obsidian-meta-bind-plugin) `obsidian-meta-bind-plugin` ([page](https://obsidian.md/plugins?id=obsidian-meta-bind-plugin)) | Interactive inputs that write note properties/content | 1.2.5 -> 1.4.15 | on | 1.10.0 / both | 1.5.1 upstream; 1.4.15 was compatible. Direct note writes | Defer until schema and rollback exist |
| [Minimal Theme Settings](https://github.com/kepano/obsidian-minimal-settings) `obsidian-minimal-settings` ([page](https://obsidian.md/plugins?id=obsidian-minimal-settings)) | Controls Minimal theme options | 8.1.1 -> 8.2.3 | on | 1.11.1 / both | 8.2.3. Theme settings only | Retain only with Minimal theme |
| [Outliner](https://github.com/vslinko/obsidian-outliner) `obsidian-outliner` ([page](https://obsidian.md/plugins?id=obsidian-outliner)) | Outline-style list editing and reordering | 4.8.1 -> 4.10.2 | on | 1.11.7 / both | 4.10.2. Rewrites list structure; Android touch limitation request #582 | Optional after edit tests |
| [Paste image rename](https://github.com/reorx/obsidian-paste-image-rename) `obsidian-paste-image-rename` ([page](https://obsidian.md/plugins?id=obsidian-paste-image-rename)) | Renames pasted attachments and updates links | 1.6.1 -> 1.6.1 | on | 0.12.0 / both | 1.6.1, stale. Filesystem rename/write boundary | Defer until attachment policy |
| [Projects](https://github.com/mgmeyers/obsidian-projects) `obsidian-projects` ([page](https://obsidian.md/plugins?id=obsidian-projects)) | Database-like project views | 1.17.4 -> 1.17.4 | on | 1.0.0 / both | 1.17.4; absent from current registry. Indexes properties and can write them | Replace/defer; test core Bases |
| [Style Settings](https://github.com/obsidian-community/obsidian-style-settings) `obsidian-style-settings` ([page](https://obsidian.md/plugins?id=obsidian-style-settings)) | Exposes CSS/theme variables as settings | 1.0.9 -> 1.0.9 | on | 0.11.5 / both | 1.0.9. Writes appearance settings | Retain only for selected CSS/theme |
| [Tasks](https://github.com/obsidian-tasks-group/obsidian-tasks) `obsidian-tasks-plugin` ([page](https://obsidian.md/plugins?id=obsidian-tasks-plugin)) | Task queries, recurrence, completion, and edits | 7.12.2 -> 8.3.0 | on | 1.8.7 / both | 8.3.0. Vault-wide index and note-content writes | Candidate after task contract |
| [Trash Explorer](https://github.com/proog/obsidian-trash-explorer) `obsidian-trash-explorer` ([page](https://obsidian.md/plugins?id=obsidian-trash-explorer)) | Browses, restores, or permanently deletes `.trash` files | 1.2.3 -> 1.2.4 | on | 0.15.0 / both | 1.2.4. Destructive filesystem boundary | Keep off until recovery drill |
| [Force Note View Mode](https://github.com/bwydoogh/obsidian-force-view-mode-of-note) `obsidian-view-mode-by-frontmatter` ([page](https://obsidian.md/plugins?id=obsidian-view-mode-by-frontmatter)) | Chooses read/edit mode from frontmatter | 1.2.2 -> 1.2.2 | on | 0.9.12 / both | 1.2.2, stale. Reads properties | Optional |
| [Omnisearch](https://github.com/scambier/obsidian-omnisearch) `omnisearch` ([page](https://obsidian.md/plugins?id=omnisearch)) | Full-text search and local index | 1.25.0 -> 1.29.3 | on | 1.7.2 / both | 1.29.3. Indexes note content locally | Compare against core search |
| [Pomodoro Timer](https://github.com/eatgrass/obsidian-pomodoro-timer) `pomodoro-timer` ([page](https://obsidian.md/plugins?id=pomodoro-timer)) | Local focus timer | 1.2.3 -> 1.2.3 | on | 0.15.0 / both | 1.2.3, stale. Local state | Optional |
| [QuickAdd](https://github.com/chhoumann/quickadd) `quickadd` ([page](https://obsidian.md/plugins?id=quickadd)) | Capture macros, templates, scripts, and commands; Dynamic Form entry point | 1.11.1 -> 2.12.3 | on | 1.11.4 / both | 2.19.1 upstream; 2.12.3 was compatible. Runs user JavaScript and writes anywhere configured | Defer scripts; evaluate narrow capture |
| [Quick Explorer](https://github.com/pjeby/quick-explorer) `quick-explorer` ([page](https://obsidian.md/plugins?id=quick-explorer)) | File/folder navigation controls | 0.2.10 -> 0.2.18 | on | 1.10.4 / desktop | 0.2.18. File operations; manifest excludes mobile | Desktop-only; do not make core workflow depend on it |
| [Recent Files](https://github.com/tgrosinger/recent-files-obsidian) `recent-files-obsidian` ([page](https://obsidian.md/plugins?id=recent-files-obsidian)) | Recent-note list | 1.7.0 -> 1.7.10 | on | 0.16.3 / both | 1.7.10. Local history | Optional; Home already exposes it |
| [Settings Search](https://github.com/javalent/settings-search) `settings-search` ([page](https://obsidian.md/plugins?id=settings-search)) | Searches Obsidian/plugin settings | 1.3.10 -> 1.3.10 | on | 0.12.17 / both | 1.3.10, stale. Official issue #47 matches Highlightr interaction | Hold/remove |
| [Status Bar Organizer](https://github.com/opisek/obsidian-statusbar-organizer) `statusbar-organizer` ([page](https://obsidian.md/plugins?id=statusbar-organizer)) | Reorders/hides desktop status items | 2.1.2 -> 2.1.5 | on | 0.15.0 / desktop | 2.1.5. UI settings; manifest excludes mobile | Desktop-only optional |
| [Tabs](https://github.com/xhuajin/obsidian-tabs) `tabs` ([page](https://obsidian.md/plugins?id=tabs)) | Note-defined tab groups/navigation | 1.1.7 -> 1.2.1 | on | 1.8.7 / both | 1.2.1. Creates/edits tab markup | Defer until navigation design |
| [Tag Wrangler](https://github.com/pjeby/tag-wrangler) `tag-wrangler` ([page](https://obsidian.md/plugins?id=tag-wrangler)) | Renames and merges tags across vault | 0.6.1 -> 0.6.4 | on | 1.5.8 / both | 0.6.4. Broad content-rewrite boundary | Keep off until backup/preview gate |
| [Templater](https://github.com/SilentVoid13/Templater) `templater-obsidian` ([page](https://obsidian.md/plugins?id=templater-obsidian)) | Executes templates and JavaScript on note creation | 2.9.1 -> 2.20.6 | on | 1.12.2 / both | 2.24.3 upstream; 2.20.6 was compatible. Commands, executable templates, filesystem writes | Defer executable templates |
| [Todoist Sync](https://github.com/jamiebrynes7/obsidian-todoist-plugin) `todoist-sync-plugin` ([page](https://obsidian.md/plugins?id=todoist-sync-plugin)) | Fetches and writes Todoist tasks | 1.13.0 -> 2.6.0 | off | 1.11.4 / both | 2.6.0. Credential and external network/write boundary | Keep off/remove |
| [Paste URL into Selection](https://github.com/denolehov/obsidian-url-into-selection) `url-into-selection` ([page](https://obsidian.md/plugins?id=url-into-selection)) | Turns selected text into a Markdown link when pasting a URL | 1.7.0 -> 1.11.4 | on | unspecified / both | 1.11.4. Rewrites selection; mobile issue #50 reports deleted selection | Hold on Android |

## Runtime results

- Windows first open loaded 42 of 43 corrected enabled plugins. `cmdr` 0.5.2
  did not load during startup.
- Android rejected Commander 0.5.2 with the visible notice: `Unable to load
  plugin Commander v0.5.2. This version has been reported to cause issues.
  Please check for a newer version of the plugin.`
- The update check offered 34 of 47 updates on both platforms. Post-update
  versions matched exactly across Windows and Android.
- Journals 2.1.10 showed no migration prompt in corrected source-safe copies.
  An earlier prompt came from a quarantined copy that accidentally included
  source `data.json`; it is not promotion evidence. Source migration remains
  untested.
- Editing Toolbar 4.0.11 introduced `Enable AI Editor`. The experiment chose
  `Not now`; no provider or API key was configured.
- A Windows cold reload loaded all 43 corrected enabled plugins. The light
  workspace emitted two Novel Word Count `Could not find file explorer leaf`
  errors and the Highlightr/Settings Search `parentNode` error.
- Android post-update reload did not repeat the Commander block. Corrected
  `Dusk_light` was ready between 5.7 and 10.7 seconds; corrected full `Dusk`
  was ready between 11.7 and 19.7 seconds. Neither corrected run reached
  Obsidian's recovery screen.
- Excluding source `data.json` left Dataview JavaScript disabled. Setting only
  `enableDataviewJs` and `enableInlineDataviewJs` restored tested output.
  Earlier raw Datacore findings came from editing mode. Map of Content and Mail
  Box render in reading view on Windows and Android.
- Functional baselines load 44 light plugins on Windows and 42 on Android.
  Android excludes the two desktop-only plugins. Network and credential
  plugins remain separate gates.

## Cross-cutting disposition

No final plugin set is selected. Goal 2 should start from demonstrated Dusk
surfaces, then add the minimum plugins needed for one surface at a time.
Executable-note engines (`datacore`, DataviewJS, JS Engine, QuickAdd scripts,
and Templater scripts), broad writers, credentialed/network plugins, and
destructive file tools require separate threat, backup, and Android gates.
