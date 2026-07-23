# Phase 2 Windows implementation evidence

Date: 2026-07-24

Status: Windows Phase 2 setup and Phase 2.5 customization implemented. Physical
Android customization checks and Release 2 four-week human observation remain
open.

This file records observed implementation results. Product authority remains in
the linked design, decision, and roadmap modules.

## Recovery boundary

Before customization, a recovery copy was created outside the live vault and
repository:

```text
G:\Obsidian Backups\phase-2-pre-customization-20260724-015031
```

The copied vault contains 312 files and 64,804,031 bytes. Source and backup
manifests are byte-identical; each manifest SHA-256 is
`F65951FC44866EF83D5359F4A842DF45357A10D8C4648B12CB41CF7854C10D89`.
The retired Importer plugin is stored beside that immutable vault copy under
`retired-plugins`, not inside the active vault.

The Notion preservation baseline contains 164 files and 1,095,124 bytes.
Post-change comparison found no path, length, or SHA-256 difference. Its
manifest SHA-256 remains
`AAD7631CB063E27CA1357F2DE068FBE1DA0CAF57525E0AFCC9C272E98A2C4D36`.

## Applied workspace

Repository-owned starter files now provide:

- `HUB/Home.md`, with a Markdown fallback and three core Base embeds;
- Projects, Learning, and Review Queue Bases;
- optional Daily, Weekly, Literature, Permanent, Project, and Meeting
  templates with small properties;
- one shallow root folder-order specification;
- one small dashboard CSS snippet;
- updated human and agent operating guidance.

Live Obsidian configuration uses:

| Component | Version | Startup | Purpose |
|---|---:|---|---|
| Fast Note Sync | 2.4.0 | Instant | Sole live note and attachment transport |
| Homepage | 4.4.4 | Instant | Open `HUB/Home.md` in Reading view |
| Minimal theme | 8.2.2 | Native theme load | Low-clutter presentation |
| Minimal Theme Settings | 8.2.3 | Instant | Small maintained Minimal controls |
| Custom File Explorer sorting | 3.1.6 | Instant | Shallow top-level order |

Each downloaded file matched the SHA-256 digest published with its exact GitHub
release asset. All retained community plugins declare desktop and mobile
support. Importer `1.8.12` and tested Lazy Loader `1.0.24` are absent from
enabled and installed active runtime.

Core Search, Bases, Templates, Properties, Daily Notes, Bookmarks, Backlinks,
File Recovery, and normal Markdown links remain the behavior layer. No
Dataview, Datacore, Templater, attachment-offload plugin, Google Drive bridge,
second sync engine, or external vault writer was added.

## Runtime observations

Obsidian `1.12.7` was launched with a local debugging endpoint for read-only
runtime inspection. Observed results:

- active file was `HUB/Home.md`;
- FNS, Homepage, Minimal Theme Settings, and Custom Sort loaded;
- Importer and Lazy Loader were neither installed nor loaded;
- Minimal theme, hidden Minimal status bar, and dashboard snippet were active;
- three Base sources rendered with no visible error view;
- Custom Sort parsed its rule and applied this exact root folder order:
  `HUB`, `STAGING`, `DAILY`, `PARA`, `ZETA`, `Notion`, `SYSTEM`;
- unmanaged root files remained after ordered folders and no path was moved.

Initial short-delay testing found Custom Sort loaded after three seconds but did
not automatically parse or apply because its initial layout hook had already
passed. Manual activation worked. Configuration was corrected to instant
startup, and a clean relaunch then parsed and applied the order automatically.
Every other retained plugin also requires instant behavior. Lazy Loader was
therefore removed rather than kept as an idle manager.

FNS Configuration Sync restored the first local removal of disabled Importer
and Lazy Loader folders from its remote configuration state. Both folders were
removed again while FNS was connected so normal `SettingDelete` synchronization
could record the deletion. A later FNS-connected relaunch did not restore them.
Recovery copies remain outside active vault.

## Startup measurement

Metric is process launch to nonzero main-window handle. It does not measure
first editor interaction, background sync completion, or Android startup.

| State | Trial 1 | Trial 2 | Trial 3 | Median | Mean |
|---|---:|---:|---:|---:|---:|
| Before | 1,020 ms | 901 ms | 898 ms | 901 ms | 940 ms |
| After | 973 ms | 841 ms | 825 ms | 841 ms | 880 ms |

Three trials are too small for a general performance claim. Final result shows
no obvious launch regression and needs no loader to stay near one second.

## FNS safety checks

- Public HTTPS health returned healthy.
- Windows FNS plugin loaded during runtime inspection.
- Secret-bearing FNS plugin configuration SHA-256 stayed unchanged across
  customization; file content was not printed.
- FNS remained first-class instant startup and sole live transport.
- Deployment contract tests passed after making line-end assertions accept
  Windows CRLF without weakening placeholder requirements.
- Existing Phase 1 evidence already covers Windows full sync, two-version
  history, recycle-bin restore, and native SVG attachment recovery.

This phase did not repeat destructive history/trash tests against the now
personal vault. It also did not claim a new cross-device convergence result
after the Android cable was removed. Physical Android homepage, order,
templates, attachment, offline, history, trash, and startup checks remain
explicit.

## Rollback

Small rollback:

1. remove affected plugin ID from `.obsidian/community-plugins.json`;
2. clear `cssTheme` or disable `dashboard` CSS snippet;
3. keep Markdown, Bases, templates, and normal attachments unchanged.

Full rollback:

1. close Obsidian;
2. preserve current vault separately for diagnosis;
3. restore verified pre-change `vault` directory from recovery copy;
4. compare restored manifest before opening Obsidian;
5. retain FNS service state and surviving peer until empty-replacement risk is
   excluded.

No rollback requires Google Drive, another sync engine, or Dusk's old plugin
runtime.

## Remaining evidence

- Physical Android customization smoke matrix.
- Four-week bounded personal human-use observation.
- Independent recurring backup destination, cadence, retention, and restore
  spot-check.
- Any later Hermes proposal transport or FNS API decision.

See [Phase 2 roadmap](../roadmap/phase-2-customization.md),
[accepted decision DEC-036](../decisions/decision-log.md), and
[research review](2026-07-24-phase-2-customization.md).
