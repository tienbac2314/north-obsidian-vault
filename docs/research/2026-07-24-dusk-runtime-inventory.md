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

## Rejected source behavior

- wholesale `.obsidian` copy;
- Todoist integration;
- password-protection state;
- Custom Frames network surfaces;
- Dusk sample or dummy notes;
- private workspace and hotkey state;
- slash-formatted date filenames;
- NotebookLM recommendation to move Notion or add another FNS instance.

## Next gate

Recreate the dark visual shell and four Dusk surfaces, then validate each
component in the loaded Windows runtime. Lazy loading remains disabled until
the immediate runtime works.
