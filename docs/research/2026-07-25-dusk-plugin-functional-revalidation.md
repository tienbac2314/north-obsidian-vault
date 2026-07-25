# Dusk plugin functional revalidation

Date: 2026-07-25

Status: complete. Independent release re-review pending.

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
- Goal 2 may now start with personalization review. This result still does not
  authorize changes to `G:\Obsidian`.

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

## Reading-view results

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
error.

Observed functional results:

- Home rendered navigation, task, calendar, and recent-file output.
- Map of Content rendered searchable and paginated Datacore rows.
- Mail Box rendered inbox rows and filters.
- project and area views rendered fields and dependent tables.
- daily, weekly, and monthly views rendered dynamic task/calendar output.
- Getting Started rendered normally.
- the project template rendered its configured reading view; raw Templater
  source execution remains outside this test.

The daily fixture still reports `Note is not connected to a journal`. That is
a Journals configuration gap, not a Dataview or Datacore failure.

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

Still untested:

- writes through Datacore, Meta Bind, Tasks, QuickAdd, or Templater;
- Journals safe configuration and migration;
- touch behavior for every interactive control;
- offline, long-background, battery, conflict, rename, move, and attachment
  behavior;
- FNS convergence for a selected personalized configuration;
- minimum plugin set for the user's chosen workflow.

## Raw evidence

Raw evidence remains outside Git:

```text
G:\Dusk-Goal1-Discovery-20260725\functional-rerun
```

It contains:

- exact clone and classification manifests;
- Windows and Android enabled/loaded plugin snapshots;
- 54 reading-view and restart screenshots;
- per-surface extracted reading text;
- network-gate request records;
- Windows reload errors;
- Android cold-restart state and logcat captures.

## Decision

The corrected evidence supports beginning Goal 2 personalization review. Use
the light empty variant as the starting hypothesis, preserve working Dusk
surfaces, reconstruct only explicit non-secret settings, and choose the first
workflow before reducing plugins.

Do not remove a plugin merely because it was disabled immediately after
import. Re-enable and test current compatible versions first. Do not treat
editing-mode source as reading-view failure.
