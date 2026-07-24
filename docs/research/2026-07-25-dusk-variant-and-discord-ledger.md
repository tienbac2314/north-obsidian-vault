# Dusk variants and Discord additions

Date: 2026-07-25

Status: Goal 1 source inventory. No item is approved for promotion.

## Variant model

All four variants come from the sole source authority:

```text
C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master
```

| Variant | Total files | Markdown | Installed plugins | Source-enabled plugins | Safe-manifest SHA-256 |
|---|---:|---:|---:|---:|---|
| `Dusk` | 409 | 94 | 58 | 47 | `91CED3ED...E2AB4B` |
| `Dusk_empty` | 352 | 37 | 58 | 47 | `CAECEB59...DBC28` |
| `Dusk_light` | 378 | 94 | 47 | 46 | `C03D3D38...8264A` |
| `Dusk_light_empty` | 321 | 37 | 47 | 46 | `DFB98C64...A056980` |

`empty` means 57 demonstration Markdown files are absent. Safe
`.obsidian` payloads, excluding all plugin `data.json` and other sensitive
configuration, match their populated counterpart byte-for-byte except
`workspace.json`, which necessarily points at a different open-note state.
Empty variants therefore do not represent a smaller plugin-binary footprint.
This comparison does not prove equivalent configured behavior.

`Dusk` and `Dusk_light` otherwise share the populated note tree. Their safe
path-set difference is the full variant's extra plugin payloads and one
light-only onboarding image. Choice of populated versus empty is a content
seed decision; choice of full versus light is a plugin-footprint decision.

## Dusk additions over Dusk_light

Only Charts View was source-enabled among these additions. All other
inspectable additions were disabled. The `password-protection` directory was
not opened or copied because its path falls under the password/credential
exclusion.

