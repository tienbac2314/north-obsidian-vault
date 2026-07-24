# Dusk Runtime Recreation Design

Date: 2026-07-24

Status: approved through explicit autonomous implementation authority. Current
product authority is DEC-037 and the Phase 2 roadmap; this specification
explains the implementation boundary.

## Outcome

Turn `G:\Obsidian` into a desktop-first, mobile-declared recreation of the
latest available Dusk experience while preserving:

- FNS as sole live synchronization authority;
- byte-identical `Notion/` import;
- normal Markdown and attachment portability;
- independent recovery;
- current STAGING, PARA, ZETA, DAILY, HUB, and SYSTEM meaning.

Required surfaces:

1. Homepage;
2. Map of Content;
3. Mail Box and page-task dashboard;
4. area and project pages.

Required current modules:

- Dusk dark visual language;
- current Datacore Map of Content;
- current Priority Matrix;
- QuickAdd Dynamic Form when safe;
- Habit Streak RPG attempt or documented maintained replacement;
- desktop and mobile companion dashboards;
- visible `dd/mm/yyyy` dates.

## Source priority

1. User-supplied `Dusk\new from discord`.
2. Current public component repositories, especially
   `DuskWasHere/Priority_Matrix`.
3. Local legacy Dusk for complete workflow, styling, and configuration
   reference.
4. Signed-in Dusk Discord through Coccoc only when required source is broken or
   incomplete.

Never treat copied plugin binaries as current evidence. Resolve each retained
plugin to its official repository and current release.

## Content boundary

Do not import:

- Dusk sample notes, contacts, projects, journals, or task data;
- Todoist token or Todoist configuration;
- password-protection state;
- provider credentials;
- workspace/layout files containing personal paths;
- plugin data without explicit field review;
- `.trash`;
- complete `.obsidian` directory.

Allowed inputs:

- empty templates;
- dashboard source;
- modular JSX/JavaScript and its non-personal default configuration;
- CSS snippets;
- icons and decorative assets with compatible public/shared terms;
- non-secret settings reconstructed field-by-field.

## Runtime design

### Immediate layer

Load at startup:

- Fast Note Sync;
- Homepage;
- Datacore;
- Dataview when Homepage still contains Dataview blocks;
- Tasks when Homepage exposes task queries;
- Meta Bind or JS Engine when visible startup widgets require them;
- Minimal Theme Settings;
- Custom File Explorer sorting.

QuickAdd and Templater remain immediate if Homepage capture buttons invoke
them. Otherwise they may enter delayed layer after clean-relaunch proof.

### Delayed layer

Lazy Loader may delay only independent tools such as Excalidraw, Charts,
Highlightr, or Trash Explorer. A plugin stays immediate when delay causes:

- missing startup command;
- blank dashboard block;
- missed layout hook;
- unavailable mobile action;
- state restoration failure.

No delayed plugin may control FNS, startup Home, sorting, or current dashboard
rendering.

### Query allocation

Use Datacore for:

- current modular Map of Content;
- Mail Box page-task actions;
- Priority Matrix;
- Habit Streak RPG if retained;
- interactive stateful components.

Use native Bases for:

- review queue;
- ordinary project list;
- ordinary learning-note list;
- contextual file/property tables where `this` and formula support suffice.

Use Dataview only for legacy queries not yet represented equivalently by
Datacore or Bases. Do not rewrite a working current Datacore component into
Bases merely to reduce plugin count.

## Surface design

### Homepage

Desktop Home reproduces Dusk:

- prominent Map of Content, Daily Note, Create Note, recent-file, and Mail Box
  actions;
- current task and review panels;
- active project and learning navigation;
- warm red accent, separators, cards, tabs, and balanced whitespace;
- dark mode as default.

Mobile Home exposes same primary actions and source data in one column. It may
omit decorative multi-column layout, not behavior.

### Map of Content

Use latest supplied modular Datacore component. Reconfigure paths and folder
labels for current HUB, STAGING, DAILY, PARA, ZETA, Notion, and SYSTEM layout.
No Dusk sample path remains.

### Mail Box

Translate Dusk page tasks into current note properties and STAGING workflows:

- page tasks remain ordinary note files;
- pending and completed views must not mutate Notion;
- review queue remains distinct from raw `STAGING/Unsorted`;
- Hermes later consumes only tracked STAGING authorization paths.

### Area and project pages

Templates provide Dusk-like overview, summary, status, related files, meetings,
tasks, and progress surfaces. Related-file tables may use Bases. Rich controls
may use Datacore or Meta Bind.

### Optional current modules

Priority Matrix ships when current public component runs against retained
Datacore. Dynamic Form ships when its QuickAdd script:

- writes only inside configured vault folders;
- contains no system command or network access;
- cannot overwrite an existing note silently;
- uses reviewed templates and properties.

Habit Streak RPG is isolated under `SYSTEM/Components`. It may be omitted from
startup and marked experimental if current Datacore errors or mobile cost is
unacceptable. Discontinued status must remain visible.

## Dates

- Store typed frontmatter dates as `YYYY-MM-DD`.
- Keep daily-note filenames `YYYY-MM-DD`.
- Render dashboard, table, task, and template-body dates as `dd/mm/yyyy`.
- Use Luxon or plugin display formatting at presentation time.
- Do not duplicate every date into separate machine and display properties.

## Layout and files

Human entrypoints stay in `HUB/`.

Implementation files move under:

```text
SYSTEM/
  Components/
  Config/
    Bases/
    Scripts/
    Snippets/
  Mobile Hub/
  Templates/
```

`HUB/` contains only human-facing dashboards. `.base`, `.jsx`, and helper
scripts do not clutter HUB.

## Recovery

Before rich mutation:

1. close Obsidian;
2. create a new timestamped copy outside vault and repository;
3. produce source and backup SHA-256 manifests;
4. verify manifests equal;
5. record Notion-only manifest;
6. record FNS config hash without printing content.

Small rollback disables rich plugin IDs and points Homepage to `HUB/Home.md`.
Full rollback restores the fresh pre-rich-runtime copy only after preserving
failed state for diagnosis.

## Acceptance

Windows must prove:

- clean Obsidian relaunch;
- all four surfaces render without error panes;
- navigation and create actions resolve;
- Datacore, Bases, task, template, and property views show synthetic current
  data;
- visible dates use `dd/mm/yyyy`;
- typed dates remain sortable;
- exact root folder order;
- FNS loaded and configuration hash unchanged;
- Notion path, length, and SHA-256 identity;
- startup measurements before and after;
- secrets absent from repository;
- fallback Home works with rich plugins disabled.

Physical Android is not claimed. Deliver an exact mobile checklist covering
render, capture, edit, task action, offline reopen, attachment, sync, history,
trash, and startup.

## Failure policy

Fix small local compatibility defects. For large breakage:

1. verify current official release and open issues;
2. check supplied source instructions;
3. use signed-in Discord through Coccoc when source or fix is missing;
4. replace with closest maintained component;
5. document remaining parity gap and rollback.

Do not hide broken blocks, weaken preservation, add another sync engine, or
claim parity that was not observed.
