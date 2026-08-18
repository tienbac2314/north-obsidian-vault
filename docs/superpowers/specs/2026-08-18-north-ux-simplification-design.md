# North UX Simplification Design

**Status:** accepted for implementation on disposable North copies, then live
North after Windows and Android checks pass.

**Source:** user-approved North direction plus external ChatGPT Chrome review
`APPROVE_WITH_CHANGES` on 2026-08-18. Review used a sanitized brief only.

## Goal

Make North understandable for a new Obsidian user. User chooses what they
mean; visible actions choose safe destinations and existing templates. Plugin
names, Multi groups, macro names, raw template filenames, and duplicate creator
paths stay out of normal use.

## Non-goals

- No blanket note move.
- No property or semantic-type rename.
- No replacement of Bases, Datacore, Tasks, Meta Bind, or NN in this batch.
- No new navigation plugin.
- No silent overwrite, automatic duplicate suffix, or content rewrite.

## User model

User sees five concepts: Project, Area, Resource, Inbox, and Scratch. Today
and other period notes belong to the calendar/time surface, not general
creation.

Visible actions:

```text
Create
├─ New Project
├─ New Area
├─ Add to existing
│  ├─ Project
│  └─ Area
├─ Resource
│  ├─ Knowledge
│  ├─ Documentation
│  ├─ Contact
│  └─ Meeting
└─ Capture
   ├─ Inbox
   └─ Scratch
```

Contextual actions on a note inside a family expose `Add note to this Project`
or `Add note to this Area`. They resolve from the active note path. They never
depend on Notebook Navigator's private selection state.

Homepage exposes `Today`. Notebook Navigator owns visible period navigation
and creation for Daily, Weekly, Monthly, Quarterly, and Yearly. No second
Daily-note entry is added to Create.

## Ownership

| Responsibility | Owner | Visible role |
|---|---|---|
| Human-facing action menu | Note Toolbar | One Create/Capture surface |
| Family and child route execution | QuickAdd | Hidden backend |
| Explicit template rendering | Templater | Called by selected route only |
| Browsing, search, calendar, previews | Notebook Navigator | Primary browser |
| Structured views | Bases and Datacore | Consume existing properties |
| Inline tasks | Tasks | Keep task syntax and status behavior |
| Inline property controls | Meta Bind | Edit existing fields |
| Plain note, rename, move, recovery | Obsidian core | Fallback and escape hatch |

Templater Project and Area root folder triggers are removed from the runtime
configuration. They are recursive and can silently template a native note in a
child folder. QuickAdd explicitly selects the existing template once. This
keeps native `New note` predictable: plain Markdown note where user requested.

## Exact creation flows

### New Project

Input: `Website Redesign`.

Expected result:

```text
PARA/1. PROJECTS/Website Redesign/
└─ 1. Website Redesign.md
```

Route asks only for project name, trims accidental whitespace, checks whether
folder/family note already exists, creates one folder and one family note from
existing Project Family template, then opens it. Existing target opens instead
of creating `Website Redesign 1`. A failed route removes only an empty folder
created by that same failed action.

### Add note to Project

From a note inside `PARA/1. PROJECTS/Website Redesign/`, ask only for note
name, create directly inside that folder with existing Project child template,
and open it. If no active family is clear, `Create > Add to existing > Project`
asks user to choose a known family folder.

### New Area and Area child

Same rules under `PARA/2. AREAS/<name>/`, using existing Area Family and Area
child templates. Preserve current numbering convention owned by templates; UI
does not invent a new prefix.

### Resource and capture

`Resource` groups Knowledge, Documentation, Contact, and Meeting. `Capture`
groups Inbox and Scratch. Each route uses existing template and destination:
`PARA/3. RESOURCES/KNOWLEDGE`, `DOCUMENTATIONS`, `CONTACTS`, `MEETINGS`,
`INBOX`, and `STICKY`.

## Notebook Navigator and File Explorer

NN remains primary for browsing, search, calendar, previews, properties, task
icons, shortcuts, and sorting. Its generic note/template creation remains
available as a power-user fallback but is not advertised as North Project or
Area creation. Do not add private NN selection hooks in first batch.

File Explorer remains visible. Its native right-click `New note` stays generic
and predictable. Do not hijack or rename built-in entries. Removing the
recursive Project/Area triggers is what makes this fallback safe.

## Windows and Android

Both platforms use same labels, destinations, templates, properties, and
duplicate protection. Windows may keep dual-pane NN and keyboard shortcuts.
Android must expose every required route through thumb-accessible toolbar or
drawer actions; no required flow may need right-click, hover, or keyboard.
Geometry can differ. Meaning and result cannot.

### Accepted Note Toolbar limit

Note Toolbar supports one submenu level for this configuration. A menu nested
inside `Create` renders empty instead of showing its children. Accepted design
therefore uses one flat `Create` list with separators and readable labels. This
keeps same intent grouping without a broken second-level menu on Windows or
Android.

## Safe batch order

1. Record exact North baseline and create disposable Windows/Android copies.
2. Test current Project, Area, child, Resource, Inbox, Scratch, and five period
   routes before edits.
3. Build one-level visible Note Toolbar Create list that points at current
   working routes; use separators instead of nested menus.
4. Remove Project/Area Templater root triggers in disposable copy; test native
   New note and explicit child routes.
5. Harden family creation against existing targets and partial failures.
6. Add path-based contextual Add actions.
7. Test Bases, Datacore, Tasks, Meta Bind, status icons, NN previews/calendar,
   links, and onboarding on Windows and Android.
8. Promote only accepted disposable configuration to live North, retain the
   pre-change backup, and update onboarding with screenshots from current
   North.

Each batch has a dated backup, exact file manifest, one reversible change,
Windows result, Android result, and rollback result. Raw screenshots stay
outside Git. Live North is never the first test target.

## Acceptance gate

- New Project creates exactly one folder and one family note.
- Repeating same Project opens existing target and creates no duplicate.
- Project child and Area child use correct existing templates in correct folder.
- Native New note below Project/Area roots stays plain.
- Resource, Inbox, and Scratch routes use correct destinations.
- No route writes twice, moves silently, or overwrites existing content.
- NN opens/creates all five period types at canonical numbered paths.
- Bases, Datacore, Tasks, Meta Bind, status icons, links, and previews still
  work.
- Same required flows pass on Windows and Android.
- Onboarding explains one safe path per intent and one recovery path.

## Self-review decision

Scope is one coherent UX change: reduce visible creation ownership while
preserving existing data and plugins. Design does not require a new plugin or
data migration. ChatGPT's main correction is included: remove automatic
Project/Area folder triggers and keep Daily out of general Create. Proceed with
disposable implementation; stop only for wrong target, credential exposure,
destructive failure without rollback, or a required behavior that cannot be
preserved.
