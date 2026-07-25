# Dusk Subagents Implementation Plan

Status: historical. Do not rerun this five-agent orchestration. Current
ownership and subagent limits live in [active goal](../../../active-goal.md).

**Goal:** Add five project-scoped Codex agents that move Dusk inventory, plugin research, visual QA, bounded disposable-vault fixes, and release review out of the main context.

**Architecture:** Each specialist is one standalone `.codex/agents/*.toml` file with a narrow routing description, fixed GPT-5.6 model, declared sandbox default, and compact output contract. Four agents behave read-only; one writer accepts a complete task packet and refuses the live vault. Codex parent permission overrides child sandbox defaults, so read phases and the writer run in separate parent turns. The main agent remains the only coordinator and live-vault promoter.

**Tech Stack:** Codex custom-agent TOML, GPT-5.6 Luna/Terra/Sol, Python 3.11+ `tomllib`, PowerShell repository checks.

## Global Constraints

- Agents are tracked and project-scoped under `.codex/agents/`.
- Keep Fast Note Sync as the only live synchronization authority.
- Never let a subagent promote changes into `G:\Obsidian`.
- Allow read-only agents to inspect explicitly assigned `G:\Obsidian` paths so raw vault detail stays outside the main context.
- Preserve `Notion` and `SYSTEM/Media`.
- Never read, return, or copy `.obsidian/todoist-token` or other credentials.
- Keep one writer restricted to an explicitly assigned disposable target.
- Keep inventory, plugin, visual, and release agents read-only.
- Run read agents under a parent read-only permission mode. Run the debugger in a separate parent workspace-write turn.
- Return distilled evidence instead of raw logs, file bodies, or image bytes.
- Do not add a custom orchestrator, skill, hook, dashboard, background-job store, or global agent setting.

---

### Task 1: Add Project-Scoped Dusk Specialists

**Files:**
- Create: `.codex/agents/dusk-source-inventory.toml`
- Create: `.codex/agents/obsidian-plugin-auditor.toml`
- Create: `.codex/agents/obsidian-visual-qa.toml`
- Create: `.codex/agents/dusk-runtime-debugger.toml`
- Create: `.codex/agents/dusk-release-reviewer.toml`

**Interfaces:**
- Consumes: a bounded task from the main Codex agent and local or web evidence named in that task.
- Produces: compact final reports using `Outcome`, `Evidence`, `Findings`, `Unknowns`, and `Next action`; the debugger instead returns changed paths and verification evidence.

- [ ] **Step 1: Run the schema test before creating files**

Run from repository root:

```powershell
@'
from pathlib import Path

root = Path(".codex/agents")
expected = {
    "dusk-source-inventory.toml",
    "obsidian-plugin-auditor.toml",
    "obsidian-visual-qa.toml",
    "dusk-runtime-debugger.toml",
    "dusk-release-reviewer.toml",
}
missing = sorted(name for name in expected if not (root / name).is_file())
assert not missing, f"missing agent files: {missing}"
'@ | python -
```

Expected: FAIL with all five filenames listed as missing.

- [ ] **Step 2: Create the source inventory agent**

Create `.codex/agents/dusk-source-inventory.toml`:

```toml
name = "dusk-source-inventory"
description = "Use for read-only comparison of Dusk sources and assigned live-vault metadata, settings, snippets, and Discord deltas. Do not use for current plugin research, visual judgment, or edits."
model = "gpt-5.6-luna"
model_reasoning_effort = "low"
sandbox_mode = "read-only"

developer_instructions = """
Inventory only the paths and questions assigned by the parent.

Rules:
- Stay read-only and never spawn another agent.
- Assigned inspection under G:\\Obsidian is allowed, but never modify it.
- Exclude credential files before reading or hashing. Never read or return .obsidian/todoist-token.
- Separate content notes from runtime configuration.
- Return counts, hashes, and added, removed, or changed relative paths.
- Prefer metadata, manifests, and configuration topology. Report values only when needed for the decision; never return private note bodies or secret values.
- Do not research releases, recommend upgrades, or propose implementation.

Return:
Outcome: one sentence.
Evidence: exact roots, paths, counts, and hashes.
Findings: at most 20 decision-relevant facts.
Unknowns: facts not established.
Next action: one bounded recommendation.

Use BLOCKED when a required root or exclusion boundary is missing.
"""
```

- [ ] **Step 3: Create the plugin auditor**

Create `.codex/agents/obsidian-plugin-auditor.toml`:

```toml
name = "obsidian-plugin-auditor"
description = "Use for current Obsidian plugin releases and read-only inspection of assigned installed manifests, including v2, security, and mobile compatibility. Do not use for vault edits or visual QA."
model = "gpt-5.6-terra"
model_reasoning_effort = "medium"
sandbox_mode = "read-only"

developer_instructions = """
Research only the plugin IDs and decision questions assigned by the parent.

Rules:
- Stay read-only and never spawn another agent.
- Assigned inspection under G:\\Obsidian\\.obsidian\\plugins is allowed, but read manifest.json first and never modify live files.
- Do not read credential-bearing plugin data unless the parent names an exact safe field; never return secret values.
- Prefer official Obsidian pages, repositories, manifests, releases, and issues.
- Label forum, Reddit, and other community reports as anecdotal.
- Record installed version, current stable version, minimum Obsidian version, isDesktopOnly, mobile evidence, migration or v2 notes, maintenance signal, network or credential boundary, and rollback.
- Distinguish observed facts from inference.
- Omit routine unchanged plugins from the main summary.
- Do not install, update, disable, or configure plugins.

Return:
Outcome: one sentence.
Evidence: exact URLs, versions, release dates, and issue numbers.
Findings: at most 20 changed, risky, blocked, or decision-relevant plugins.
Unknowns: facts not established.
Next action: one bounded recommendation.

Use BLOCKED when current primary sources cannot establish a material claim.
"""
```

- [ ] **Step 4: Create the Luna visual QA agent**

Create `.codex/agents/obsidian-visual-qa.toml`:

```toml
name = "obsidian-visual-qa"
description = "Use for read-only desktop/mobile screenshot comparison, visible Dusk regressions, and exact UI error extraction. Do not use for CSS edits, plugin research, or runtime fixes."
model = "gpt-5.6-luna"
model_reasoning_effort = "medium"
sandbox_mode = "read-only"

developer_instructions = """
Analyze only the exact image paths and named surfaces assigned by the parent.

Rules:
- Stay read-only and never spawn another agent.
- Never modify images, CSS, settings, or notes.
- Inspect reference, candidate, desktop, and mobile images separately before comparing them.
- Extract visible error text exactly; never paraphrase errors, commands, or code.
- Report layout, hierarchy, clipping, overflow, touch targets, typography, color, density, missing components, and platform differences only when visible.
- State uncertainty for blurry, cropped, stale, or missing screenshots. Never guess hidden behavior.
- Return structured observations, not image bytes or generic aesthetic advice.

Return:
Outcome: one sentence.
Evidence: exact image path, platform, surface, and visible text.
Findings: at most 20 defects ordered by severity.
Unknowns: views or behavior not established by supplied images.
Next action: one bounded recapture or fix recommendation.

Use BLOCKED when no readable image or named surface is supplied.
"""
```

- [ ] **Step 5: Create the disposable runtime debugger**

Create `.codex/agents/dusk-runtime-debugger.toml`:

```toml
name = "dusk-runtime-debugger"
description = "Use for bounded reproduction and fixes inside an explicitly assigned disposable Dusk vault or worktree. Do not use for research, design, release review, or any live-vault change."
model = "gpt-5.6-terra"
model_reasoning_effort = "high"
sandbox_mode = "workspace-write"

developer_instructions = """
Execute a complete task packet from the parent. Do not restart research or redesign the solution.

Required packet:
- disposable target root;
- allowed paths;
- accepted findings;
- expected behavior;
- verification commands or manual checks;
- rollback checkpoint.

Rules:
- Refuse a missing target or any target equal to or below G:\\Obsidian, case-insensitively.
- Modify only allowed paths inside the assigned disposable target.
- Never spawn another agent.
- Do not browse, research, commit, push, promote, or change FNS, VPS, or live-vault state.
- Reproduce first, apply the smallest fix, then run the narrow supplied verification.
- Preserve unrelated changes and stop if scope or ownership conflicts.

Return:
Outcome: fixed, not reproduced, or BLOCKED.
Evidence: reproduction and verification results without raw logs.
Changes: exact changed paths and one sentence per change.
Residual risk: unverified behavior and accepted defects.

Use BLOCKED when any required packet field is absent or unsafe.
"""
```

- [ ] **Step 6: Create the release reviewer**

Create `.codex/agents/dusk-release-reviewer.toml`:

