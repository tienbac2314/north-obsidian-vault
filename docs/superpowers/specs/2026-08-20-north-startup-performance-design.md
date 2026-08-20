# North Startup Performance Design

## Goal

Reduce North cold-start delay on Windows and Android without delaying the
plugins that render or create North's core experience.

## Current evidence

- Live North: `G:\Cua Bac\North`.
- Obsidian `1.13.6` opens Homepage, but the settled workspace appeared about
  26 seconds after a controlled launch.
- North has 43 enabled community plugins.
- Lazy Loader `1.0.24` is installed and mobile-capable, but its current
  configuration marks nearly every plugin `instant`, so it is not providing
  useful deferral.
- Custom Frames is disabled in `community-plugins.json`; its old plugin
  directory remains as inert recoverable residue.
- On-Demand `3.4.6` is current, mobile-capable, and supports four modes:
  on-demand, layout-ready, always enabled, and always disabled.

## Decision

Test On-Demand as the only plugin startup manager. Do not run Lazy Loader and
On-Demand together because both intercept plugin activation and would make
startup behavior harder to reason about.

Keep these early because North depends on them for its first screen, note
rendering, creation, navigation, sync, or persistent layout:

`homepage`, `datacore`, `obsidian-tasks-plugin`, `simple-checklist`,
`templater-obsidian`, `obsidian-meta-bind-plugin`, `js-engine`, `journals`,
`notebook-navigator`, `note-toolbar`, `quickadd`, `fast-note-sync`, `tabs`,
`obsidian-hider`, `obsidian-style-settings`, `obsidian-minimal-settings`,
`editing-toolbar`, and `hide-commands-in-menu`.

Start with layout-ready for noncritical plugins that may own background hooks
or file watchers. Use on-demand only for plugins whose command, view, or file
trigger is enough to load them safely. Never move Datacore or any inline-view
owner to on-demand: On-Demand documents that inline or embedded views are not
supported.

## Safety and rollback

- Make a full ZIP of North before changing plugin state.
- Build a disposable copy from that exact North state.
- Configure and measure the disposable first.
- Preserve Lazy Loader files and its prior config in the backup; do not delete
  the old plugin until promotion passes.
- If any core flow fails, restore `community-plugins.json`, loader config, and
  plugin folders from the backup and reopen North.

## Acceptance

Accept only if the disposable shows a materially shorter settled startup,
Homepage renders without source-code leakage or dependency errors, and the
following remain usable: project/area creation, template rendering, Meta Bind
date and connection controls, Tasks and Simple Checklist, Journals period
navigation, Notebook Navigator, Note Toolbar, and the normal File Explorer.
Repeat the same checks on an Android disposable. Report mobile support as
disposable evidence only unless live Android North is actually synced.

## Sources

- [On-Demand community page](https://community.obsidian.md/plugins/on-demand-plugins)
- [On-Demand source repository](https://github.com/22-2/obsidian-on-demand-plugins)
- [Lazy Loader community page](https://community.obsidian.md/plugins/lazy-plugins)
- [Lazy Loader source repository](https://github.com/alangrainger/obsidian-lazy-plugins)
