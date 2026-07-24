# Dusk language strategies

Date: 2026-07-25

Status: Goal 1 analysis. Language policy remains unselected.

## Current evidence

- User context: English around B2 and most SWE study material is English;
  Vietnamese is native and dominates everyday explanation; older Notion notes
  include substantial Vietnamese.
- Obsidian's official
  [Language settings](https://github.com/obsidianmd/obsidian-help/blob/a97de34c1a9f2381586f4f51070aeb9207c8a457/en/User%20interface/Language%20settings.md)
  allow interface language changes in Settings, and the official locale list
  includes
  [Tiếng Việt](https://github.com/obsidianmd/obsidian-help/blob/a97de34c1a9f2381586f4f51070aeb9207c8a457/scripts/locales.json).
- Interface translation does not translate community-plugin labels,
  user-authored templates, query code, properties, paths, or existing notes.
  Dusk's plugin/runtime surfaces are predominantly English.
- Official
  [alias guidance](https://github.com/obsidianmd/obsidian-help/blob/a97de34c1a9f2381586f4f51070aeb9207c8a457/en/Linking%20notes%20and%20files/Aliases.md)
  explicitly supports referring to a note in another language.
- Official
  [Properties guidance](https://github.com/obsidianmd/obsidian-help/blob/a97de34c1a9f2381586f4f51070aeb9207c8a457/en/Editing%20and%20formatting/Properties.md)
  says the date picker follows operating-system date/time format.
- A physical Android fixture stored `created: 2026-07-25` while Properties
  displayed `07/25/2026`. Machine storage and visible display can therefore be
  separated without changing the property value.
- Android rendered `Goal1 Locale Tiếng Việt`, `Tiếng Việt + English`, and
  Vietnamese prose without glyph or filename clipping. Gboard offered both
  English (US) and Vietnamese (Vietnam) input.
- Existing English core-search terms returned results. A newly created
  Vietnamese fixture did not appear in captured `Tiếng` or English-body
  searches; indexing/timing and URI creation are confounders. This is an
  unresolved test, not evidence against Vietnamese.

## Contracts that should not be translated casually

Source Dusk hard-codes or queries:

- `Date_Created`, `Due_Date`, `Priority_Level`, `Status`, `connections`,
  `page_task`, and task/Eisenhower fields;
- `HUB`, `DAILY`, `PARA`, `ZETA`, `SYSTEM`, template, and component paths;
- exact tag and folder strings;
- QuickAdd choice IDs and configured destinations;
- Datacore/Dataview field names;
- Templater expressions and JavaScript constants;
- CSS classes, callout identifiers, and plugin command IDs.

Renaming a visible heading is usually local presentation. Renaming these
machine-facing values changes queries, scripts, template output, navigation,
or existing note schemas. Case changes can also create inconsistent property
types or missed queries.

## Filenames, aliases, tags, and sorting

- Windows NTFS and Android shared storage preserved Vietnamese UTF-8
  filenames and content in the physical probe.
- ADB and Windows PowerShell displayed two curly-apostrophe paths as mojibake
  even though length/hash evidence matched. Automation must operate on
  Unicode-aware APIs and hashes rather than scraped console text.
- Vietnamese filenames are viable, but external scripts, URI encoding, Git,
  sync, and custom sort rules need exact Unicode tests.
- Cross-language aliases are safer than duplicating or renaming the same note.
- Tags and properties used by queries should remain a stable controlled
  vocabulary. Vietnamese display labels can map to English machine values.
- Alphabetical order of accented Vietnamese text depends on the app/plugin and
  locale. Custom Sort rules need an explicit test; do not promise Vietnamese
  collation from ordinary Unicode ordering.

## Template implications

A fully bilingual template duplicates every heading, instruction, and button,
increasing capture friction and migration work. A lower-cost split is:

- stable English keys, paths, tags, code, and ISO dates;
- one selected user-facing language per template;
- optional short translation hints or aliases;
- prose in the language that best fits the source and thinking task.

Visible labels can be translated later without rewriting stored property keys.
Executable template blocks must remain byte-reviewed during translation so
prose editing does not alter code.

## Three viable strategies

### Strategy A: English-first technical vault

- Obsidian UI, folders, templates, headings, properties, and most prose use
  English.
- Vietnamese Notion imports stay untouched and receive English aliases or
  summaries only when actively reused.

Benefits:

- closest match to SWE material, plugin documentation, Dusk source, and code;
- lowest query/template translation risk;
- encourages English practice.

Costs:

- higher friction for fast personal reflection;
- own-words understanding may become translation work instead of learning;
- older Vietnamese notes feel second-class.

### Strategy B: stable English machine layer, source-language prose

- Paths, property keys, tag vocabulary, code, and ISO dates stay English.
- English learning notes may remain English; Vietnamese explanations,
  reflections, and synthesis remain Vietnamese when that improves thought.
- Aliases bridge equivalent concepts; templates use one concise visible
  language rather than duplicating all labels.
- Obsidian UI can be English or Vietnamese independently.

Benefits:

- preserves plugin/query compatibility;
- matches real study sources while keeping Vietnamese thinking low-friction;
- avoids bulk translation of Notion history;
- permits gradual, evidence-based localization.

Costs:

- mixed-language search and naming need conventions;
- related notes may use different title languages;
- users must learn that visible labels and machine keys intentionally differ.

### Strategy C: Vietnamese-facing vault with English machine layer

- Obsidian UI, visible folder labels, template headings, and personal prose
  become Vietnamese.
- Property keys, tags consumed by code, component paths, commands, and ISO
  dates remain English.
- English technical terms stay English where Vietnamese wording would obscure
  the industry term.

Benefits:

- lowest everyday capture/review friction;
- consistent personal-facing experience;
- old Vietnamese Notion notes fit naturally.

Costs:

- continuous translation maintenance for Dusk/plugin features;
- screenshots/tutorials and plugin labels still mix English;
- folder-label localization can conflict with exact component paths unless a
  presentation layer or aliases are used;
- greater chance that a future editor translates a machine-facing contract.

## Provisional recommendation for Goal 2

Start with Strategy B. It is the only option that preserves Dusk's exact
machine contracts while treating both English SWE material and Vietnamese
own-words explanation as first-class. Keep:

- English property keys and controlled tags;
- ISO `YYYY-MM-DD` stored dates;
- English code, command IDs, and component paths;
- prose in source language, with Vietnamese favored for personal synthesis
  when it lowers friction;
- aliases for cross-language retrieval;
- no bulk translation of old Notion notes.

This is a recommendation to test, not an accepted policy. Goal 2 should create
two or three synthetic bilingual notes through normal desktop and Android
editing, then test core Search, Omnisearch if retained, aliases, tags, Custom
Sort, templates, links, FNS convergence, and round-trip filenames before
personal content uses the convention.

## Translation work safe to defer

- UI language choice;
- translation of visible template headings;
- aliases for notes not currently used;
- bilingual glossary for recurring SWE terms;
- Vietnamese summaries of English sources;
- localized date display;
- dashboard button labels.

Do not defer definition of machine property keys, tag vocabulary, date storage,
or path contracts once Goal 2 begins writing real notes; those choices create
migration cost.
