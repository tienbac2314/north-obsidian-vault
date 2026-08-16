# Dusk_light quick start

## Current review note (2026-08-17)

Current disposable review passed on Windows and registered Android after the
daily overview wrapper was replaced with direct Bases tabs. Reading and Live
Preview now show the same Meetings, Projects, and Areas overview. Homepage
Today includes unfinished overdue work; old due dates remain visible so sample
data stays truthful. Use numbered daily folders: `1. DAILY`, `2. WEEKLY`,
`3. MONTHLY`, `4. QUARTERLY`, `5. YEARLY`.

This guide describes current Dusk_light only. Old full-Dusk screenshots and
ZETA-heavy layouts are reference material, not missing current features.

## Release-candidate use flow (2026-08-16)

Dusk_light exists to make capture fast, keep active work findable, and turn
useful learning into reusable knowledge on Windows and Android.

1. Open `HUB/Homepage`. Use `Daily Note` for today, `Create a Note` for a
   populated template, `Recent Files` for the recent-file list, and `Mail Box`
   for the virtual inbox surface.
2. Use Notebook Navigator as primary folder browser, recent list, and visible
   calendar. Click a day or period label to open/create existing daily,
   weekly, monthly, quarterly, or yearly note.
3. Use Homepage task modes `Today`, `All open`, and `Completed`. Add task to
   selected daily note, then open row title to edit source.
4. Capture directly into Project, Area, or Resource when destination is clear.
   Use QuickAdd `Create Inbox Capture` for unprocessed material and `STICKY`
   for temporary scratch. Keep `WORKSTATION` for technical investigation.
5. Use Bases for simple tables and Datacore for complex task/date/progress,
   calendar, timeline, and custom views. Use Templater, Meta Bind, QuickAdd,
   Journals, Note Toolbar, and project templates for creation.
6. Windows has desktop-only Quick Explorer and Status Bar Organizer. Android
   uses drawer, Notebook Navigator, command palette, and native file search.
   Same files and templates remain in use; layout differs.
7. Add FNS and Notion later through a separate setup decision. They are not
   configured here.

If Focus Mode hides tabs, run Command Palette > `Minimal Theme Settings:
Toggle Focus Mode`. If a daily note shows `tp.file.cursor()`, create it while
Editing mode is active; templates keep that marker for cursor placement.

Current bloat cleanup removed `daily-note-navbar`, `obsidian-day-planner`, and
`obsidian-admonition` from both disposable platforms. User-requested
`obsidian-checklist-plugin`, `custom-sort`, and `recent-files-obsidian` were
restored on both platforms. Checklist provides the right-side Todo List pane;
Recent Files provides recent-file navigation; Custom Sort is active against
the `SORT ORDER` bookmark group for File Explorer ordering. Android QuickAdd's stale
Custom Sort startup command remains repaired and was not restored. No note
content was removed.

## Current Personalization structure

Current disposable Dusk_light uses one simpler learning/reference home:
`PARA/RESOURCES/KNOWLEDGE`. Reusable notes from old `ZETA` and old Concept
Map drawings now live there. Use `PERMANENT`, `LITERATURE`, and `FLEETING`
when you want to separate note maturity; existing note type values stay the
same.

- `PARA/AREAS`: ongoing responsibilities, such as Autonomous Vehicle AI
  Ethics or Space Tourism Initiatives.
- `PARA/PROJECTS`: active outcomes and project notes.
- `PARA/RESOURCES/KNOWLEDGE`: reusable learning and reference, such as a
  concept explanation, research note, or Excalidraw diagram.
- `INBOX`: one unprocessed capture route. QuickAdd exposes `Create Inbox
  Capture`; `STICKY` remains fast disposable scratch space.
- `PARA/WORKSTATION`: retained during dependency audit for existing workflow
  behavior; do not treat it as a second generic Inbox yet.

No content is silently moved by AI review. Existing `review_ai` and
`review_ai_needs_user` tags remain the review signals regardless of folder.

This page describes current Dusk_light disposable result. It does not
describe full Dusk vault. Older Getting Started pictures are full-Dusk
reference material and may show folders, plugins, or pages that Dusk_light
does not contain.

## Start here

1. Open Homepage.
2. Use Notebook Navigator's single Calendar in the right sidebar. Click a
   date for daily notes, a week/month/quarter/year label for that period note.
   It maps to `DAILY/1. DAILY`, `DAILY/2. WEEKLY`, `DAILY/3. MONTHLY`,
   `DAILY/4. QUARTERLY`, and `DAILY/5. YEARLY`.
3. Use Journals for daily, weekly, and monthly note rendering and commands.
   Its duplicate calendar panel is intentionally hidden because Notebook
   Navigator now supplies the visible calendar. Core Daily Notes and Daily Note
   Navbar remain disabled, so they do not create a second periodic-note system.
