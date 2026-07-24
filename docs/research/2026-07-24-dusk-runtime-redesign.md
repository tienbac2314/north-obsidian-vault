# Dusk runtime redesign review

Date: 2026-07-24

Status: current evidence for DEC-037. Product behavior remains authoritative in
the decision, architecture, and roadmap modules.

## Trigger

The completed core-first Phase 2 workspace is fast and reversible but does not
match Dusk's visual density or interactive workflows. User clarified that
"minimal" means no unjustified core/plugin bloat, not a visually sterile vault,
and selected near-complete Dusk recreation with Windows priority.

## Source inventory

Observed sources:

- local legacy Dusk vault dated November 2024;
- public `DuskWasHere/dusk-obsidian-vault` commit
  `69fd1e725e21557b9eb7d706ccaa0834288085cb`, whose README labels it legacy;
- local `new from discord` capture with channel instructions and modular
  components dated through August 2025;
- `DuskWasHere/Priority_Matrix`, active public source updated in 2026.

Latest available modular material contains:

- Datacore Map of Content;
- Priority Matrix and Priority Matrix Light;
- QuickAdd Dynamic Form;
- Habit Streak RPG, explicitly marked discontinued by Dusk;
- CSS classes for full-width, hidden-property, and hidden-inline-title views.

Legacy runtime enabled 47 community plugins. This count is not the target.
Visible behavior and workflows are the target.

## Credential boundary

Public legacy ZIPs include filenames for `.obsidian/todoist-token`,
Todoist plugin data, and password-protection plugin files. Inventory inspected
names only. No token or secret-bearing plugin data was read. Implementation
must select exact non-secret files rather than extract or copy `.obsidian`
wholesale.

## Engine allocation

Datacore remains appropriate for current Map of Content, Mail Box/page tasks,
Priority Matrix, and modular JSX components. Current upstream manifest declares
mobile support, but an open iOS issue reports table headers rendering without
rows. Physical Android behavior therefore remains evidence, not assumption.

Native Bases remains preferable for ordinary project, learning, and review
tables because it is core, fast, editable, and supports contextual `this`
filters. Bases does not replace arbitrary Datacore JSX, block/task indexing, or
component-local state.

Legacy Homepage also uses Dataview, Tasks, Meta Bind, JS Engine, QuickAdd, tabs,
and custom frames. Each dependency must be mapped to a retained surface or
removed through an equivalent rewrite.

## Date contract

Obsidian typed date properties use ISO `YYYY-MM-DD`. A literal
`dd/mm/yyyy` frontmatter value becomes text, and slash-formatted filenames
create nested paths. Implementation therefore keeps ISO storage and renders
visible dates as `dd/mm/yyyy` through Datacore/Dataview formatting, template
body text, and supported plugin display settings.

## NotebookLM disposition

Older notebook was used only for source discovery. Lean notebook challenged
dependency coupling, date parsing, mobile layouts, lazy-start races, FNS
security, and Notion preservation.

Accepted cautions:

- do not delay FNS or startup-dashboard dependencies;
- keep ISO machine-readable dates;
- verify Notion hashes after runtime changes;
- test separate mobile dashboard notes rather than assuming desktop JSX fits.

Rejected unsupported recommendations:

- moving Notion outside the vault;
- adding another FNS instance;
- adding another private network product;
- treating old video claims as current performance evidence.

These conflict with tracked authority or exceed current scope. Independent
primary-source and local runtime checks decide implementation.

## Accepted trial

Implement near-complete Dusk behavior on Windows from a fresh verified backup.
Prefer current maintained plugin releases. Fix small compatibility failures;
replace or document large failures. Preserve mobile-declared components and
mobile companion notes, but defer physical Android claims to user testing.

FNS remains sole live sync, attachments remain normal vault files, optional FNS
storage remains disabled, and Notion remains byte-identical.
