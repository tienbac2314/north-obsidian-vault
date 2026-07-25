# Whole-System Design Hardening Plan

Status: completed historical plan on 2026-07-23. Product authority remains in linked modular design, not this file. Do not execute again.

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Close the whole-system review findings before PR #2 merges or runtime implementation starts.

**Architecture:** Keep FNS-only human sync, native vault attachments, proposal-only Hermes Release 3, and separately gated Release 4A. Harden later agent behavior with immutable authenticated approval, deterministic transactions, canonical path containment, bounded gardening, non-disruptive review requests, and a reproducible vault bootstrap.

**Tech Stack:** Markdown, PowerShell 5.1, Git, Obsidian, Fast Note Sync

## Global Constraints

- Work only on `research/full-system-design-dev`.
- Preserve small development commits and never amend or rewrite shared development history.
- Publish `research/full-system-design` only through `scripts/publish-feature-clean.ps1`.
- No runtime, VPS, credential, FNS, Hermes, or personal-vault change is authorized.
- Authority remains `docs/system-design.md`, `docs/architecture/`, `docs/behavior/`, `docs/roadmap/`, accepted decisions, and `docs/active-goal.md`.
- Generated plans and specifications remain non-authoritative history.

---

### Task 1: Harden Hermes authorization and execution

**Files:**

- Modify: `docs/system-design.md`
- Modify: `docs/architecture/security.md`
- Modify: `docs/architecture/data-model.md`
- Modify: `docs/architecture/failure-handling.md`
- Modify: `docs/behavior/hermes-apply-and-link-gardening.md`
- Modify: `docs/behavior/interaction-examples.md`
- Modify: `docs/behavior/experiments.md`

**Interfaces:**

- Consumes: reviewed proposal or digest, exact SHA-256, approved path policy, proposal-time target hashes.
- Produces: immutable approval receipt, deterministic per-item transaction, separate result receipt.

- [x] Replace free-form accepted overrides with revise-only replacement proposals.
- [x] Require authenticated approval outside synchronized Markdown for provider reads and writes.
- [x] Define canonical relative-path validation and negative cases.
- [x] Define preflight, immediate byte comparison, atomic file replacement, rollback, post-write verification, and retry behavior.
- [x] Keep authorization bytes immutable and write results separately.
- [x] Add explicit weekly scan and provider-budget ceilings.
- [x] Update failure and experiment cases for forged approval, path escape, race, crash, rollback, and duplicate retry.
- [x] Run Markdown link, secret, Mermaid when changed, and whitespace checks.
- [x] Commit as `docs: harden Hermes apply boundary`.

### Task 2: Make queueing and vault bootstrap operational

**Files:**

- Modify: `docs/system-design.md`
- Modify: `docs/behavior/capture-to-digest.md`
- Modify: `docs/behavior/interaction-examples.md`
- Modify: `docs/roadmap/mvp.md`
- Modify: `vault-template/SYSTEM/Guides/vault-operating-guide.md`
- Create: `vault-template/HUB/Home.md`
- Create: `vault-template/SYSTEM/Templates/Daily.md`
- Create: `vault-template/SYSTEM/Templates/Weekly.md`
- Create: `vault-template/SYSTEM/Templates/Literature Note.md`
- Create: `vault-template/SYSTEM/Templates/Permanent Note.md`
- Create: `scripts/test-initialize-vault-template.ps1`
- Create: `scripts/initialize-vault-template.ps1`

**Interfaces:**

- Consumes: empty or existing target vault path.
- Produces: missing core folders and non-destructive starter files.

- [x] Keep same-file queue moves only for raw `STAGING/Unsorted` notes.
- [x] Use a sidecar review request for already-filed canonical notes.
- [x] Write initializer test first and verify expected failure while initializer is absent.
- [x] Implement PowerShell 5.1 initializer that creates exact folders, copies missing starter files, and never overwrites existing files.
- [x] Verify first run, safe repeat, and existing-file preservation.
- [x] Add Stage 4 bootstrap and Windows/Android opening gates.
- [x] Run initializer test, Markdown link, secret, and whitespace checks.
- [x] Commit as `feat: add core vault bootstrap`.

### Task 3: Make generated work unmistakably historical

**Files:**

- Modify: `docs/generated-work-index.md`
- Modify: every file directly under `docs/superpowers/plans/`
- Modify: every file directly under `docs/superpowers/specs/`

**Interfaces:**

- Consumes: accepted decision and current authority status.
- Produces: explicit in-file current, completed, or superseded status without deleting historical content.

- [x] Add status immediately below every generated title.
- [x] Point superseded executable files to current roadmap.
- [x] Label every index entry with its status.
- [x] Preserve historical body and commands unchanged.
- [x] Run Markdown link, secret, and whitespace checks.
- [x] Commit as `docs: label generated work history`.

### Task 4: Close review coverage and authority

**Files:**

- Modify: `scripts/test-markdown-links.ps1`
- Modify: `docs/architecture/diagrams.md`
- Modify: `docs/roadmap/phased-roadmap.md`
- Modify: `docs/decisions/decision-log.md`
- Modify: `docs/active-goal.md`
- Modify: this plan

**Interfaces:**

- Consumes: finished authority changes and verified repository state.
- Produces: regression evidence, accepted decisions, accurate current checkpoint.

- [x] Add broken-link and untracked-Markdown-target characterization fixtures.
- [x] Correct independent-recovery diagram edges.
- [x] Record accepted hardening and bootstrap decisions.
- [x] Mark this plan completed historical.
- [x] Run link regression, publisher regression, link, secret, Mermaid, and whitespace checks.
- [x] Request independent review against base and head SHAs; fix every Critical or Important finding.
- [x] Commit as `docs: close design readiness review`.

### Task 5: Publish reviewed result

**Files:**

- Modify only when required by verified review findings.

**Interfaces:**

- Consumes: clean verified development head.
- Produces: pushed development branch, publisher-generated clean branch, current PR description.

- [x] Push `research/full-system-design-dev` normally.
- [x] Run `scripts/publish-feature-clean.ps1` with verified remote clean head as lease.
- [x] Verify clean tree equals development tree and clean parent equals current `origin/main`.
- [x] Verify PR diff contains intended files and no runtime or secret material.
- [x] Update PR #2 description with current scope, decisions, remaining gates, and exact checks.
- [x] Confirm remote development and clean branch heads.