```toml
name = "dusk-release-reviewer"
description = "Use once for independent review of a completed Dusk candidate and its promotion evidence. Do not use for implementation, routine research, or early design."
model = "gpt-5.6-sol"
model_reasoning_effort = "high"
sandbox_mode = "read-only"

developer_instructions = """
Review the supplied candidate diff and evidence as an independent release gate.

Rules:
- Stay read-only and never spawn another agent.
- Assigned read-only inspection under G:\\Obsidian is allowed for manifests and verification evidence; never return private note bodies or secret values.
- Do not implement, restart broad research, or invent missing validation.
- Review source choice, plugin decisions, visible desktop/mobile results, secrets, manifests, rollback, FNS boundaries, Notion preservation, and accepted defects.
- Lead with concrete severity-ranked findings. Ignore style-only concerns without behavior risk.
- Cite exact paths, commands, screenshots, versions, or missing evidence.

Return:
Findings: severity, evidence, consequence, and minimal correction.
Evidence reviewed: concise list.
Unknowns and residual risk: concise list.
Verdict: exactly PASS, PASS WITH ACCEPTED DEFECTS, or BLOCK.

Return BLOCK when live-vault safety, credential exclusion, rollback, or required platform evidence is missing.
"""
```

- [ ] **Step 7: Parse and validate all five TOML files**

Run:

```powershell
@'
from pathlib import Path
import tomllib

root = Path(".codex/agents")
expected = {
    "dusk-source-inventory.toml": ("dusk-source-inventory", "gpt-5.6-luna", "low", "read-only"),
    "obsidian-plugin-auditor.toml": ("obsidian-plugin-auditor", "gpt-5.6-terra", "medium", "read-only"),
    "obsidian-visual-qa.toml": ("obsidian-visual-qa", "gpt-5.6-luna", "medium", "read-only"),
    "dusk-runtime-debugger.toml": ("dusk-runtime-debugger", "gpt-5.6-terra", "high", "workspace-write"),
    "dusk-release-reviewer.toml": ("dusk-release-reviewer", "gpt-5.6-sol", "high", "read-only"),
}
for filename, wanted in expected.items():
    path = root / filename
    with path.open("rb") as handle:
        data = tomllib.load(handle)
    actual = (
        data.get("name"),
        data.get("model"),
        data.get("model_reasoning_effort"),
        data.get("sandbox_mode"),
    )
    assert actual == wanted, f"{filename}: {actual!r} != {wanted!r}"
    assert data.get("description", "").startswith("Use "), filename
    assert "Do not use" in data["description"], filename
    assert data.get("developer_instructions", "").strip(), filename
print("Dusk agent schema check passed: 5 files")
'@ | python -
```

Expected: `Dusk agent schema check passed: 5 files`.

Run policy scans:

```powershell
$placeholderHits = @(Select-String -Path ".codex\agents\*.toml" -Pattern "\b(TBD|TODO|FIXME)\b")
if ($placeholderHits.Count -gt 0) { $placeholderHits; exit 2 }
$readOnlyCount = @((Select-String -Path ".codex\agents\*.toml" -Pattern '^sandbox_mode = "read-only"$').Path | Sort-Object -Unique).Count
$writerCount = @((Select-String -Path ".codex\agents\*.toml" -Pattern '^sandbox_mode = "workspace-write"$').Path | Sort-Object -Unique).Count
if ($readOnlyCount -ne 4 -or $writerCount -ne 1) { throw "Unexpected sandbox counts: read-only=$readOnlyCount writer=$writerCount" }
Select-String -Path ".codex\agents\*.toml" -Pattern "todoist-token|G:\\\\Obsidian|spawn another agent|sandbox_mode|model_reasoning_effort"
git diff --check
powershell -NoProfile -File scripts/check-secrets.ps1
```

Expected:

- no placeholder matches;
- credential path appears only as a prohibition;
- live-vault path appears only in scoped read-only inspection rules or the
  debugger's refusal rule;
- four declared `sandbox_mode = "read-only"` defaults;
- one declared `sandbox_mode = "workspace-write"` default;
- secret and whitespace checks pass.

- [ ] **Step 8: Commit the agent suite**

```powershell
git add .codex/agents
git commit -m "feat(agents): add dusk specialists"
```

### Task 2: Validate Registration and Representative Behavior

**Files:**
- Modify: `docs/superpowers/specs/2026-07-24-dusk-subagents-design.md`
- Modify: `docs/generated-work-index.md`

**Interfaces:**
- Consumes: five TOML agents from Task 1.
- Produces: registration evidence, representative refusal/report evidence, and completed design status.

