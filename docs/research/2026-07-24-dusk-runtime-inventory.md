# Dusk runtime inventory

Date: 2026-07-24

Status: active implementation evidence for DEC-037. No source listed here is
installed merely by appearing in this inventory.

## Pre-rich-runtime checkpoint

Obsidian was closed before copy. Recovery checkpoint:

```text
G:\Obsidian Backups\phase-2-pre-rich-dusk-20260724-122334
```

Whole-vault source and backup manifests:

- files: 334;
- bytes: 64,550,986;
- differing rows: 0;
- source manifest SHA-256:
  `1ABD77485DC0BEBAB544064DAFB17CEF864A01975729BA6B4208AE415E3243D1`;
- backup manifest SHA-256:
  `1ABD77485DC0BEBAB544064DAFB17CEF864A01975729BA6B4208AE415E3243D1`.

Notion baseline:

- files: 164;
- bytes: 1,095,099;
- manifest SHA-256:
  `2EFDC750B8A20F90942F1A70EB8018A537F322E111FF11DE5C4800CB2A6F83AF`.

FNS secret-bearing configuration content was not printed. Its baseline file
SHA-256 is
`1FB34C99B1CB13992BD2AE23D789B6E2C3D90559615AE8B2694D336F1F789DAB`.

## Windows baseline

Obsidian version: `1.12.7`.

Enabled runtime:

| Component | Version | Mobile declared |
|---|---:|---|
| Fast Note Sync | 2.4.0 | Yes |
| Homepage | 4.4.4 | Yes |
| Minimal Theme Settings | 8.2.3 | Yes |
| Custom File Explorer sorting | 3.1.6 | Yes |

Launch-to-main-window trials:

| Trial | Milliseconds |
|---|---:|
| 1 | 958 |
| 2 | 869 |
| 3 | 916 |

Median: 916 ms. Mean: 914 ms. This measures nonzero main-window handle, not
first interactive dashboard render or FNS convergence.

## Dusk source authority

### Public legacy vault

Repository: `DuskWasHere/dusk-obsidian-vault`.

Inspected commit:
`69fd1e725e21557b9eb7d706ccaa0834288085cb`.

Its README explicitly labels the repository legacy and points to Discord for
current modular releases. Public ZIPs contain filenames for a Todoist token,
Todoist plugin data, and password-protection plugin. Only names were
inventoried. Their contents are excluded.

Legacy dashboard hashes:

| File | SHA-256 |
|---|---|
| `HUB/Homepage.md` | `70E8903F1E860ACD2B9819E5D7B03DC01CF7128990CEF710AF481EBDCFFB678A` |
| `HUB/Map of Content.md` | `44B79ED1F414E01DC1A1F5359ED2E3B64B34A8F4FB7CE1CED6CBDA2360F00237` |
| `HUB/Mail Box.md` | `27F9E05BCC3D0D3FE3DA320724F46E3C0AEED83DABC5195F43DCD5F04A4733C9` |
| `SYSTEM/MOBILE HUB/Mobile Homepage.md` | `CEA87C4DD1C949A97C07CA10EC8106E0369CD0447D0501A27A40C06731F4894A` |
| `SYSTEM/MOBILE HUB/Mobile Map of Content.md` | `DB599097437930E367A27B39B752A11B5F04D38FDD21FAAF8A7006879732252F` |
| `SYSTEM/MOBILE HUB/Mobile Mail Box.md` | `E0013C0DB58A731BBFE3058F94CB3641AEB2A05FCFC8D4102DA303EFFE49FBF7` |

These files provide complete workflow reference, not direct unreviewed copy
authority.

### User-supplied Discord capture

Root:

```text
C:\Users\TienBac\Documents\New project\Dusk\new from discord
```

Selected entrypoints:

| Component | File or manifest | SHA-256 |
|---|---|---|
| Full-width CSS classes | `base.css` | `AD1AECAB319E3EE7B861571E8DAE0F1408A1465687FDAE80F70A6309E44AB1B3` |
| Dynamic Form | `DynamicFormScript.js` | `73E432FE75CEC776C2E372DC53DC631897F4B2B7F084B7CF555295984C71B126` |
| Map of Content | two-file directory manifest | `841ADB13E72435C8634D24FD40A93AADB32BE863B3C925F9588E1A1B9CCC8899` |
| Habit Streak RPG | 41-file directory manifest | `506E1CDC2FCBFD6A563E42D28C2BD164C5A1167B46DFBD7C4D1A8B90EE4DF4AB` |

Dusk's captured channel note says Map of Content and Priority Matrix require
Datacore, Dynamic Form requires QuickAdd, and Habit Streak RPG is discontinued.

### Current Priority Matrix

