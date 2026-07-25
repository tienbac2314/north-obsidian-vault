# Dusk plugin functional revalidation

Date: 2026-07-25

Status: incomplete. Independent re-review failed; PR #7 remains draft.

This file is current functional evidence authority. It owns workflow findings,
user corrections, write-path mapping, and raw evidence locations. The
[runtime report](2026-07-25-dusk-runtime-evidence.md) retains startup chronology;
the [review](2026-07-25-dusk-goal1-review.md) retains release verdict.

## TL;DR

- Earlier Android and Windows dashboard failures were misclassified because
  screenshots were taken in editing mode. Reading view renders Datacore Map of
  Content and Mail Box correctly on both platforms.
- The Dataview warning was real. Fresh defaults disabled JavaScript queries.
  Enabling only `enableDataviewJs` and `enableInlineDataviewJs` restored the
  tested Dataview surfaces without copying source plugin configuration.
- After compatible updates, every tested non-network plugin loaded:

| Variant | Windows | Physical Android |
|---|---:|---:|
| `Dusk_light` | 44 of 44 | 42 of 42 |
| `Dusk` | 52 of 52 | 49 of 49 |

- Android excludes Quick Explorer and Status Bar Organizer by manifest. Full
  Dusk also excludes Image Toolkit. These are desktop-only, not failed mobile
  plugins.
- Network and credential plugins load, but remain separate gates. Digital
  Garden contacted GitHub endpoints, Custom Frames contacted `ellpeck.de`, and
  Todoist opened an API-token setup dialog.
- Both Android variants passed cold-restart persistence with all selected
  plugins loaded and Dataview JavaScript settings retained.
- Plugin-load and basic reading-render evidence passed, but expanded workflow
  and visual review found release blockers. Goal 2 personalization is not
  cleared, and this result does not authorize changes to `G:\Obsidian`.

## Why the prior result changed

The prior test interpreted visible Markdown and Datacore source as failed
rendering. Obsidian was in editing mode. Editing mode is expected to show
source. Repeating each test after selecting the visible `Current view:
editing` control produced the intended rendered surface.

The prior Dataview warning had a different cause. Fresh Dataview defaults
stored both JavaScript-query flags as false. The functional rerun enabled only
those two booleans through Dataview's settings API. No source `data.json` was
copied.

This separates two findings:

1. Datacore was functioning; test mode was wrong.
2. Dataview JavaScript queries required a small explicit safe-field repair.

## Safety and test targets

Only disposable clones were changed:

```text
G:\Dusk-Goal1-Discovery-20260725\functional-rerun\desktop-vaults
/sdcard/Documents/Dusk-Goal1-Functional-Rerun-20260725
```

The user's edited Android `Dusk_light` was archived before cloning. Its
pre-clone archive SHA-256 is
`75D6D9A53C55164E9805A488392DA511EFE545469297F1AB8EE3A39808558896`.
Clone manifests matched their sources exactly before functional changes.

No risky credential-name path existed in any functional clone. No credential,
provider key, sync enrollment, publish action, share action, or Todoist token
was entered.

The PC source, tablet source, and `G:\Obsidian` were not modified. The desktop
Obsidian registry remained at SHA-256
`B8F2DB0F6C68F065E1853DEAAE885EC18CEA70ED9DAAEC1BDF931A25E9C88D40`.
Android was returned to the user's original `Dusk_light`, which again loaded
45 of 45 enabled plugins with both Dataview JavaScript flags true.

## Plugin classification and final baselines

Installed plugins were classified before enablement:

| Variant | Installed | Local/mobile-compatible | Desktop-only | Network or credential |
|---|---:|---:|---:|---:|
| Light | 47 | 42 | 2 | 3 |
| Full | 57 | 49 | 3 | 5 |

Windows baselines include desktop-only plugins and exclude network or
credential plugins. Android baselines exclude both categories.

| Platform and variant | Enabled after repair | Loaded | Restart result |
|---|---:|---:|---|
| Windows light | 44 | 44 | 44 of 44 |
| Windows full | 52 | 52 | 52 of 52 |
| Android light | 42 | 42 | 42 of 42 |
| Android full | 49 | 49 | 49 of 49 |

The user's Android light state before cloning also proved that all 45
mobile-compatible plugins, including the three gated plugins, can load. The
functional baseline turns those three off because capability is not consent to
network or credential use.

Editing Toolbar remained usable with its AI feature off.

## Initial reading-view results

Ten surfaces were opened in reading view on Windows and Android for both
variants:

1. Home
2. Map of Content
3. Mail Box
4. project
5. area
6. daily
7. weekly
8. monthly
9. Getting Started
10. project template