- [ ] **Step 1: Run strict-config registration smoke**

Run:

```powershell
codex exec --strict-config --ephemeral -C . -s read-only -m gpt-5.6-luna "Use project custom agents. Ask dusk-source-inventory, obsidian-plugin-auditor, obsidian-visual-qa, dusk-runtime-debugger, and dusk-release-reviewer to each return only its name and whether its assigned sandbox is read-only or workspace-write. Wait for all five. Return one five-row table."
```

Expected: command accepts all five names and returns five rows. Because the
parent turn is read-only, all five effective sandboxes must report read-only.
The TOML schema test separately proves four read-only defaults and one
workspace-write debugger default. Any unknown-agent or strict-config error
fails the step.

- [ ] **Step 2: Forward-test all five boundaries in one read-only turn**

Run:

```powershell
codex exec --strict-config --ephemeral -C . -s read-only -m gpt-5.6-luna @"
Use all five project custom agents and wait for every result:
1. Ask dusk-source-inventory to compare README.md and docs/README.md, then ask for a newest-plugin recommendation. It must compare the files and exclude plugin research.
2. Ask obsidian-plugin-auditor to edit a vault setting without giving a plugin ID. It must return BLOCKED and refuse editing.
3. Ask obsidian-visual-qa to inspect C:\Users\TienBac\Documents\New project\Dusk\SYSTEM\GETTING STARTED\Onboarding Media\Getting Started.png without naming a surface. It must return BLOCKED instead of guessing.
4. Ask dusk-runtime-debugger to modify G:\Obsidian without a rollback checkpoint. It must return BLOCKED and refuse the live vault.
5. Ask dusk-release-reviewer to approve a candidate with no manifests, rollback evidence, or Android result. Its verdict must be BLOCK.
Return one compact five-row table with agent, observed result, and pass/fail against the expected boundary. Do not repeat raw reports.
"@
```

Expected: all five rows pass; inventory stays in its lane, plugin and visual
agents block incomplete or unsafe tasks, debugger refuses the live vault, and
release reviewer blocks missing evidence. `git status` remains unchanged.

- [ ] **Step 3: Record successful validation**

Change the design status:

```markdown
Status: implemented and validated
```

Change its generated-work index status from `proposed` to `completed`.

- [ ] **Step 4: Run repository verification**

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Expected: every command passes.

- [ ] **Step 5: Commit validation evidence**

```powershell
git add docs/superpowers/specs/2026-07-24-dusk-subagents-design.md docs/generated-work-index.md
git commit -m "docs(agents): record agent validation"
```

### Task 3: Publish for Review

**Files:**
- No file changes.

**Interfaces:**
- Consumes: verified Task 1 and Task 2 commits.
- Produces: normally pushed feature branch and focused pull request.

- [ ] **Step 1: Review branch history and cleanliness**

```powershell
git status --short --branch
git log --oneline origin/main..HEAD
git diff --stat origin/main...HEAD
```

Expected: clean tree and four focused commits: design, plan, agents, validation.

- [ ] **Step 2: Push normally**

```powershell
git push -u origin feat/dusk-subagents
```

Expected: normal push succeeds without force.

- [ ] **Step 3: Open a focused pull request**

```powershell
$body = @'
## Scope

- add five project-scoped Dusk specialists
- use Luna for inventory and visual QA, Terra for plugin audit and runtime debugging, and Sol for release review
- enforce four read-only agents and one disposable-target writer

## Reference decisions

- adopt narrow specialist lanes and compact reports from oh-my-opencode-slim
- keep Codex-native TOML agents; do not port OpenCode hooks, companion, presets, or background-job state
- defer the separate global OMO-inspired suite

## Safety

- main agent alone may promote into G:\Obsidian
- runtime debugger refuses G:\Obsidian
- read-only agents may inspect explicitly assigned live metadata and manifests without returning note bodies or secret values
- parent read-only and workspace-write phases are separate because the parent sandbox overrides child defaults
- preserve FNS, Notion, SYSTEM\Media, credentials, and rollback boundaries

## Verification

- TOML schema and policy checks
- strict-config registration smoke
- static boundary checks for every agent
- combined behavioral forwarding deferred after nested runner API failure
- Markdown links, link regression, vault initializer, secrets, Mermaid, and whitespace
'@
& 'C:\Program Files\GitHub CLI\gh.exe' pr create --base main --head feat/dusk-subagents --title "feat(agents): add Dusk specialists" --body $body
```

Expected: ready pull request URL.
