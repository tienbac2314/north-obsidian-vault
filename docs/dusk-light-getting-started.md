# Dusk_light quick start

This page describes current Dusk_light disposable result. It does not
describe full Dusk vault. Older Getting Started pictures are full-Dusk
reference material and may show folders, plugins, or pages that Dusk_light
does not contain.

## Start here

1. Open Homepage.
2. Use single Calendar and single Todo List entry shown there.
3. Use Journals for daily, weekly, and monthly notes. Core Daily Notes and
   Daily Note Navbar are intentionally disabled, so they do not create a
   second periodic-note system.
4. Use floating Note Toolbar button where its folder mapping applies. Action
   list depends on current file directory. Final `*` fallback covers unmapped
   locations; it is not a separate daily navbar.
5. Use Quick Switcher++ with `Ctrl+Shift+S` on Windows. Android uses its
   mobile launcher and file search surface.

## Current additions

| Plugin | Version | Windows | Android | Purpose |
|---|---:|---|---|---|
| Day Planner | 0.35.1 | Timeline and multi-day view checked; repaired plugin reload | Mobile long-press menu and Edit modal passed; synthetic test note was removed | Time-blocked daily planning |
| Remember Cursor Position | 1.0.13 | Metadata write checked | Metadata present after install | Returns to a note position |
| Quick Switcher++ | 6.1.6 | Open, search, filter, dismiss checked | Installed and config-parity checked | Faster file and command switching |

All three manifests declare mobile support. Advanced Tables was not added.
The current Personalization pilot adds core Bases only for simple tables:
Area Families is the accepted exact-query migration, and Area Components is a
parallel pilot. Dataview remains the owner of Homepage Project, DataviewJS,
Datacore, Tasks, and other dynamic views; Bases does not create project notes.

Commander was removed from both current Dusk_light disposables after fallback
proof. Omnisearch, QuickAdd, Note Toolbar, Homepage, and Mobile Homepage are
not Commander-dependent.

Checklist is currently disabled, not uninstalled, in the E13 disposable test on
both platforms. Tasks remains enabled as the owner for task query blocks and
metadata. This is a review gate, not a product-wide removal decision.

The next overlap triage found no unambiguously unused plugin. Home tab, Quick
Explorer, Novel Word Count, Admonition, Recent Files, Status Bar Organizer, and
Editing Toolbar remain active or protected. List Callouts has seven configured
symbols and 49 current Markdown syntax entries on both platforms. No next
candidate was disabled. The cumulative removal/disable list is recorded in the
current active-goal checkpoint.

Projects is removed from both current Dusk_light disposables as archived bloat:
its dashboard, commands, config definitions, and stale command consumers are
gone. Do not look for a Projects dashboard. Use Homepage > Development >
Project for the DataviewJS project table, and QuickAdd > Create a Note > Create
Project Family for populated project-family notes. PARA/PROJECTS content,
both project templates, Templater, Meta Bind, and Dataview remain. Rollback is
preserved outside this repository. Settings Search was also removed from both
active disposable trees; no other disputed utility plugin was removed in this
checkpoint.

## Status bar cleanup

Status Bar Organizer can reorder or hide individual bottom status-bar items
from its Default profile. Use it to hide noisy items such as Grandfather's
clock when desired; Grandfather remains installed. It is desktop-only, so
Android does not load it and that omission is expected.

## Tab bar warning

Minimal Theme Settings Focus Mode hides the native tab bar. If tabs disappear,
press `Ctrl+P` and run `Minimal Theme Settings: Toggle Focus Mode`; the change
is reversible. Editing Toolbar Auto-hide is intentional and stays enabled. This
is not Hider `hideTabs`.

## Templates and cursor behavior

Templates keep their `tp.file.cursor()` markers. Create a daily note in
Editing mode when you want Templater to place the cursor. A note created from
Reading mode can retain the literal marker; switching modes afterward does
not repair that already-created note. Do not remove the marker from every
template to work around this mode-specific behavior.

## Features covered by the runtime matrix

The external Wave 5 coverage matrix records Homepage and Mobile Homepage,
navigation, tabs, Tasks, Journals creation routes, Templater, Dataview/DVJS,
Datacore JSX, Meta Bind/JS Engine, QuickAdd, Commander removal/fallbacks,
Note Toolbar, Custom Sort, Excalidraw, Hover Editor, search, templates, mapped
creation flows, recovery, Reading, Live Preview, and relevant scrolling on
both platforms.
The current batch added fresh integrated evidence for repaired/plugin surfaces;
unchanged equal-contract evidence was reused rather than duplicated.

## Windows and Android

Windows disposable evidence uses native 1920x1040 JPEG captures. Android uses
native 1200x2000 PNG captures on registered serial `01234ABC`. Both active
community-plugin lists contain 43 IDs with sorted parity in the current E13
disposable test. Windows list SHA-256 is
`E899C8E786A28E46D09C363FC91D4763B280785C9BED1342CE7631A36B5CB78A`;
Android list SHA-256 is
`05A8F4CE0C7A287BE69F834DC3D7338431DF1C6DAA83D8E29B6657516582899A`.

Windows is left on settled Homepage after exact-profile reload of the repaired
Day Planner bytes. One fresh post-patch native Computer Use capture was not
obtained because the helper returned `node_repl exec context not found`; no
input followed. Android is left on settled Homepage after final restart. Its
Day Planner block long-press menu and Edit modal passed; the synthetic note was
quarantined/deleted and its exact path is absent.

## Evidence and boundaries

Raw screenshots, rollback files, manifests, ledgers, and runtime guide media
remain outside product Git under Part 2 runtime evidence root. Runtime guide
contains four curated sanitized screenshots; this product repo does not copy
them.

Full-Dusk source is not admitted. Full-Dusk comparison and Discord addition
are skipped for now. Wave 6 / canonical Task 7, Wave 7 / Task 8, and Wave 8 /
Task 9 remain `NOT STARTED`. No full-only import, remnant ingestion,
live-vault promotion, pull request, or merge was started.