4. Use floating Note Toolbar button where its folder mapping applies. Action
   list depends on current file directory. Final `*` fallback covers unmapped
   locations; it is not a separate daily navbar.
5. Use Quick Switcher++ with `Ctrl+Shift+S` on Windows. Android uses its
   mobile launcher and file search surface.

Supported visible date labels use ISO `YYYY-MM-DD` with hyphens on Windows and
Android. This matches task dates and journal storage. Existing note names such
as `11-12 - ...` are user content and are not renamed.

## Current additions

| Plugin | Version | Windows | Android | Purpose |
|---|---:|---|---|---|
| Remember Cursor Position | 1.0.13 | Metadata write checked | Metadata present after install | Returns to a note position |
| Quick Switcher++ | 6.1.6 | Open, search, filter, dismiss checked | Installed and config-parity checked | Faster file and command switching |
| Obsidian Bases | core | Six synchronized view files checked | Native table rendering checked | Simple tables and dashboard-style views |

Advanced Tables was not added. Bases now owns six safe simple-table and
dashboard-style views across Homepage, areas, contacts, and daily/weekly/
monthly notes. Dataview is absent from current disposables. Datacore remains
owner for complex JSX, task/date/progress, Calendar/Timeline, and custom UI
surfaces. Bases shows project views; it does not create project notes.

Open `SYSTEM/GETTING STARTED/Dusk_light Bases - Contact Directory.base` for
the Contacts view. Windows and Android native rendering pass.

Commander was removed from both current Dusk_light disposables after fallback
proof. Omnisearch, QuickAdd, Note Toolbar, Homepage, and Mobile Homepage are
not Commander-dependent.

Checklist is restored on both current Dusk_light disposables at version
`2.2.14`; its pane is a checklist view over Markdown checkbox items. Tasks
remains enabled as owner for task query blocks and task metadata.

Admonition, Daily Note Navbar, and Day Planner remain removed from both current
Dusk_light disposables. Custom Sort is restored at `3.1.6` and active for the
`SORT ORDER` bookmark group. Recent Files is restored at
`1.7.10` because recent-file navigation remains useful. List Callouts remains
enabled because 49 active syntax markers remain across eight files. Novel Word
Count remains because core Word Count lacks its file/folder/vault totals.
Highlightr, Iconic, mapped file hotkeys, Custom Frames, Tag Wrangler, Natural
Language Dates, Paste Image Rename, and Trash Explorer remain because each has
documented, configured, or distinct value. Full bloat result and rollback
manifest remain outside product Git.

Projects is removed from both current Dusk_light disposables as archived bloat:
its dashboard, commands, config definitions, and stale command consumers are
gone. Do not look for a Projects dashboard. Use Homepage > Development >
Project for the DatacoreJS project table, and QuickAdd > Create a Note > Create
Project Family for populated project-family notes. PARA/PROJECTS content,
both project templates, Templater, and Meta Bind remain. Rollback is
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
navigation, tabs, Tasks, Journals creation routes, Templater, Datacore JSX,
Meta Bind/JS Engine, QuickAdd, Commander removal/fallbacks,
Note Toolbar, Custom Sort, Excalidraw, Hover Editor, search, templates, mapped
creation flows, recovery, Reading, Live Preview, and relevant scrolling on
both platforms. Dataview is not a current owner; Datacore owns migrated
complex views.
The current batch added fresh integrated evidence for repaired/plugin surfaces;
unchanged equal-contract evidence was reused rather than duplicated.

## Windows and Android

Windows disposable evidence uses native 1920x1040 JPEG captures. Android uses
native 1200x2000 PNG captures on registered serial `01234ABC`. Current enabled
lists contain 38 Windows IDs and 36 Android IDs. Windows-only
Quick Explorer and Status Bar Organizer remain PC features. Android uses native
file navigation and status-bar fallbacks.

Windows is left on settled Homepage after exact-profile reload following the
final bloat cleanup. Android is left on settled Homepage after final
restart. Both task panels show repaired plain rows and explicit modes. No user
note or template content remains changed.

## Evidence and boundaries

Raw screenshots, rollback files, manifests, ledgers, and runtime guide media
remain outside product Git under Part 2 runtime evidence root. Runtime guide
contains four curated sanitized screenshots; this product repo does not copy
them.

Full-Dusk source is not admitted. Full-Dusk comparison and Discord addition
are skipped for now. Wave 6 / canonical Task 7, Wave 7 / Task 8, and Wave 8 /
Task 9 remain `NOT STARTED`. No full-only import, remnant ingestion,
live-vault promotion, pull request, or merge was started.
