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

All three manifests declare mobile support. Advanced Tables was not added;
Obsidian Bases remains a future core-table and personalization option.

Projects remains enabled on Windows and Android because it is a user-facing
vault feature, not disposable bloat. Settings Search was removed from both
active disposable trees because its compatibility surface was unnecessary;
rollback/quarantine is preserved outside this repository.

## Templates and cursor behavior

Templates keep their `tp.file.cursor()` markers. Create a daily note in
Editing mode when you want Templater to place the cursor. A note created from
Reading mode can retain the literal marker; switching modes afterward does
not repair that already-created note. Do not remove the marker from every
template to work around this mode-specific behavior.

## Features covered by the runtime matrix

The external Wave 5 coverage matrix records Homepage and Mobile Homepage,
navigation, tabs, Tasks, Journals creation routes, Templater, Dataview/DVJS,
Datacore JSX, Meta Bind/JS Engine, QuickAdd, Commander, Note Toolbar, Custom
Sort, Excalidraw, Hover Editor, search, templates, mapped creation flows,
recovery, Reading, Live Preview, and relevant scrolling on both platforms.
The current batch added fresh integrated evidence for repaired/plugin surfaces;
unchanged equal-contract evidence was reused rather than duplicated.

## Windows and Android

Windows disposable evidence uses native 1920x1040 JPEG captures. Android uses
native 1200x2000 PNG captures on registered serial `01234ABC`. Both active
community-plugin lists contain same 46 IDs and same 1052-byte config SHA-256:

`591DAC8656E72F5345AD9394AB4D943CF9671EB3DA870B66C00CFC4049D2EC79`

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

Full-Dusk source is not admitted. Wave 6 / canonical Task 7, Wave 7 / Task 8,
and Wave 8 / Task 9 remain `NOT STARTED`. No full-only import, remnant
ingestion, personalization, live-vault promotion, pull request, or merge was
started.