| Plugin | Source -> tested | State | Adds | Boundary and Goal 2 disposition |
|---|---:|---|---|---|
| [`advanced-canvas`](https://github.com/developer-mike/obsidian-advanced-canvas) | 3.2.0 -> 6.5.0 | off | More Canvas node/edge behavior | Canvas-file writes and large major-version jump; defer |
| [`darlal-switcher-plus`](https://github.com/darlal/obsidian-switcher-plus) | 4.6.2 -> 6.1.5 | off | Extended quick switcher | Index/navigation surface; compare with core switcher |
| [`digitalgarden`](https://github.com/oleeskild/obsidian-digital-garden) | 2.57.2 -> 2.80.3 | off | Publishes selected notes as a website | Network, credentials, repository writes, note egress; keep off |
| [`meld-encrypt`](https://github.com/meld-cp/obsidian-encrypt) | 2.3.7 -> 2.4.5 | off | Encrypts note content | Key-loss and destructive content-rewrite boundary; defer |
| [`obsidian-chartsview-plugin`](https://github.com/caronchen/obsidian-chartsview-plugin) | 1.2.7 -> 1.2.8 | on | Renders charts from note data | Executes chart/query rendering; optional |
| [`obsidian-day-planner`](https://github.com/ivan-lednev/obsidian-day-planner) | 0.25.0 -> 0.33.0 | off | Timeline/day planning | Reads and rewrites task/time metadata; possible duplicate of Journals/Tasks |
| [`obsidian-image-toolkit`](https://github.com/obsidian-community/obsidian-image-toolkit) | 1.4.2 -> 1.4.3 | off | Image viewing/edit controls | Current manifest is desktop-only; mobile cannot depend on it |
| [`remember-cursor-position`](https://github.com/dy-sh/obsidian-remember-cursor-position) | 1.0.9 -> 1.0.13 | off | Restores per-note cursor/scroll position | Local state; optional |
| [`share-note`](https://github.com/alangrainger/share-note) | 0.8.17 -> 1.5.5 | off | Publishes a shareable note | Network, credentials, note-content egress; keep off |
| [`table-editor-obsidian`](https://github.com/tgrosinger/advanced-tables-obsidian) | 0.22.1 -> 0.23.2 | off | Markdown table editing | Rewrites table text; optional |
| `password-protection` | uninspected | off | Unknown source-bundle protection feature | Excluded by secret policy; do not evaluate until code/config can be isolated safely |

The full Dusk update check found 44 of 57 updates: the same 34 as light plus
the ten inspectable additions above. Corrected post-update cold reload loaded
all 44 source-safe enabled plugins. Excluded source plugin configuration left
dynamic Home, Map of Content, and Mail Box behavior nonfunctional. The result
proves only that plugin binaries can start from fresh defaults; it does not
justify importing eleven extra plugins or transfer behavior to either empty
variant.

## `new from discord` ledger

The directory has 91 safe files and 2,497,754 safe bytes at manifest
`2BFB8BB1...4DE70B`. It is an update/drop folder, not automatically integrated
configuration. None of these items exists as an active feature merely because
it is present beside the vaults.

| Component | Files and role | Dependencies / instructions | Existing overlap | Boundary and status |
|---|---|---|---|---|
| Dynamic Form | `DynamicFormScript.js`, identified in the supplied notes as version 1.0.0 by DuskWasHere | QuickAdd macro named by the user; optional Note Toolbar/FAB trigger; configurable template and destination paths | Dusk already has QuickAdd, Note Toolbar, Templater, and templates, but no integrated script | Calls `app.vault.adapter`, creates folders and notes, and accepts configurable paths. Working shape is plausible; mobile and rollback unproved. Defer |
| Priority Matrix full | `PriorityMatrix/` with JSX, JSON configuration, nine dummy notes, and a dashboard note | Datacore React rendering; exact property names and configured folder paths | Not integrated in tested Dusk | Executable JSX reads and modifies/creates notes through the vault API. Configuration paths and English property names are schema contracts. Defer |
| Priority Matrix light | `PriorityMatrixLight/` parallel JSX/JSON/demo bundle | Datacore React rendering | Duplicates full matrix concept with lighter UI | Same executable/write boundary; choose neither until desired task schema is known |
| Priority Matrix Git copy | `Priority_Matrix-main_fromgit/`, README, license, screenshots, snippets, JSX, JSON, and demo data | Public source points to [DuskWasHere/Priority_Matrix](https://github.com/DuskWasHere/Priority_Matrix); README requires Datacore | Richest and best-documented of three copies; supersedes local loose copies as reference, not as authority | Public provenance and MIT license are useful. Current commit/version and Android behavior remain unproved |
| Habit Streak RPG | Orchestrator, 18 UI components, 20 logic modules, six default JSON files, and `HabitStreakRPG.md` | Datacore `dc.require`, exact relative folder layout, global `window.HabitStreakRPG` | No tested Dusk equivalent | Large executable game/state subsystem with broad local data writes and high maintenance surface. Supplied context says discontinued; no public-current release verified. Remove from near-term scope |
| Map of Content update | `MapofContent/Map of Content.md` and `map_of_content_data.json` | Datacore/configured paths | Both Dusk variants already contain desktop and mobile Map of Content notes | Possible replacement, not additive feature. Requires structural diff and runtime trial before use |
| Styling | Root `base.css` and Git-copy `snippets/base.css` | Dusk theme/snippet conventions | Existing Minimal theme, Style Settings, icons, and snippets already style dashboards | Global CSS can hide, resize, or break controls across desktop/mobile. Treat as component-coupled code |
| Discord notes | `note from discord.txt` | Human setup transcript for Priority Matrix and Dynamic Form | Documentation only | Useful provenance, but Discord text is anecdotal and non-authoritative |

## Older-zip patch folder

`if you have the older zip file just update these` contains six note/template
files: desktop and mobile Mail Box plus area, area-note, area-subnote, and
monthly-note templates. It has no invocation metadata or automatic installer.
Treat each as a candidate replacement requiring a content diff against the
selected base, not as a patch to apply wholesale.

## Machine-facing contracts found

- Datacore and Dataview expressions depend on exact paths, property names, and
  case.
- Priority Matrix and Dynamic Form destination paths are configurable but
  become write boundaries.
- Habit Streak RPG depends on its complete relative folder layout and global
  JavaScript state.
- Translating visible headings is lower risk than translating property keys,
  query fields, script constants, template filenames, or configured paths.
- Demo notes prove examples and layout; they are not required user content.
