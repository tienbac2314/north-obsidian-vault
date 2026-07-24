# Dusk Windows and physical-Android runtime evidence

Date: 2026-07-25

Status: corrected Goal 1 disposable-runtime evidence. No live-vault
promotion.

## Safety correction and evidence classes

Independent review found that the initial runtime copies accidentally
contained 31 source community-plugin `data.json` files. Those copies and all
observations that depended on their settings are quarantined. They are not
credential-safe promotion evidence.

The corrected rerun used fresh copies under:

```text
G:\Dusk-Goal1-Discovery-20260725\safe-rerun
```

The copy rule excluded:

- every community-plugin `data.json`;
- `.obsidian/todoist-token`;
- every path segment named for a password, token, secret, credential, API key,
  or authentication;
- the password-protection plugin directory;
- source plugin configuration without a documented safe-field allowlist.

The rerun also disabled Obsidian Sync and Publish and removed BRAT, Custom
Frames, and Todoist from `community-plugins.json`. Plugin binaries remained
for inventory and compatible-update comparison, but those three plugins never
loaded. FNS and other external writers were absent.

The unsafe Android copy was force-stopped and its exact 377-file disposable
path was removed. It is reproducible from the source and checkpoints. The PC
source, tablet source, and `G:\Obsidian` were not runtime targets.

## Corrected checkpoints

Canonical digests hash sorted
`relative-path|length|file-sha256` rows:

| Checkpoint | Files | Bytes | Canonical SHA-256 |
|---|---:|---:|---|
| Windows/Android light before open | 343 | 35,877,951 | `84D72EA0BD862BB243F4906D0AF2A035FB726301F3AD70C72AEC056E3584EEB0` |
| Windows/Android full before open | 371 | 42,331,891 | `845E7A002DDB6577DC49ECDF948E254B76389744D87028533C9558B17450B115` |
| Windows light after updates | 363 | 36,242,214 | `FFD74F44076E2505B2C329F4806A53D8DF427E75D0D43906F41173733183BB55` |
| Windows full after updates | 391 | 44,255,097 | `A22586B90C50C0887DB876D0D9F668043D4322CBB06BB18ACCCB79147ABE95D8` |

Before open, metadata checks found zero excluded `data.json`, zero
`todoist-token`, zero risky-name hits, zero blocked plugins enabled, and Sync
and Publish both off. Desktop and Android staging had exact hash equality.
Four immutable pre-open archives remain outside Git.

Runtime created 18 fresh default `data.json` files per Windows copy and 17 per
Android copy. No credentials or provider settings were entered. These new
defaults were not copied across platforms and their contents were not used as
source configuration evidence.

## Windows first-open and update timeline

Environment:

- Obsidian 1.12.7;
- 1024 by 800 captured window;
- exact disposable targets `Dusk_light` and `Dusk`;
- global Obsidian registry restored byte-for-byte after testing at SHA-256
  `B8F2DB0F6C68F065E1853DEAAE885EC18CEA70ED9DAAEC1BDF931A25E9C88D40`.

Observed timeline:

1. Both variants presented `Do you trust the author of this vault?`.
2. After trust, light loaded 42 of 43 enabled plugins and full loaded 43 of
   44. Commander 0.5.2 was the missing plugin in both.
3. Excalidraw opened its welcome screen. Source workspace state opened
   Community Plugins settings.
4. Update check found 34 of 47 installed plugins in light and 44 of 57 in
   full.
5. The official settings surface exposed only `Update all`; dependency-sized
   update groups were not available in this bounded flow.
6. Excalidraw release notes interrupted each update batch. Editing Toolbar
   4.0.11 opened `Enable AI Editor`; the test selected `Not now`.
7. Update checks then reached zero. Exact installed manifest versions matched
   across Windows and Android for all 47 light and 57 full plugins.
8. Reload loaded all 43 safe-enabled light plugins and all 44 safe-enabled
   full plugins. Full reached 44 loaded plugins in a four-second polling upper
   bound.

Journals 2.1.10 did **not** show a migration prompt in the corrected copies.
The earlier migration was driven by copied source plugin configuration and is
quarantined. Goal 1 therefore does not prove a safe Journals v1-to-v2
configuration migration.

### Windows errors

Light reload reproduced:

```text
Error: Could not find file explorer leaf.
TypeError: Cannot read properties of null (reading 'parentNode')
```

The first error came from Novel Word Count when the restored workspace lacked
a file-explorer leaf. The second arose while Settings Search inspected
Highlightr settings. Full reload reproduced the Novel Word Count error; the
Highlightr interaction appeared when the settings index was built.

## Physical Android timeline

Environment:

- one authorized physical device;
- Android 14;
- 1200 by 2000 pixels at 240 dpi;
- Obsidian package `md.obsidian`, version 1.12.7, version code 303;
- corrected disposable root
  `/sdcard/Documents/Dusk-Goal1-Safe-Rerun`;
- original tablet source
  `/sdcard/Documents/dusk-obsidian-vault-master`.

ADB push produced 343 light and 371 full files. Complete pre-open SHA-256
multisets matched PC staging with zero differences.

For both variants:

1. Android's system picker granted access only to the selected corrected
   disposable.
2. The trust sheet appeared.
3. Commander 0.5.2 remained disabled. The initial light run had already
   captured Obsidian's exact warning that this version was reported to cause
   issues.
4. Community Plugins reported 34 light or 44 full compatible updates.
5. Update progress, Excalidraw welcome/release notes, and Editing Toolbar AI
   consent appeared. AI remained off.
6. No Journals migration appeared.
7. Post-update plugin-manifest hashes matched the corresponding Windows copy
   exactly: 47 of 47 for light and 57 of 57 for full.

The corrected light cold-start probe was not usable at 5.7 seconds and was
usable by 10.7 seconds. Full Dusk showed `Loading plugins...` near 11.7
seconds and was usable by about 19.7 seconds. Neither corrected run reached
the recovery screen. Repeated Mali `BAD ALLOC` messages remained, with no
captured Java crash, ANR, SIGSEGV, or plugin exception. Full Dusk used about
165.6 MiB PSS and 343.8 MiB RSS after load.

Five seconds in the background preserved the same PID. Resume returned the
same visible vault. Forced landscape rendered Home at 2000 by 1200, then the
original auto-rotation settings were restored.

## Corrected surface result

Paired Windows screenshots cover Home, Map of Content, Mail Box, project,
area, daily, weekly, monthly, Getting Started, and a project template for
both variants. Android light screenshots cover the same ten surfaces.
Android full screenshots cover Home, Map of Content, a project, and monthly
notes. Corrected light evidence also pairs portrait and landscape captures for
Home, Map of Content, Mail Box, project, area, daily, weekly, monthly, Getting
Started, and a source template.

The corrected copies exposed a material dependency:

```text
Dataview JS queries are disabled. You can enable them in the Dataview settings.
```

Home and dependent dashboards therefore did not reproduce their configured
interactive behavior after source `data.json` was excluded. The notes,
navigation, theme, CSS, and static structures rendered, but that is not
equivalent to a functioning Dusk dashboard. Goal 2 must rebuild the minimum
required setting through an explicit safe-field allowlist, or replace the
surface, then test the empty base itself on Windows and Android.

Independent visual QA marked the corrected dynamic surfaces **BLOCK**:

- light Home displayed navigation pills but both task cards showed the
  disabled-Dataview notice;
- full Home also exposed raw `BUTTON[...]` tokens and fenced Datacore code;
- both Map variants displayed DatacoreJS source instead of a map;
- light Mail Box displayed DatacoreJS source instead of an inbox;
- Daily, Weekly, and Monthly retained readable static content but lost their
  dynamic overview;
- landscape added no major new overflow; Home still clipped one tab label to
  `Comp...`, while other visible static content fit or required normal vertical
  scrolling;
- the desktop Home, Map, and Mail Box captures showed the same failures with
  severe narrow-pane wrapping.

Static project and area fields, Getting Started, and template-source views
remained readable. Raw Templater source in the template is expected for a
source template and does not prove execution. Screenshots cannot establish
touch behavior or that any particular restored setting would recover the
dynamic UI.

The populated variant's plugin binaries, manifests, non-sensitive settings,
CSS, templates, and note structure can inform `Dusk_light_empty`. Source
plugin `data.json` and populated runtime success do not transfer by
assumption.

## Mixed English and Vietnamese probe

A synthetic note was created only inside corrected full Dusk, then removed
while Obsidian was stopped. It used English machine-facing fields, an ISO
stored date, and Vietnamese filename, heading, and prose.

Observed:

- filename, heading, body, and diacritics rendered correctly;
- `source_date: 2026-07-25` displayed as `07/25/2026`;
- core search returned zero captured results for `Tiếng`, despite the visible
  new note.

The note was created through an Obsidian URI, so external-notification,
save/index timing, and URI behavior remain confounders. This does not prove a
Vietnamese tokenizer defect. Goal 2 must repeat normal in-app typing, save,
and search with the selected base.

## Popup and newly discovered feature catalog

