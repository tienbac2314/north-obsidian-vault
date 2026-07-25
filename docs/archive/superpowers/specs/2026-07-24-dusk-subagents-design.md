# Dusk subagents design

Status: historical. Do not reuse this five-agent orchestration. Current
ownership and subagent limits live in [active goal](../../../active-goal.md).
Date: 2026-07-24

## Objective

Keep Phase 2/2.5 requirements and decisions in the main agent while moving
large inventories, web research, screenshots, logs, and final review into
bounded subagent threads.

Agents are project-scoped under `.codex/agents/`. They must not become generic
personal agents or replace the main agent as coordinator.

## Constraints

- Keep Fast Note Sync as the only live synchronization authority.
- Never let a subagent promote changes into `G:\Obsidian`.
- Allow read-only agents to inspect explicitly assigned `G:\Obsidian` paths so
  raw vault details remain outside the main context.
- Preserve `Notion` and `SYSTEM/Media`.
- Never read, return, or copy `.obsidian/todoist-token` or other credentials.
- Use one writer against an explicitly assigned disposable vault or worktree.
- Keep all other agents read-only.
- Treat per-agent sandbox values as defensive defaults. Codex reapplies the
  parent turn's live permission mode to spawned agents, so run inventory,
  plugin, visual, and review phases under parent read-only mode. Run the
  debugger in a separate workspace-write turn.
- Return distilled evidence instead of raw logs, file bodies, or image bytes.
- Prefer Luna for clear repeatable work, Terra for synthesis and debugging,
  and Sol only for the high-value final gate.

## Reference findings

