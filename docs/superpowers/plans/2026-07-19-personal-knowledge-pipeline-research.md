# Personal Knowledge Pipeline Research Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce a traceable research repository, complete behavioral and technical system design, coherent research history, pushed branch, and reviewable pull request for a personal knowledge pipeline.

**Architecture:** Treat Telegram, Hermes, Notion, Obsidian, OpenViking, Supermemory, and semantic retrieval as candidate components. Separate immutable evidence from analysis and provisional decisions; recommend a minimal capture-to-review loop only where evidence supports it.

**Tech Stack:** Markdown, Mermaid, Git, GitHub CLI, official web documentation, read-only Git/VPS inspection.

## Global Constraints

- Repository: private `tienbac2314/personal-knowledge-pipeline`.
- Branch: `research/full-system-design`; never merge directly into `main`.
- Primary deliverable: `docs/system-design.md`.
- Preserve verified facts, raw research, analysis, recommendations, experiments, decisions, uncertainties, MVP architecture, and future options.
- Every meaningful sourced claim records source, access date, official status, relevant version or commit, verified fact, interpretation, implication, and uncertainty.
- Never commit secrets, credentials, bot tokens, private endpoints, `.env` files, database dumps, raw logs, or copied documentation archives.
- Brainstorming conclusions remain Proposed or Experimental until evidence supports acceptance.
- Raw Telegram capture must remain available when 9Router or upstream model providers are unavailable.

---

### Task 1: Repository foundation and evidence ledger

**Files:**
- Create: `.gitignore`
- Create: `research-notes/official-sources.md`
- Create: `research-notes/repo-findings.md`
- Create: `research-notes/vps-findings.md`
- Create: `docs/current-state/repository-history.md`

**Interfaces:**
- Consumes: explicit completion criteria, authenticated GitHub repository, `my-opencode-setup` Git history, read-only VPS observations.
- Produces: redacted evidence records cited by all research and design documents.

- [x] **Step 1: Record repository and branch provenance**

Document repository URL, branch, initial commit, inspection commands, access date `2026-07-19`, and evidence classification rules.

- [x] **Step 2: Inspect `my-opencode-setup` history**

Run read-only GitHub/Git commands to record branch, commit hash, file path, and historical context for Supermemory, Mem0, Hermes, or knowledge-capture findings.

- [x] **Step 3: Record redacted VPS evidence**

Document PM2/process state, Hermes Gateway state, Telegram connectivity, 9Router integration, Supermemory process and ports, inspection method, staleness caveat, and redaction policy. Never copy raw logs, hostnames, endpoints, account identifiers, or token values.

- [x] **Step 4: Commit foundation**

```powershell
git add .gitignore docs/superpowers/plans research-notes docs/current-state/repository-history.md
git commit -m "chore: initialize knowledge pipeline research"
```

Expected: one coherent foundation commit with no secrets.

### Task 2: Current behavior and capture-to-digest experiments

**Files:**
- Create: `docs/current-state/vps-inventory.md`
- Create: `docs/current-state/hermes-and-telegram.md`
- Create: `docs/current-state/supermemory.md`
- Create: `docs/behavior/capture-to-digest.md`
- Create: `docs/behavior/interaction-examples.md`
- Create: `docs/behavior/experiments.md`

**Interfaces:**
- Consumes: evidence ledger and observed four-entry Notion journal.
- Produces: behavioral requirements, example interactions, and falsifiable experiments used by architecture recommendations.

- [x] **Step 1: Separate observations from needs**

Record current copy-paste behavior, two-minute effort ceiling, mixed source types, incomplete journal entries, empty summaries, and desire for learning retention plus career evidence.

- [x] **Step 2: Compare processing cadences**

Document immediate, session-based, daily, and hybrid processing with benefits, failure modes, interruption cost, grouping risk, and recommended experiment.

- [x] **Step 3: Define scattered-input behavior**