All 40 variant/platform checks reached reading mode. No tested surface showed
the Dataview-JavaScript-disabled message, raw Datacore fence, or missing-button
error. These checks prove that the surfaces can render. They do not prove
visual quality, navigation, write behavior, or workflow usability.

Observed functional results:

- Home rendered navigation, task, calendar, and recent-file output.
- Map of Content rendered searchable and paginated Datacore rows.
- Mail Box rendered inbox rows and filters.
- project and area views rendered fields and dependent tables.
- daily, weekly, and monthly views rendered dynamic task/calendar output.
- Getting Started rendered normally.
- the project template source rendered its configured reading view; template
  application was tested later.

The daily fixture still reports `Note is not connected to a journal`. That is
a Journals configuration gap, not a Dataview or Datacore failure.

## Expanded workflow and visual review

The expanded review used direct Computer Use against this exact disposable:

```text
G:\Dusk-Goal1-Discovery-20260725\workflow-rerun\desktop-vaults\Dusk_light_workflow_pc
```

The Obsidian window was maximized to 1920 by 1040 before judging or capturing
each final state. Earlier 1024 by 800 Windows screenshots remain diagnostic
evidence only; they are not valid desktop-usability evidence. Both sidebars
were left open to exercise the imported workspace.

Every note opened in editing mode after navigation, even when the prior note
was in reading mode. The title and outline could update before the center pane,
and some dynamic content needed about five seconds to settle. Each valid
capture therefore required:

1. verify the exact disposable window and 1920 by 1040 size;
2. open the target;
3. wait for its content;
4. switch explicitly from editing to reading mode;
5. wait again before judging or saving the screenshot.

Observed results:

| Check | Result |
|---|---|
| Files sidebar | Passed; tree navigation worked |
| Recent Files sidebar | Passed; recent-note list rendered |
| Search sidebar | Passed; query and options rendered |
| Bookmarks sidebar | Opened successfully; empty state only |
| Home ribbon action | Failed to navigate in the expanded run |
| Home `Map of Contents` button | Accepted clicks but did not navigate |
| Home `Daily Note` button | Accepted clicks but did not navigate |
| Home Todoist panel | Exposed raw `filter`, `project`, and `sorting` configuration in reading view |
| Daily note | Rendered in reading view; still not connected to a journal |
| Daily task checkbox | Toggled source task, added current completion date, then restored original unchecked state |
| Weekly note | Rendered calendar, tasks, goals, summary, and reflections |
| Monthly note | Rendered after full wait; early raw `tabs`/`dataviewjs` frame was transient load delay |
| Area family | Rendered properties, overview, Datacore tabs, and component table |
| Project family | Rendered fields, description, notes, and definition of done |
| Templater application | Applied project template and rendered its fields |
| Template picker | Listed whole vault, including ZETA content, rather than a clearly bounded template set |
| Template output | Created `Untitled.md` in current `DAILY/MONTHLY` folder without name or location prompt |

The synthetic template output and empty probe directory were archived outside
the vault instead of deleted:

```text
G:\Dusk-Goal1-Discovery-20260725\workflow-rerun\cleanup-archive\desktop-light
```

Final maximized screenshots are under:

```text
G:\Dusk-Goal1-Discovery-20260725\workflow-rerun\screenshots\computer-use-maximized
```

They cover daily, weekly, monthly, area, project, and applied-template reading
states. No 1024 by 800 capture is accepted in that set.

### Android and prior visual evidence

Luna visual review covered all 40 earlier functional screenshots, not only
Home or recent files. Daily, weekly, monthly, project, area, templates, Getting
Started, Map of Content, and Mail Box technically rendered. It also found:

- old 1024 by 800 Windows captures wrapped and clipped imported layouts;
- Android tables required horizontal scrolling and remained a usability risk;
- full Android Home contained visible red/error-like content, stray text, and
  clipping that a render-only pass did not explain;
- the daily Journals warning remained visible;
- sidebar navigation, template execution, and writes were not proven by those
  screenshots.

The direct expanded run closed some of those gaps but did not replace physical
Android workflow testing. The user's observed Android DatacoreJS success is
consistent with reading-mode evidence. The user's manual Android plugin
enablement after import must be preserved and must not be misclassified as
configuration drift.

### User correction ledger

| User correction | Evidence handling |
|---|---|
| Android plugins were manually enabled after import | Preserved as intentional user state; disabled-on-import is not classified as incompatibility or drift |
| DatacoreJS works on the tablet, though user review was incomplete | Consistent with physical-Android reading-mode renders; not expanded into a full workflow claim |
| Editing mode shows source while reading mode shows intended dashboard behavior | Every later note check switched explicitly to reading mode after navigation |
| Daily, weekly, monthly, project, area, templates, and sidebars need review, not only Home/recent files | Luna reviewed all 40 initial screenshots; direct Windows run added periodic, project, area, sidebar, task, and template checks |
| Desktop Obsidian must be maximized and each check captured before moving on | Direct workflow captures use maximized 1920 by 1040 windows and one labeled screenshot per accepted check |