The design borrows four useful patterns from
[oh-my-opencode-slim](https://github.com/alvinunreal/oh-my-opencode-slim):

1. Specialists need narrow lanes and explicit delegation boundaries. Its
   [Explorer](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/src/agents/explorer.ts)
   and
   [Librarian](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/src/agents/librarian.ts)
   separate local discovery from current external research.
2. Raw visual inputs belong in a read-only observer thread. Its
   [Observer](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/src/agents/observer.ts)
   returns structured observations instead of loading image bytes into the
   orchestrator context.
3. A writer should receive complete accepted context and execute instead of
   restarting research. Its
   [Fixer](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/src/agents/fixer.ts)
   forbids research and nested delegation.
4. Routing text must stay concise because it is always visible to the
   orchestrator. Its
   [project-local customization guide](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/docs/project-local-customization.md)
   recommends short delegation guidance. Open issue
   [#838](https://github.com/alvinunreal/oh-my-opencode-slim/issues/838)
   also shows why a clear catalog description and detailed agent instructions
   are separate concerns.

Its current
[OpenAI preset](https://github.com/alvinunreal/oh-my-opencode-slim/blob/master/docs/openai-preset.md)
uses GPT-5.6 Luna medium for visual design work. Luna therefore fits the
read-only visual QA role; Terra is unnecessary there.

Codex uses standalone TOML files in `.codex/agents/` for tracked
project-scoped agents. Each file requires `name`, `description`, and
`developer_instructions`; it may also set model, reasoning effort, and
sandbox mode. See the current
[Codex subagent documentation](https://learn.chatgpt.com/docs/agent-configuration/subagents.md).

This repository will copy these principles, not OpenCode-specific background
job, prompt injection, companion, or preset machinery.

## Agent set

| Agent | Model and effort | Declared sandbox | Purpose |
| --- | --- | --- | --- |
| `dusk-source-inventory` | `gpt-5.6-luna`, low | read-only | Compare Dusk variants and sanitized vault/config manifests |
| `obsidian-plugin-auditor` | `gpt-5.6-terra`, medium | read-only | Check current plugin releases, v2 migrations, risks, and mobile support |
| `obsidian-visual-qa` | `gpt-5.6-luna`, medium | read-only | Inspect desktop/mobile screenshots and compare visible Dusk behavior |
| `dusk-runtime-debugger` | `gpt-5.6-terra`, high | workspace-write | Apply and verify bounded fixes only in an assigned disposable target |
| `dusk-release-reviewer` | `gpt-5.6-sol`, high | read-only | Independently decide whether a candidate may be promoted |

No custom orchestrator is needed. The main Codex agent retains requirements,
chooses accepted findings, assigns one writer, and performs live promotion.
The declared sandbox does not override a live parent permission choice.

## Common report contract

Every read-only agent returns:

1. `Outcome`: one sentence.
2. `Evidence`: exact local paths, versions, issue numbers, or URLs.
3. `Findings`: only decision-relevant facts, ordered by impact.
4. `Unknowns`: facts not established.
5. `Next action`: one bounded recommendation.

Reports must:

- avoid raw logs and full file bodies;
- avoid repeating task context;
- distinguish observed facts from inference;
- cap ordinary findings at 20;
- use `BLOCKED` when required evidence is unavailable;
- never create more subagents.

The main agent forwards only accepted findings to the writer. Read-only agents
do not communicate directly with the writer, so the workflow does not depend
on cross-thread messaging semantics.

## Agent contracts

### `dusk-source-inventory`

Delegate when source variants, plugin directories, settings, snippets, or
Discord deltas need comparison. Do not delegate simple reads with known paths.

Exclude credential files before reading or hashing. Return counts, hashes,
added/removed/changed paths, and configuration differences without returning
private file contents. Assigned live-vault inspection is allowed read-only.
Prefer metadata, manifests, and configuration topology over note bodies. Do not
recommend plugin upgrades.

### `obsidian-plugin-auditor`

Delegate current plugin checks, v2 or replacement research, maintenance
signals, compatibility, and security/mobile questions. Do not delegate local
vault comparison or implementation.

Prefer official plugin pages, repositories, releases, manifests, and issues.
Treat community reports as anecdotal. Return only changed, risky, blocked, or
decision-relevant plugins; omit routine unchanged plugins from the main
summary. The agent may inspect assigned live plugin manifests read-only, but
must not inspect credential-bearing plugin data without an exact safe-field
allowlist.

### `obsidian-visual-qa`

Delegate screenshots, image comparisons, narrow-layout inspection, and visible
desktop/mobile regression checks. Require exact image paths and named surfaces.

Extract exact visible error text. Compare reference, candidate, and platform
screenshots when supplied. Report severity, platform, surface, evidence, and
expected visible behavior. Do not edit CSS, settings, images, or notes. Do not
guess when screenshots are incomplete.

### `dusk-runtime-debugger`

Delegate only after the main agent supplies:

- disposable target root;
- allowed paths;
- accepted findings;
- expected behavior;
- verification commands or manual checks;
- rollback checkpoint.

Refuse targets under `G:\Obsidian`. Do not research, redesign, spawn agents,
commit, push, or broaden scope. Reproduce first, apply the smallest fix, run
narrow verification, and return changed paths plus evidence. Stop with
`BLOCKED` when the task packet is incomplete.

### `dusk-release-reviewer`

Delegate once after implementation evidence exists. Review source selection,
plugin decisions, candidate diff, Windows and Android results, secrets,
manifests, rollback, FNS boundaries, and Notion preservation.

Assigned live-vault manifests and verification evidence may be inspected
read-only. Private note bodies and secret values must not enter the report.

Lead with severity-ranked findings. End with one verdict:

- `PASS`
- `PASS WITH ACCEPTED DEFECTS`
- `BLOCK`

Do not implement or restart broad research.

## Orchestration sequence

1. Run source inventory and plugin audit in parallel when independent.
2. Main agent resolves source choice and accepted plugin decisions.
3. Capture baseline screenshots, then run visual QA.
4. End the read-only phase. Start a separate workspace-write turn and send one
   compact task packet to the runtime debugger.
5. Reuse that debugger thread for related fixes instead of spawning another.
6. Recapture screenshots and run visual QA against the baseline.
7. Run the release reviewer once.
8. Main agent performs any approved live-vault promotion and verification.

Parallel writers are forbidden. Reuse one specialist thread when its prior
context remains relevant; create a fresh thread when the task changes lanes.

## Files

Implementation adds only:

```text
.codex/agents/dusk-source-inventory.toml
.codex/agents/obsidian-plugin-auditor.toml
.codex/agents/obsidian-visual-qa.toml
.codex/agents/dusk-runtime-debugger.toml
.codex/agents/dusk-release-reviewer.toml
```

No new skill is justified. Existing research, browser, debugging, worktree,
verification, and review skills already provide procedures. A new skill would
duplicate them and increase loaded context. Reconsider only after repeated runs
identify a deterministic command or checklist missing from current skills.

## Verification

- Parse every TOML file.
- Confirm every file has required Codex agent fields.
- Confirm model names, efforts, and sandbox modes match this design.
- Confirm read-only agents contain no write authority.
- Confirm registration under a parent read-only override makes every spawned
  agent effectively read-only; do not claim per-agent sandbox isolation.
- Confirm the runtime debugger rejects the live vault.
- Confirm every description states both positive and negative routing.
- Scan prompts for placeholders, contradictory permissions, secrets, and
  unnecessary duplicated context.
- Start a fresh Codex task and confirm all five agent names appear.
- Forward-test one representative task per agent using raw artifacts.
- Run repository Markdown, secret, Mermaid, and whitespace checks.

## Validation record

Validation on 2026-07-24 established:

- Python parsed all five TOML files and confirmed exact names, models, efforts,
  descriptions, instructions, and declared sandbox defaults.
- Policy scans found four read-only defaults, one workspace-write default, and
  no placeholders.
- A fresh `codex exec --strict-config --ephemeral -s read-only` task loaded all
  five project agent names. Every child reported an effective read-only
  sandbox, confirming parent sandbox inheritance.
- Direct debugger smoke under a workspace-write parent reached the custom
  debugger and returned `BLOCKED` for an unsafe or incomplete packet.
- Full combined behavioral forwarding could not execute because a nested
  ephemeral Codex runner lost API connectivity before spawning agents. This is
  a runner limitation, not a passing behavioral result. Repeat representative
  forwarding in the future Phase 2 task before relying on these agents for
  live-vault promotion.

Repository Markdown links, link regressions, vault initialization, secret,
Mermaid, and whitespace checks passed before pull request publication.
Independent branch review is recorded in pull request evidence.

## Non-goals

- Reimplement oh-my-opencode-slim.
- Add hooks, an agent dashboard, background-job storage, or automatic
  continuation.
- Configure global agent defaults.
- Let subagents mutate VPS, live FNS configuration, or the live vault.
- Add generic software-development agents already covered by existing personal
  agents.