Specify source preservation, reply/album/link grouping signals, ambiguity handling, temporary-versus-durable classification, correction controls, and maximum-question policy.

- [x] **Step 4: Define measurable experiments**

Add two-week MVP tests with capture completion, digest review, correction, promotion, and retrieval measures plus explicit pass/fail thresholds.

- [x] **Step 5: Commit behavior research**

```powershell
git add docs/current-state docs/behavior research-notes/vps-findings.md
git commit -m "docs: define capture-to-digest behavior"
```

Expected: behavioral design remains tool-neutral and distinguishes evidence from proposals.

### Task 3: Candidate technology research

**Files:**
- Create: `docs/research/storage-options.md`
- Create: `docs/research/notion.md`
- Create: `docs/research/obsidian.md`
- Create: `docs/research/openviking.md`
- Create: `docs/research/supermemory.md`
- Create: `docs/research/hermes.md`
- Create: `docs/research/telegram.md`
- Create: `docs/research/semantic-search.md`
- Create: `docs/research/9router.md`

**Interfaces:**
- Consumes: official sources register, repository/VPS evidence, behavioral requirements.
- Produces: comparable evaluations with versions, evidence, implications, uncertainties, and fit criteria.

- [x] **Step 1: Research official capabilities**

Use official Notion API, Telegram Bot API, Obsidian Help, OpenViking repository/docs, Supermemory repository/docs, Hermes repository/docs, and 9Router repository/architecture/Docker/release documents. Record access date, release/commit where available, direct URL, and official status.

- [x] **Step 2: Evaluate 9Router as model gateway**

Document current redacted deployment, Hermes integration, routing and fallback behavior, persistence, logging, security, backups, failure handling, and tradeoffs among routing all LLM calls, routing synthesis/classification only, and explicitly pinning embedding models.

- [x] **Step 3: Compare storage roles**

Evaluate Markdown files, SQLite, Notion databases, and vector stores for raw-event durability, attachments, portability, auditability, idempotency, offline access, and operational burden.

- [x] **Step 4: Evaluate semantic retrieval timing**

Separate keyword/backlink requirements from embedding/vector requirements. Define corpus-size or retrieval-failure evidence that would justify adding vector search.

- [x] **Step 5: Commit candidate research**

```powershell
git add docs/research research-notes/official-sources.md research-notes/repo-findings.md
git commit -m "research: compare candidate knowledge systems"
```

Expected: no component is treated as required dependency.

### Task 4: Architecture options and technical lifecycle

**Files:**
- Create: `docs/architecture/options.md`
- Create: `docs/architecture/recommended-architecture.md`
- Create: `docs/architecture/data-model.md`
- Create: `docs/architecture/failure-handling.md`
- Create: `docs/architecture/diagrams.md`

**Interfaces:**
- Consumes: behavioral requirements and technology comparison.
- Produces: candidate architectures, provisional MVP, extensible future architecture, data contracts, failure semantics, and valid Mermaid diagrams.

- [x] **Step 1: Compare at least three architectures**

Compare Notion-first, file/SQLite-first, and memory-platform-first designs. Include 9Router placement, operational cost, lock-in, source fidelity, review ergonomics, migration path, and failure recovery.

- [x] **Step 2: Define MVP lifecycle and data model**

Specify raw capture, capture group, synthesis candidate, durable note, digest, relationship, feedback, and processing-run records with stable IDs, timestamps, provenance, confidence, state transitions, and idempotency keys.

- [x] **Step 3: Define failure handling**

Cover duplicate Telegram delivery, partial attachment failure, URL-fetch failure, 9Router outage, upstream provider outage, LLM failure, Notion outage, ambiguous grouping, stale links, unsafe work content, retries, dead letters, and human correction. Preserve raw capture without any model dependency.

- [x] **Step 4: Validate diagrams**

Extract each Mermaid block and parse it with a Mermaid CLI-compatible validator; repair syntax before commit.

