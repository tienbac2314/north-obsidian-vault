# Dusk Goal 1 correction ledger

Date: 2026-07-25

## Purpose

Record only sanitized, reviewable corrections made while resolving the active
Dusk Goal 1 blockers. Raw screenshots, recordings, manifests, logs, device
identifiers, private note content, credentials, and disposable vault copies
remain outside Git under the approved evidence root.

This ledger does not authorize Goal 2 personalization, source-vault changes,
live promotion, or acceptance of an unresolved defect.

## Recording rules

For every correction:

1. reproduce the failure before changing configuration or content;
2. identify the exact disposable vault, platform, command, and affected path;
3. separate observed fact, inference, correction, and verification;
4. record only non-secret fields and sanitized excerpts;
5. link the external evidence location without copying raw evidence into Git;
6. restore synthetic mutations and verify the applicable checkpoint;
7. commit the correction and its evidence record as one logical change.

Do not record credential values, private endpoints, account identifiers, raw
network logs, source plugin `data.json`, or private note bodies.

## Blocker status

These IDs mirror `docs/active-goal.md`; the active goal remains scope authority
if wording ever drifts. This table tracks status only.

| ID | Blocker | Status | Latest evidence | Remaining condition |
| --- | --- | --- | --- | --- |
| 1 | Android daily-note creation | Pending | Checkpoint comparison and historical runtime evidence | Reproduce the user-visible failure fresh on Android, correct it, restart, and verify on both platforms |
| 2 | Creation workflow for every default root | Blocked by 1 | Not yet recorded | Complete the command-template-destination matrix on both platforms |
| 3 | Supplied Discord and GitHub runtime changes | Pending | Not yet recorded | Verify exact runtime and write behavior for each named addition |
| 4 | Request-host attribution | Pending | Not yet recorded | Establish initiators without hostname-only inference |
| 5 | Android Home rendering and overflow | Pending | Not yet recorded | Capture complete vertical and horizontal evidence and correct defects |
| 6 | Home ribbon and navigation | Pending | Checker reports stale `Map of Contents` and `Inbox` specific-file bindings plus legacy Journals navigation commands | Reproduce intended controls, replace or remove stale bindings, and verify corrected navigation |
| 7 | Todoist configuration rendered on Home | Pending | Both Home source files contain the joined directive | Correct both desktop and mobile fallback behavior and verify with Todoist gated |
| 8 | QuickAdd, Meta Bind, Mail Box, timeline, and other writes | Pending | Checker reports stale `toggle_todo_revert.md-new-tab` and Templater `insert-` bindings | Exercise synthetic writes, correct or remove stale bindings, and restore every mutation |
| 9 | Independent release verdict | Blocked by 1-8 | Not yet recorded | Repository checks pass and reviewer returns exactly `PASS` |

Use only these status values: `Pending`, `Reproduced`, `Corrected`, `Verified`,
`Blocked`, or `Explicitly accepted by user`.

## Historical evidence triage summary

Keep the detailed artifact manifest outside Git. Record only sanitized run-level
classifications here.

| Run or evidence set | Classification | Narrow claim supported | Superseded by | Notes |
| --- | --- | --- | --- | --- |
| Root `screenshots` set (39 captures) | Diagnostic-only | Early startup, plugin, and surface observations | Pending fresh acceptance pass | All captures predate 2026-07-25 06:00; several desktop windows are not maximized |
| `safe-rerun/screenshots` (71 captures) | Diagnostic-only | Safe-copy startup and isolated plugin observations | Pending fresh acceptance pass | Includes editing-mode/raw-source and incomplete traversal captures |
| `functional-rerun/screenshots` (54 captures) | Diagnostic-only | Reading-render, workflow, and plugin-gate observations | Pending fresh acceptance pass | Some Android reading captures are useful, but full traversal and current-state provenance are incomplete |
| `workflow-rerun` visual evidence (25 captures) | Diagnostic-only | Six maximized Windows reading surfaces plus workflow setup state | Pending fresh acceptance pass | Does not cover Home, Map, or Mail Box completely; one Android Home artifact is unreadable |
| Checkpoints, logs, and manifests | Accepted for narrow recorded claims | Version/configuration transitions, file-state comparisons, and bounded reproductions | Not applicable | Do not generalize beyond the exact checkpoint or configuration |

## Correction entries

Add one subsection per logical correction. Keep the identifier stable in commit
messages and review comments.

### CORR-001: Android daily-note creation

Status: `Pending`

Observed fact:

- Both variants use Journals 1.4.3 before update. Their enabled legacy daily
  section points to `DAILY/DAILY` and the daily template, but its `dateFormat`
  is empty.
- Both post-update checkpoints use Journals 2.1.10 schema version 3. They contain
  a configured `personal daily` journal with `dateFormat` `YYYY-MM-DD`, the same
  destination and template, and an `Open today's note` command.
- Desktop Home, Mobile Home, four Note Toolbar items, and the configured
  hotkey still reference the removed Journals 1.x ID
  `journals:journal:calendar:open-day` after update.
- Both `HUB/Homepage.md` and `SYSTEM/MOBILE HUB/Mobile Homepage.md` join the
  Todoist `project` and `limit` directives on one line.
- Historical reading-view evidence shows the daily fixture reporting `Note is
  not connected to a journal`.
- The first workflow checker parsed only the Journals 1.x schema and therefore
  incorrectly reported that the post-update configuration had no daily journal.
- The corrected 23-case checker passed on Windows and reported 13 failures
  across 160 checks in the current disposable: seven stale Journals references,
  three stale specific-file hotkeys, one obsolete Templater hotkey, and two
  malformed Home Todoist directives.

