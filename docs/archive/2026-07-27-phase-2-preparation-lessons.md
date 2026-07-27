# Phase 2 Preparation historical lessons

Status: historical synthesis. These observations identify future tests; none
passes a current desktop, Android, plugin, or promotion gate.

## Source behavior worth preserving

- Easy/manual first-open setup and populated `Dusk_light` behavior.
- PARA/ZETA split; Home, Map of Content, and Mail Box surfaces.
- Page tasks and area/project family relationships.
- Daily, weekly, monthly, project, area, resource, fleeting, permanent,
  meeting, workstation, and `STICKY` creation. Archives use move-and-restore
  semantics for completed Project/Area Family folders, not direct note creation.
- Canvas and Excalidraw files belong under the Concept Map resource path and
  require create/save/reopen tests.
- Dynamic actions, templates, hotkeys, search, desktop/mobile Home, and mobile
  sorting.
- Exact source families also include contacts, three meeting templates,
  documentation, concept maps, workstation notes, `STICKY`, and `SYSTEM`.
  Quarterly and yearly folders exist without author-supplied templates.

## Visual method

- Maximize desktop Obsidian and verify native desktop/tablet resolution.
- Capture a screenshot before leaving each checkpoint.
- Scroll vertical and horizontal surfaces completely.
- Use editing/source mode to inspect configuration and reading view to judge
  rendered behavior.
- Navigation can reopen a note in editing mode. Re-select reading view for every
  rendered check, wait at least five seconds and until layout movement stops,
  then capture top, bottom, and horizontal extremes. Pixel dimensions alone do
  not prove that desktop Obsidian is maximized.
- Inspect full templates and every section, not recent files or Home alone.

## Android and plugin risks to retest

- Initial import may disable compatible plugins; update first, then retry each
  plugin except proven desktop-only or unsafe plugins.
- Android daily new-note creation previously failed around template/Journals/
  Templater behavior. Test it first, then weekly and monthly creation.
- Historical post-update state contained a configured Journals schema-v3 daily
  journal. The disconnected-note warning therefore did not prove missing
  configuration. Seven external controls still used a removed Journals 1.x
  command ID; verify current registered IDs before replacing anything.
- Three specific-file hotkeys and one Templater hotkey were stale. Templater
  also exposed a whole-vault picker and created `Untitled.md` in the current
  monthly folder. Treat command, destination, naming, and cleanup as separate
  assertions.
- Dataview JavaScript queries were disabled in one observed Android state;
  verify actual current setting rather than importing stale configuration.
- DatacoreJS appeared promising on tablet but lacked complete verification.
- Plugin command and hotkey identifiers drift across versions.
- Historical Home ribbon/buttons failed navigation; both Home variants exposed
  malformed Todoist directives. Full Android Home showed clipping/error-like
  content, and wide tables overflowed horizontally.
- Four request hosts remained unattributed. Absence of an idle request did not
  prove BRAT, Share Note, Todoist, or other gated plugins offline-safe.
- Refresh current Dusk GitHub and Discord extension changes before choosing a
  plugin set.

## Language, performance, and execution risks

- Historical evidence supports English machine keys, controlled tags, exact
  paths/commands, and ISO dates with source-language prose and cross-language
  aliases as a provisional test strategy. Normal Android create/save/search,
  Unicode automation, collation, and URI round trips remain unproved.
- ADB or PowerShell mojibake is not proof of filename corruption; compare bytes,
  lengths, and hashes through Unicode-aware APIs.
- Historical Android readiness windows and Mali/WebView allocation warnings are
  regression questions only. Define fresh cold/warm readiness and interaction
  measurements on the actual tablet.
- `datacorejsx`, DataviewJS, JS Engine, QuickAdd scripts, and Templater make
  vault notes executable. Review imported code before reading-mode execution.
- Keep FNS Configuration Sync disabled; any later configuration-sync test needs
  separately approved isolated synthetic scope. After a plugin migration,
  restore a whole checkpoint; downgrading only `main.js` is insufficient.

## Operational preparation inputs

- Test Mobile Home on Android, including correct Homepage selection, complete
  vertical/horizontal rendering, navigation, and dynamic actions.
- Test or explicitly gate Custom Sort's one-time mobile `Sort on` command and
  verify order after reload.
- Test page-task state transitions, Mail Box visibility, and project/meeting
  status restoration. Test area/project connections on populated reference
  notes before customization.
- Defer exact full-only plugin deltas unless a proven `Dusk_light` gap invokes
  the bounded full-Dusk escalation rule.
- Gate Discord/GitHub additions until current provenance, release, issues,
  dependencies, executable/write behavior, and device compatibility are
  verified. Pomodoro and visual-style preferences remain later personalization.

## Residual evidence gaps

- The audit did not semantically inspect 39 old screenshots. Image-derived
  completeness is unproved. Old images stay historical; every reported visual
  defect must become a fresh native regression row in the traceability contract.
- Values from 555 plugin `data.json` files are unavailable in the sanitized
  corpus. Replace them with fresh in-app settings inspection, manifest/version
  capture, approved-plugin load verification, and explicit safe-field repair.
- Values from 90 raw logs are unavailable. Replace them with a fresh bounded
  attribution test for each approved network-capable plugin.
- Values from 331 browser-profile files are unavailable and not applicable
  unless an approved workflow explicitly depends on browser state.
- Never reconstruct a missing value from summaries or use historical evidence
  as proof of current behavior.

## Evidence and safety

- Identify exact source, candidate, device, mode, checkpoint, and timestamp.
- Record actual plugin load state and relevant settings after updates.
- Use disposable vaults and synthetic notes only.
- Restore or discard every synthetic write with proof.
- Exclude credentials, plugin `data.json` secrets, personal notes, source
  mutation, `G:\Obsidian`, and FNS changes.

## What stays historical

PR #4, PR #7, old screenshots, packages, patches, dashboards, contact sheets,
validators, and five-agent orchestration remain archive material. Future agents
may reuse questions and regression ideas, not old acceptance conclusions.