Repository: `DuskWasHere/Priority_Matrix`.

Inspected commit:
`bb0b67de694b9171b5ae80d6522303cfacf2ecc8`.

Commit date: 2026-01-25. License: MIT.

Three-file component manifest SHA-256:
`3CE74ABEE040EF5BEDE0FC25E253B9ADD4191BA5B08D2685361B2677685AF2A8`.

The repository version supersedes older local Priority Matrix copies.

## Selected dependency matrix

Release assets came from each plugin's official GitHub release. GitHub-provided
SHA-256 digests matched every downloaded asset that exposed a digest. Dataview
and Style Settings predate release-asset digests; their local SHA-256 values are
retained in implementation evidence.

Obsidian `1.12.7` cannot load the newest QuickAdd, Meta Bind, or Templater:
their current manifests require Obsidian `1.13.x`. The newest compatible
releases are pinned instead. Dataview's `0.5.70` release serves a manifest whose
internal version is `0.5.68`; the release asset is used without rewriting it.

Scorecard labels are automated triage, not approval. Health and Review are
recorded separately.

| Plugin ID | Installed version | Minimum Obsidian | Scorecard | Dusk behavior |
|---|---:|---:|---|---|
| `datacore` | 0.1.29 | 1.4.11 | Excellent / Caution | Map of Content and Priority Matrix reactive views |
| `dataview` | 0.5.68 from 0.5.70 release | 0.13.11 | Good / Risks | Homepage and mobile-compatible fallback queries |
| `obsidian-tasks-plugin` | 8.3.0 | 1.8.7 | Excellent / Caution | task queries and completion write-back |
| `templater-obsidian` | 2.20.6 | 1.12.2 | Excellent / Caution | date and note templates |
| `quickadd` | 2.12.3 | 1.11.4 | Excellent / Caution | capture actions and reviewed Dynamic Form |
| `obsidian-meta-bind-plugin` | 1.4.15 | 1.10.0 | Excellent / Satisfactory | interactive dashboard buttons and inputs |
| `js-engine` | 0.3.6 | 1.4.0 | Excellent / Caution | legacy Dusk widgets that cannot be expressed declaratively |
| `obsidian-style-settings` | 1.0.9 | 0.11.5 | Good / Satisfactory | Dusk visual controls |
| `note-toolbar` | 1.34.11 | 1.11.0 | Excellent / Satisfactory | compact dashboard and mobile actions |
| `lazy-plugins` | 1.0.24 | 1.6.0 | Excellent / Passed | measured delay for optional plugins only |
| `tabs` | 1.2.1 | 1.8.7 | scorecard not surfaced | Dusk tabbed desktop sections |
| `editing-toolbar` | 4.0.11 | 0.14.0 | Excellent / Risks | touch-friendly editing controls |
| `omnisearch` | 1.29.3 | 1.7.2 | Excellent / Satisfactory | fast full-vault search |
| `iconic` | 1.1.10 | 1.12.0 | Excellent / Caution | Dusk navigation and folder icon treatment |

All manifests declare `isDesktopOnly: false`. That declaration does not prove
feature parity. Current open reports include incomplete Datacore rendering on
iOS, Templater startup failure on iPhone/iPad, JS Engine imports failing on
mobile, Lazy Loader applying desktop configuration on mobile, and Tabs cutting
off a grouped Base on mobile. Desktop keeps rich surfaces; mobile companion
notes avoid Datacore, JS Engine, Tabs, and delayed startup until physical
Android testing.

The following legacy dependencies are not retained:

- BRAT: manual release pinning avoids an updater for one beta dependency.
- Natural Language Dates: absent from the current community registry, and
  display formatting does not require it.
- Force View Mode and hotkeys-for-files: Homepage, Note Toolbar, and native
  commands cover the selected behavior.
- Hider, status-bar organizer, and settings search: core settings and CSS cover
  the visible result.
- Todoist, Custom Frames, Projects, Pomodoro, Charts View, and password
  protection: no selected local-first Dusk surface requires them.

## First dependency launch

All 18 enabled plugins, including the four pre-existing plugins, appeared in
both Obsidian's enabled and loaded plugin registries after one clean launch.
The active file remained `HUB/Home.md`. FNS configuration SHA-256 remained
`1FB34C99B1CB13992BD2AE23D789B6E2C3D90559615AE8B2694D336F1F789DAB`.
No Fast Note Sync file was overwritten.

## Deployed Dusk shell and surfaces

The live vault now uses Minimal dark mode, accent `#ba4949`, colorful headings,
full-width media, hidden ribbon, and the selected Dusk callout, multi-column,
wide-view, gallery, Datacore, and file-wrap snippets. Repository-owned
`dashboard.css` supplies the dark hero, button grid, progress bar, responsive
layout, and plugin-off fallback.