| Surface | Introduces | Corrected disposition |
|---|---|---|
| Vault trust | Community-code execution boundary | Trusted only corrected disposable |
| Commander block | Obsidian community safety block for 0.5.2 | Removed by compatible 0.5.7 update |
| Excalidraw welcome/release notes | Drawing feature tour and release details | Observed and closed |
| Community update count | 34 light or 44 full compatible packages | Recorded, then applied |
| Enable AI Editor | Provider-backed rewrite and generation | `Not now`; no provider or key |
| Note Toolbar help | Updated toolbar examples and behavior | Observed during update |
| DataviewJS disabled message | Missing safe configuration dependency | Promotion blocker |
| Journals migration | Only appeared in unsafe-copy evidence | Withdrawn; safe migration unknown |

## Failure catalog

| ID | Platform | Evidence | Disposition |
|---|---|---|---|
| RT-01 | Windows | Commander 0.5.2 skipped on both first starts | Update to 0.5.7 before testing |
| RT-02 | Android | Commander 0.5.2 blocked by Obsidian | Same |
| RT-03 | Windows | Highlightr/Settings Search `parentNode` error | Isolate in Goal 2 |
| RT-04 | Windows | Novel Word Count missing file-explorer leaf | Do not depend on minimal/mobile workspace |
| RT-05 | Both | Safe copies lose DataviewJS-enabled behavior | Explicit safe-field rebuild required |
| RT-06 | Android | Full cold start usable only by about 19.7 seconds | Unchanged full stack is a blocker |
| RT-07 | Android/GSI | Repeated Mali `BAD ALLOC`, no crash/ANR | Device/ROM risk; retest target device |
| RT-08 | Android | URI-created Vietnamese note absent from captured search | Repeat normal in-app create/save/search |
| RT-09 | Process | Initial copies included 31 source plugin `data.json` files | Quarantined; corrected rerun supersedes |

## Desktop/mobile compatibility matrix

| Surface or capability | Windows | Physical Android | Assessment |
|---|---|---|---|
| Trust / Restricted Mode | Complete dialog | Complete sheet | Acceptable |
| Plugin update parity | 34 light / 44 full | Exact manifest-hash parity | Reproducible |
| Commander | Skipped at 0.5.2 | Explicitly blocked at 0.5.2 | Update first |
| Static note/theme shell | Rendered | Rendered | Candidate |
| DataviewJS dashboards | Disabled without source config | Disabled without source config | Blocker |
| Full Dusk cold start | Four-second plugin-load upper bound | About 19.7-second usable upper bound | Mobile blocker |
| Light cold start | All 43 loaded after reload | About 10.7-second usable upper bound | Needs reduction |
| Rotation | Paired screenshots | 2000 by 1200 Home capture | Acceptable defect level |
| Background/resume | Not applicable | Same PID after five seconds | Passed short probe |
| Mixed language display | Unicode-safe files | Unicode-safe visible note | Candidate |
| Mixed language search | Not repeated | Zero result with URI confounder | Unknown |
| Quick Explorer / Status Bar Organizer | Desktop-only manifests | Not loadable by design | Never mobile dependency |

## AI and network boundary

Editing Toolbar can send selected note content and prompts to PKMer-managed AI
or a configured OpenAI-compatible provider. Current Obsidian supports secret
storage for keys, but provider retention and uninstall cleanup remain separate
unknowns. Goal 1 did not enable AI, sign in, enter a key, send note content,
or configure a local endpoint.

Todoist, Custom Frames, BRAT, Digital Garden, Share Note, Meld Encrypt,
DataviewJS, Datacore, JS Engine, QuickAdd, Templater, and Meta Bind retain
their documented network, credential, executable-note, or write boundaries.
Presence of plugin binaries is not permission to enable them.

## Mobile blockers versus acceptable defects

Blockers before unchanged-stack promotion:

- configured dashboards depend on excluded source plugin settings;
- full Dusk cold start approached 20 seconds;
- executable-note and write workflows remain untested;
- Commander requires update before first useful mobile load;
- Settings Search/Highlightr and Novel Word Count failures remain;
- mixed-language search remains unresolved;
- desktop-only navigation cannot be structural.

Acceptable discovery-stage defects:

- scroll-dependent settings and narrow tables;
- static content wrapping on Map, Daily, and Monthly;
- one-time trust, Excalidraw, Note Toolbar, and AI consent surfaces when
  documented;
- English UI with Vietnamese content rendering.

## Runtime conclusion

Corrected evidence rejects whole-vault configuration import. It supports a
smaller Goal 2 experiment based on an empty light copy, but only after that
copy is sanitized and tested directly. Required plugin settings must be
rebuilt field by field from documented non-secret values; no source
`data.json` should be copied wholesale.