### Template and write dependency map

Static review found `Dusk_light` and full `Dusk` template trees byte-identical.
Daily templates depend on Tasks, Templater, Dataview/DataviewJS, and Journals.
Weekly and monthly templates depend on Journals placeholders,
DataviewJS/Dataview rollups, and Templater.

Write destinations are broader than the initial render test:

- Tasks checkboxes update the originating Markdown task;
- Timeline add writes under `# New Tasks` in the selected file;
- Timeline completion invokes the Tasks plugin against the originating task;
- Mail Box checkboxes update status fields in selected-note frontmatter;
- Meta Bind project and meeting inputs update current-note frontmatter;
- Templater toggle scripts can update active-note frontmatter and Iconic state.

The Home daily command maps to
`journals:journal:calendar:open-day`. Home create maps to an opaque QuickAdd
choice ID. Allowed static files do not prove the nested QuickAdd
choice-to-template mapping.

## Independent re-review failure

Independent re-review did not pass. It found:

1. full Windows post-reload log contains unattributed requests to
   `cdn.ko-fi.com`, `storage.ko-fi.com`, `i.ytimg.com`, and
   `img.buymeacoffee.com`;
2. report equated technical rendering with usability despite Home, Android,
   narrow-window, and Journals defects;
3. user corrections were not tracked explicitly;
4. task mutation, applied-template behavior, sidebar controls, and Home
   commands were initially untested.

Expanded review addressed fourth item partly and added user-correction tracking
above. Host attribution, Home navigation, Android visual defects, safe
Journals configuration, and physical-Android write workflows remain open.
Request-host list alone does not identify a plugin or prove user-data egress,
so no attribution is asserted.

## Network and credential gates

Each gated plugin was enabled alone in a disposable, observed, then disabled:

| Plugin | Windows | Android | Final state |
|---|---|---|---|
| Digital Garden | GitHub requests | GitHub requests | Off |
| Custom Frames | `ellpeck.de` request | `ellpeck.de` request in full | Off |
| BRAT | Loaded; no idle request captured | Loaded; no idle request captured | Off |
| Share Note | Loaded; no idle request captured | Loaded; no idle request captured | Off |
| Todoist Sync | Loaded; no idle request captured | Requested API token | Off |

No publish, share, beta-install, embedded-frame interaction, or authenticated
Todoist operation was invoked. Absence of an idle request does not prove that a
plugin is offline-safe after user interaction.

## Errors and remaining risks

Windows reload still captured:

- Novel Word Count: `Could not find file explorer leaf.`
- Highlightr or Settings Search interaction:
  `Cannot read properties of null (reading 'parentNode')`

Android cold starts still emitted WebView tile-memory warnings and repeated
Mali `BAD ALLOC` messages. No crash, ANR, missing loaded plugin, or failed
reading surface was captured.

Still untested or incomplete:

- writes through Datacore and Meta Bind;
- QuickAdd's intended nested creation workflow;
- Templater naming and placement beyond unsafe `Untitled.md` result;
- Tasks writes beyond one restored disposable checkbox mutation;
- Journals safe configuration and migration;
- physical-Android touch and write behavior for every interactive control;
- offline, long-background, battery, conflict, rename, move, and attachment
  behavior;
- FNS convergence for a selected personalized configuration;
- minimum plugin set for the user's chosen workflow.

## Raw evidence

Raw evidence remains outside Git:

```text
G:\Dusk-Goal1-Discovery-20260725\functional-rerun
```

Functional and workflow roots contain:

- exact clone and classification manifests;
- Windows and Android enabled/loaded plugin snapshots;
- 54 initial reading-view and restart screenshots;
- six labeled 1920 by 1040 workflow screenshots;
- per-surface extracted reading text;
- network-gate request records;
- Windows reload errors;
- Android cold-restart state and logcat captures.

## Decision

Keep PR #7 draft. Corrected evidence supports `Dusk_light_empty` only as a
future starting hypothesis. It does not yet support beginning Goal 2
personalization. Host attribution, Home navigation, safe Journals behavior,
Android visual defects, and selected write workflows require correction or an
explicitly accepted deferral followed by independent PASS.

Do not remove a plugin merely because it was disabled immediately after
import. Re-enable and test current compatible versions first. Do not treat
editing-mode source as reading-view failure.
