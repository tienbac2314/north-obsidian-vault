# Dusk Goal 1 preflight

Date: 2026-07-25  
Status: passed for discovery

## Outcome

Goal 1 may proceed in disposable Windows and physical-Android copies. Repository,
source, storage, Obsidian, research, browser, custom-agent, ADB, screenshot,
UI-tree, log, and filesystem prerequisites are available. No live-vault or
source-bundle mutation occurred.

## Repository safety

- Pull request [#6](https://github.com/tienbac2314/north-obsidian-vault/pull/6)
  is merged into `main` at `571fde4`.
- Local `main` was fast-forwarded to exact `origin/main` before work began.
- User-owned untracked `.superpowers/` remains untouched in repository root.
- Goal 1 uses isolated worktree
  `.worktrees/dusk-goal1-discovery` on branch
  `docs/dusk-goal1-discovery`.
- Baseline Markdown links, link-checker regression, vault initializer, secret,
  Mermaid, and whitespace checks passed from clean `origin/main`.

## Fixed roots

| Purpose | Exact root | Boundary |
| --- | --- | --- |
| Sole PC source authority | `C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master` | Read-only |
| Raw evidence and Windows disposables | `G:\Dusk-Goal1-Discovery-20260725` | New Goal 1 files only |
| Live vault | `G:\Obsidian` | No Goal 1 writes or promotion |
| Tablet source authority | `/sdcard/Documents/dusk-obsidian-vault-master` | Read-only |
| Planned tablet disposables | `/sdcard/Documents/Dusk-Goal1-Disposable-20260725` | New Goal 1 files only |

`G:` had 271.30 GiB free during preflight. The PC source bundle contains
293,256,520 bytes, so the selected volume has headroom for baselines, update
copies, screenshots, logs, and rollback checkpoints. A create, hash, and exact
sentinel-delete test passed inside the raw evidence root.

## Source and secret boundary

The [source manifest](../../research/2026-07-25-dusk-source-manifest.md) records 1,571 files,
421 directories, and the top-level variants and additions. A conservative rule
excluded 146 files and 1,310,186 bytes from byte reads:

- `.obsidian/todoist-token`;
- every community-plugin `data.json`;
- every path segment containing token, secret, credential, password, API-key,
  or auth terms.

Excluded paths were counted through filesystem metadata only. Their contents
were not opened, hashed, copied, printed, or committed.

PC and tablet each contain 1,571 files and 293,256,520 bytes. Their 1,425
non-sensitive file rows match exactly after normalizing two ADB-rendered curly
apostrophes by unique variant, byte-length, and SHA-256 identity. Both canonical
safe manifests hash to:

```text
D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB
```

This proves equality only for safe rows. It deliberately makes no byte claim
about excluded sensitive/configuration files.

## Obsidian and diagnostics

| Check | Result |
| --- | --- |
| Windows executable | `C:\Users\TienBac\AppData\Local\Programs\Obsidian\Obsidian.exe` |
| Windows version | `1.12.7` |
| Windows process | Running with one visible Obsidian window |
| Global log | `%APPDATA%\obsidian\obsidian.log` exists and is readable |
| Android package | `md.obsidian` |
| Android version | `1.12.7`, version code `303` |

Current global logs may mix earlier vault activity. Runtime evidence must use a
bounded timestamp window and sanitize paths, identifiers, endpoints, and note
text before repository use. Desktop screenshots begin only after a disposable
vault is visible; the current live-vault window must not be captured.

## Physical Android

| Property | Observed value |
| --- | --- |
| ADB executable | `C:\Program Files (x86)\Minimal ADB and Fastboot\adb.exe` |
| ADB state | One authorized physical device |
| Reported model | `TrebleDroid with GApps` |
| Manufacturer property | `unknown` |
| Android | `14` |
| Physical display | `1200x2000` |
| Density | `240 dpi` |
| Rotation settings | User rotation `0`; accelerometer rotation enabled |
| Shared storage | 77 GiB total, 69 GiB available |

`/sdcard/Documents` and `/storage/emulated/0/Documents` returned the same
filesystem device and inode. Relevant source appears at the first path.
Separate `Obsidian/FNS Pilot` content exists under Documents and is outside
Dusk discovery scope.

Read-only access checks passed for:

- `adb shell`;
- package/version queries;
- `screencap` without returning current screen pixels;
- `uiautomator dump` through one temporary file removed immediately;
- logcat buffer metadata.

Raw screenshots and logs remain outside Git. Device serial and account
identifiers are intentionally omitted.

## Research and browser routes

- Agent Reach GitHub uses `gh CLI`.
- Reddit uses OpenCLI.
- YouTube uses `yt-dlp`.
- Forum evidence can use V2EX public API.
- RSS uses `feedparser`.
- General web pages use Jina Reader.
- Exa semantic search is not configured. This is not blocking because official
  GitHub, web, forum, RSS, Reddit, and YouTube routes are available.
- In-app Browser binding connected successfully.
- Network access passed through GitHub, Agent Reach, NotebookLM, and Browser
  setup checks.

NotebookLM CLI `0.7.3` reauthenticated through `notebooklm login`. Live token
fetch passes. Both fixed notebooks exist and are owned by the current account:

- broad source-discovery notebook
  `8ce765d2-f356-43a0-8717-e29975e6b257`;
- lean adversarial notebook
  `c1fd2c71-0e8f-47c7-97ed-22e4f5f989ae`.

NotebookLM remains evidence, not authority. Every material claim requires
independent verification.

## Project agents

All five `.codex/agents/*.toml` files parse with required name, description,
and developer instructions. Registered roles and intended lanes are:

| Agent | Model | Declared sandbox | Goal 1 lane |
| --- | --- | --- | --- |
| `dusk-source-inventory` | `gpt-5.6-luna`, low | read-only | Source and variant comparison |
| `obsidian-plugin-auditor` | `gpt-5.6-terra`, medium | read-only | Current plugin evidence |
| `obsidian-visual-qa` | `gpt-5.6-luna`, medium | read-only | Screenshot comparison |
| `dusk-runtime-debugger` | `gpt-5.6-terra`, high | workspace-write | Assigned disposable failure only |
| `dusk-release-reviewer` | `gpt-5.6-sol`, high | read-only | Final independent verdict |

Per-agent sandbox remains a defensive declaration; parent permission and exact
task packet still govern effective access. Goal 1 grants no writer access to
source bundle, tablet source, or live vault.

## Preflight verdict

`PASS`

Discovery may begin. Runtime gates remain:

- clone only sanitized disposable copies;
- disable every sync, sharing, publishing, and external-writer path before
  first open;
- preserve untouched first-open baselines;
- apply updates only in duplicates with manifests and rollback checkpoints;
- keep every current-authority decision provisional until final Goal 1 report
  and independent review.

