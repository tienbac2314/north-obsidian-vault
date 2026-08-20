# North Overlap Cleanup Design

**Date:** 2026-08-20  
**Status:** Approved by user instruction “go” after the overlap audit

## Goal

Reduce duplicate navigation and counting surfaces in North without changing
note creation, task handling, calendar creation, synchronization, or mobile
usability.

## Scope

Test these four overlap candidates in a disposable North copy first:

- Core Quick Switcher (`switcher`) versus Quick Switcher++.
- Quick Explorer versus Notebook Navigator and File Explorer.
- Recent Files versus Notebook Navigator Recent Notes.
- Novel Word Count versus core Word Count and Notebook Navigator counts.

Keep these untouched: Tasks, Datacore, Bases, Journals, Templater, Meta Bind,
QuickAdd, Note Toolbar, Custom Sort, FNS, File Explorer, Search, Tags,
Bookmarks, Outline, Simple Checklist, Trash Explorer, Hover Editor, and
Notebook Navigator.

## Chosen approach

Use reversible disablement, not uninstall:

1. Save exact target config and plugin-folder rollback copies outside Git.
2. Apply one candidate change at a time to the disposable target.
3. Restart Obsidian and check Homepage, command palette, NN browsing, recent
   notes, folder reveal, counts, tasks, calendar, note creation, and mobile
   layout where the target exists.
4. Promote only a candidate that removes duplicate UI without removing a
   relied-on action.
5. Keep removed plugin folders in the rollback directory. Do not delete note
   content or plugin data.

## Decisions

- Keep Quick Switcher++ if disabling core Switcher removes Command Palette or
  another required command surface; otherwise disable only core `switcher`.
- Remove Quick Explorer from the active list only if NN and File Explorer
  still provide folder reveal and quick navigation.
- Remove Recent Files from the active list because NN already owns Recent
  Notes, unless a tested Recent Files-only action is still required.
- Remove Novel Word Count only if folder/root counts are not used in North;
  retain core Word Count for the active note.
- Do not hide or remove Journals calendar. NN may be the visible calendar,
  but Journals remains the period-note creation backend.

## Acceptance

Windows North must reopen cleanly with no source leakage or dependency errors.
Homepage, NN, File Explorer, command search, task list, Journals calendar,
period creation, templates, and Note Toolbar must remain usable. Any Android
claim requires the exact Android target to be independently identified and
tested; the existing Android target is disposable evidence only.

## Rollback

Rollback restores the saved `core-plugins.json`, `community-plugins.json`,
candidate plugin folders, and candidate data files. No live note content is
part of this cleanup.