- [x] **Step 5: Commit architecture**

```powershell
git add docs/architecture
git commit -m "design: define pipeline architecture and lifecycle"
```

Expected: recommended MVP is replaceable and future integrations use explicit boundaries.

### Task 5: Decisions, roadmap, and authoritative design

**Files:**
- Create: `docs/decisions/decision-log.md`
- Create: `docs/decisions/unresolved-questions.md`
- Create: `docs/roadmap/mvp.md`
- Create: `docs/roadmap/phased-roadmap.md`
- Create: `docs/executive-summary.md`
- Create: `docs/system-design.md`
- Modify: `README.md`

**Interfaces:**
- Consumes: all research, behavioral, and architecture documents.
- Produces: authoritative reading path, complete self-contained design, status-qualified decisions, unresolved issues, MVP acceptance criteria, and postponed features.

- [x] **Step 1: Record qualified decisions**

Use the required DEC-XXX template. Mark one-bot, hybrid processing, storage, Notion role, 9Router scope, embedding pinning, semantic retrieval, and future-tool decisions Proposed or Experimental unless tests provide sufficient evidence.

- [x] **Step 2: Define MVP and phased roadmap**

Specify build order, acceptance evidence, rollback path, deliberately postponed features, and promotion criteria for Obsidian, OpenViking, Supermemory, or vector retrieval.

- [x] **Step 3: Write self-contained system design**

Include problem definition, user behavior, verified current facts, research findings, analysis, requirements, behavioral flow, architecture options, recommendation, data model, lifecycle, failures, privacy, experiments, decisions, roadmap, future architecture, and unresolved questions.

- [x] **Step 4: Publish reading order**

Update `README.md` with problem, goals, research status, authoritative documents, recommended reading order, and major unresolved decisions.

- [ ] **Step 5: Commit authoritative design**

```powershell
git add README.md docs/decisions docs/roadmap docs/executive-summary.md docs/system-design.md
git commit -m "docs: publish complete system design"
```

Expected: main design can be understood without opening supporting files; supporting files preserve traceability.

### Task 6: Verification, review, and pull request

**Files:**
- Create: `scripts/check-markdown-links.ps1`
- Create: `scripts/check-mermaid.ps1`
- Create: `scripts/check-secrets.ps1`
- Create: `docs/pull-request-summary.md`

**Interfaces:**
- Consumes: completed repository.
- Produces: reproducible completion evidence, clean pushed branch, and open pull request.

- [ ] **Step 1: Add repository checks**

Implement scripts that check local Markdown links, extract and validate Mermaid blocks, and scan tracked text for secret patterns without printing secret values.

- [ ] **Step 2: Run completion audit**

```powershell
pwsh -File scripts/check-secrets.ps1
pwsh -File scripts/check-markdown-links.ps1
pwsh -File scripts/check-mermaid.ps1
git status --short
git log --oneline --decorate --reverse main..HEAD
```

Expected: all scripts exit `0`, status is empty, and history shows coherent milestones.

- [ ] **Step 3: Write pull request summary**

Cover problem, research, inspected systems, options, recommended MVP, target architecture, decisions, experiments, unresolved questions, risks, and follow-up work.

- [ ] **Step 4: Commit and push final review materials**

```powershell
git add scripts docs/pull-request-summary.md
git commit -m "docs: add review summary and validation checks"
git push origin research/full-system-design
```

Expected: remote branch matches local HEAD.

- [ ] **Step 5: Create pull request**

```powershell
gh pr create --base main --head research/full-system-design --title "Research and design the personal knowledge pipeline" --body-file docs/pull-request-summary.md
```

Expected: command returns a GitHub pull-request URL.

- [ ] **Step 6: Verify remote completion checks**

Use `gh repo view`, `gh pr view`, `git ls-remote`, validation scripts, README/document inspection, clean status, and final log to prove all 13 requested checks.