The repository initializer is deliberately not a full Dusk installer. It
reproduces the portable folder, Home, Base, template, mobile-companion, CSS,
and operating-guide layer without copying third-party components or
machine-local `.obsidian` state. The deployed rich layer is recoverable from
FNS Configuration Sync and the verified external vault checkpoint. Exact
source commits, versions, adapted paths, hashes, tests, and rollback boundaries
are recorded here so this distinction cannot be mistaken for repository
reproducibility.

| Live file | Bytes | Adapted SHA-256 |
|---|---:|---|
| `HUB/Home.md` | 2,630 | `8CB2540A58E1E94AB576353D00ACE95F00303E0CC17DBA8407F2448BB1989850` |
| `HUB/Map of Content.md` | 269,634 | `28A15D7653031FF56C2D971F09FFB096394F30E9976F685B923C422EF7C3AC0D` |
| `HUB/Mail Box.md` | 17,356 | `3E0A262666EDB599B62C615637C22AE86F2BD6EE2F199E960BA941236AAEB6E4` |
| `HUB/Priority Matrix.md` | 11,073 | `481C01578CF1F5CC17DACE0788B85E288A25E339A5AC77CB9838F1C10E0386E8` |
| `SYSTEM/Components/Dusk/MapOfContent/map_of_content_data.json` | 2,198 | `733AB28413315A07FC00A533C7DB4A94145A69AE9261472C12424EA107433187` |
| `SYSTEM/Components/Dusk/PriorityMatrix/PriorityMatrix.jsx` | 292,273 | `66613B9D2F9A832DFC4EE4B68A254B4F498B7CBE8A4C902AA95E487B54AA8C5B` |
| `SYSTEM/Components/Dusk/PriorityMatrix/priority_matrix_data.json` | 3,222 | `DE1AE02DF5A598B17B9B20FD8E769209B9FB35A48BC51D90BF333BAEFBD17C7E` |
| `SYSTEM/Components/Dusk/DynamicForm/DynamicFormScript.js` | 80,383 | `D19F933F76A6CA5DFE1BCB90FD3A792977934DB1B86C5E309F6E3E99C2B2D33C` |
| `SYSTEM/Components/Dusk/DynamicForm/dynamic_form_config.json` | 1,558 | `16F04E7D215B54161FB719F6BC3C5B689758732F0466BCA7B37A3F21AF624A72` |

Adaptations are narrow:

- current Map configuration moved under `SYSTEM/Components/Dusk`;
- current Priority Matrix component and state moved under the same boundary;
- user-visible component dates use `en-GB` or `dd/MM/yyyy`;
- MOC still includes Notion but excludes SYSTEM, HUB, and DAILY;
- Priority Matrix excludes SYSTEM, HUB, Notion, and archive;
- Priority Matrix displays due dates as `dd/mm/yyyy` but writes its typed
  `due_date` property as ISO;
- Mail Box queries the two active agent-review folders plus explicit
  `page_task: true` notes, and never treats review links as approval;
- empty Mail Box pagination clamps one page instead of displaying page zero;
- Todoist, Custom Frames, password state, and sample notes remain absent.

Three repository-owned mobile companions use Markdown, Tasks, Dataview, and
Bases instead of Datacore, JS Engine, or Tabs:

- `SYSTEM/Mobile Hub/Mobile Home.md`;
- `SYSTEM/Mobile Hub/Mobile Map of Content.md`;
- `SYSTEM/Mobile Hub/Mobile Mail Box.md`.

## Surface runtime observations

Windows rendered all selected surfaces in Reading view:

- Home showed dark Dusk shell, two command buttons, five open tasks, review
  Base, tabbed project/area/learning Bases, and `24/07/2026` day progress;
- Map of Content rendered the current configurable explorer with 164 indexed
  items and no visible error;
- Priority Matrix loaded its external component and four live quadrants with no
  visible error;
- Mail Box rendered filters, `DD/MM/YYYY` input, and correct empty state;
- Project and Area templates rendered Meta Bind controls and contextual
  Dataview tables;
- all three mobile companions rendered at desktop width with no visible error.

DataviewJS is enabled for Dusk-owned dashboard code; inline DataviewJS remains
disabled. This is an intentional code-execution boundary. Do not execute
unreviewed DataviewJS copied into imported or downloaded notes.

Two pre-existing Canvas files contained only `{}`. Datacore consistently
reported `nodes is not iterable`. Their paths were preserved and content was
repaired to the valid empty Canvas shape `{"nodes":[],"edges":[]}`; clean
startup then showed no Canvas or Datacore error.