Reproduction:

- Checkpoint comparison:
  `G:\Dusk-Goal1-Discovery-20260725\workflow-rerun\evidence\dusk-config-checkpoint-comparison-20260725-222956.txt`.
- Current Windows disposable:
  `G:\Dusk-Goal1-Discovery-20260725\goal1-current\Dusk_light-daily-repro-20260725-223128`.
- Fresh physical-Android command reproduction: pending.
- Expected destination and template are established statically; final filename,
  frontmatter, rendered output, and journal connection still require runtime
  verification.

Inference:

- The plugin update changed Journals configuration and command-ID schemas. The
  seven stale external command references are a confirmed compatibility defect.
- The disconnected-note warning may be a separate indexing, naming, or journal
  matching defect. Its cause is not established by the configuration files.

Correction:

- Repository checker updated to validate both the legacy calendar schema and
  Journals 2.x schema version 3, including template arrays and current
  journal-command IDs.
- Vault correction is pending fresh Android reproduction. Do not copy an older
  Journals `data.json` wholesale.

Verification:

- The 23-case Windows suite passed before this review. Regression coverage now
  also includes configured and stale specific-file and Templater hotkeys; the
  expanded 28-case suite requires a fresh Windows rerun.
- Windows and physical-Android runtime correction: pending.
- Restart, search, navigation, rendered output, and journal connection: pending.
- Synthetic mutation cleanup and source/live/user-vault invariants: pending.

Commit:

- Not yet recorded.

### CORR-006: stale non-Journals hotkeys

Status: `Pending`

Observed fact:

- `.obsidian/hotkeys.json` contains three specific-file commands that are not
  present in the plugin's configured file list:
  `SYSTEM/TEMPLATE/CODE/toggle_todo_revert.md-new-tab`,
  `HUB/Map of Contents.md`, and `HUB/Inbox.md`.
- The configured current targets include `HUB/Map of Content.md` and
  `HUB/Mail Box.md`; do not infer that these are intended replacements without
  runtime confirmation.
- The Templater hotkey uses
  `templater-obsidian:insert-SYSTEM/TEMPLATE/CODE/toggle_todo.md`, while the
  installed Templater version registers the enabled template path directly as
  `templater-obsidian:SYSTEM/TEMPLATE/CODE/toggle_todo.md`.

Correction:

- Pending bounded UI reproduction and field-by-field replacement or removal in
  the current disposable. Do not copy a whole hotkey or plugin configuration
  from a checkpoint.

Verification:

- Confirm each intended binding in Obsidian's command registry and exercise it
  on Windows and physical Android where applicable.
- Rerun the workflow checker and the expanded 28-case regression suite.

Commit:

- Not yet recorded.

## Creation matrix

Populate this table before executing blocker 2. Add rows rather than replacing
required roots with a generic picker test.

| Platform | Variant | Visible command | Command ID | Template | Expected root | Expected output | Writes | Result | Evidence | Cleanup |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Windows | Pending | Pending | Pending | Pending | `DAILY` | Pending | Pending | Pending | Pending | Pending |
| Windows | Pending | Pending | Pending | Pending | `HUB` | Pending | Pending | Pending | Pending | Pending |
| Windows | Pending | Pending | Pending | Pending | `PARA` | Pending | Pending | Pending | Pending | Pending |
| Windows | Pending | Pending | Pending | Pending | `STICKY` | Pending | Pending | Pending | Pending | Pending |
| Windows | Pending | Pending | Pending | Pending | `SYSTEM` | Pending | Pending | Pending | Pending | Pending |
| Windows | Pending | Pending | Pending | Pending | `ZETA` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `DAILY` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `HUB` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `PARA` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `STICKY` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `SYSTEM` | Pending | Pending | Pending | Pending | Pending |
| Android | Pending | Pending | Pending | Pending | `ZETA` | Pending | Pending | Pending | Pending | Pending |

## Restoration log

| Test ID | Disposable vault | Mutation | Restoration method | Manifest or checkpoint | Result | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| Pending | Pending | Pending | Pending | Pending | Pending | Pending |

## Validation summary

Record exact commands and results. Do not convert an unrun check into a pass.

| Command | Result | Notes |
| --- | --- | --- |
| `powershell -NoProfile -File scripts/check-markdown-links.ps1` | Not run | Pending final repository state |
| `powershell -NoProfile -File scripts/test-markdown-links.ps1` | Not run | Pending final repository state |
| `powershell -NoProfile -File scripts/test-initialize-vault-template.ps1` | Not run | Pending final repository state |
| `powershell -NoProfile -File scripts/check-secrets.ps1` | Not run | Pending final repository state |
| `powershell -NoProfile -File scripts/check-mermaid.ps1` | Not run | Pending final repository state |
| `powershell -NoProfile -File scripts/check-dusk-workflow-config.ps1 -VaultPath <restored-disposable-vault> -ExpectedDailyDateFormat <verified-format>` | Not run | Supply the exact format only after reproduction establishes the intended configuration; target the restored disposable, not source or live vaults |
| `powershell -NoProfile -File scripts/test-dusk-workflow-config.ps1` | Not run | Required when the Dusk workflow checker changes |
| `git diff --check` | Not run | Pending final repository state |
| `git status --short` | Not run | Pending final repository state |

## Release review

Reviewer: not yet recorded.

Evidence reviewed: not yet recorded.

Findings: not yet recorded.

Verdict: `BLOCK` until an independent reviewer returns exactly `PASS`.