## Action layer and optional startup

QuickAdd contains two bounded choices:

- `Capture unsorted note` creates from `SYSTEM/Templates/Unsorted.md` under
  `STAGING/Unsorted` and increments filename collisions;
- `Dynamic Form` executes only the reviewed copy under
  `SYSTEM/Components/Dusk/DynamicForm`.

Dynamic Form received narrow path guards before execution. Configuration stays
inside its component directory. New notes can target only the seven accepted
capture and knowledge roots. Titles reject traversal, separators, dot
segments, and invalid Windows filename characters. Static inspection found no
network, shell, delete, rename, or external-provider call. Runtime tests:

- created a synthetic note in `STAGING/Unsorted`;
- rejected `../escape-attempt` with an invalid-path message;
- created no file outside the allowed root;
- removed the exact synthetic note afterward.

Note Toolbar now provides one floating `dusk_nav` menu on Markdown notes:
Home, Map, Mail, Matrix, Today, Capture, and Search. Home, Daily Notes,
QuickAdd, and Omnisearch command IDs all exist. The Map file action opened
`HUB/Map of Content.md` in a new tab. This replaces Dusk's large toolbar
configuration and its missing Hider and per-file-hotkey dependencies.

Lazy Loader remains because optional plugins now exist. Critical plugins,
including FNS, Homepage, Custom Sort, Datacore, Dataview, Tasks, QuickAdd,
Meta Bind, JS Engine, Tabs, theme controls, and Note Toolbar remain immediate.
Editing Toolbar loads after five seconds. Iconic and Omnisearch load after
fifteen seconds. A clean launch kept Home and FNS available immediately; all
three delayed instances reported loaded after their windows, and the rendered
workspace showed no component error.

Lazy Loader removes delayed IDs from Obsidian's persisted enabled set while
loading their plugin instances itself. Therefore the final
`community-plugins.json` contains 15 immediate IDs, while runtime inspection
reports 18 loaded instances.

Habit Streak RPG stopped at isolated preflight and was not deployed. Static
inspection found no network, shell, delete, or rename call, but the captured
release is explicitly discontinued and stores custom category state in
device-local `window.localStorage`. That prevents FNS from providing the same
state on Windows and Android. Adding a known-divergent game subsystem would
reduce, not improve, the requested seamless workflow. No maintained
like-for-like replacement was added.

Priority Matrix received a synthetic interaction test. A note with
`eisenhower_status: urgent_important` appeared in Do First with
`25/07/2026`, then drag to Schedule wrote
`eisenhower_status: not_urgent_important` while retaining the ISO
`due_date: 2026-07-25`. The exact synthetic note was removed.

## Final Windows integrity and startup

The final Notion tree still matches the pre-rich manifest:

- current files: 164;
- current bytes: 1,095,099;
- differing path, length, or SHA-256 rows: 0.

FNS secret-bearing configuration SHA-256 remains
`1FB34C99B1CB13992BD2AE23D789B6E2C3D90559615AE8B2694D336F1F789DAB`.
The final runtime reported `Sync Complete (Incremental)`. No secret value was
printed.

Launch-to-main-window results after action and loader configuration:

| Trial | Milliseconds |
|---|---:|
| 1 | 916 |
| 2 | 824 |
| 3 | 847 |

Median: 847 ms. Mean: 862 ms. This remains a narrow launch metric, not a claim
about Android or background index completion. Final Home opened in Reading
view with both sidebars collapsed, floating action menu present, all delayed
plugins loaded, and no visible component error.

Final live matrix reopened Home, Map of Content, Mail Box, Priority Matrix,
all three mobile companions, Project template, and Area template in Reading
view. Each expected surface marker rendered, each had one floating action
button, and none exposed a Datacore, Dataview, render, or Obsidian error view.
Virtualized file-tree inspection across the complete scroll range retained:
`HUB`, `STAGING`, `DAILY`, `PARA`, `ZETA`, `Notion`, `SYSTEM`.

Repository verification:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Results: 236 local links across 82 root-reachable Markdown files, link-checker
tests passed, initializer tests passed, 101 tracked files passed filename-only
secret scanning, nine Mermaid diagrams rendered, and whitespace check passed.

## Rejected source behavior

- wholesale `.obsidian` copy;
- Todoist integration;
- password-protection state;
- Custom Frames network surfaces;
- Dusk sample or dummy notes;
- private workspace and hotkey state;
- slash-formatted date filenames;
- discontinued Habit Streak RPG state that cannot sync through FNS;
- NotebookLM recommendation to move Notion or add another FNS instance.

## Next gate

Run repository verification and independent final review. Physical Android
surface testing and the four-week human-use gate remain user work after merge.
