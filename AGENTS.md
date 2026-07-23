# Repository Guidelines

## Project Structure & Module Organization

This repository contains research, modular system design, and rollout plans; runtime code has not started. Start with `README.md` and `docs/README.md`. Current product authority lives in `docs/system-design.md`, `docs/architecture/`, `docs/behavior/`, `docs/roadmap/`, accepted `docs/decisions/`, `docs/active-goal.md`, and `docs/git-workflow.md`. `docs/executive-summary.md` navigates but does not replace detailed modules. Evidence lives only in `docs/research/`. Superseded material lives in `docs/archive/`. `docs/superpowers/` is skill-generated working material indexed by `docs/generated-work-index.md` and is non-authoritative unless promoted. Keep reusable checks in `scripts/`.

## Build, Test, and Development Commands

There is no application build yet. Run documentation checks from repository root:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/test-initialize-vault-template.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Link checking validates tracked local Markdown links. Secret scanning reports filenames only and never prints matched values. Mermaid validation requires `mmdc`; set `MERMAID_CLI` when it is not on `PATH`.

## Documentation Style & Naming Conventions

Use Markdown ATX headings, short paragraphs, CommonMark lists, and fenced code blocks with language identifiers. Prefer kebab-case filenames. Keep product behavior in `docs/system-design.md` and `docs/behavior/`, component and risk detail in `docs/architecture/`, executable release steps in `docs/roadmap/`, current checkpoint in `docs/active-goal.md`, evidence in `docs/research/`, rationale in `docs/decisions/`, and superseded context in `docs/archive/`. Keep summaries concise but retain big-picture depth in linked modules; never collapse current design into one thin file by archiving its detailed contracts. Do not make research or `docs/superpowers/` current by implication; promote accepted content into authority files. Separate observed facts, inferences, and recommendations. Link primary sources beside claims and label community reports as anecdotal. Every new or renamed Markdown file must be reachable from root `README.md` through local Markdown links; add it to `docs/README.md` or a linked index.

## Research & Design Gates

- Treat modular system, architecture, behavior, roadmap, active-goal, Git-workflow, and accepted-decision files as authority. Research, archive, `docs/superpowers/`, NotebookLM, and chat history may challenge them but never silently override them.
- For time-sensitive stack or extension choices, check the exact official product page, current release, and relevant open issues. Treat Obsidian scorecards as automated triage: read Health and Review separately, record their stated limitations, and verify important findings against source repositories.
- Prefer `agent-reach` and `browser-act` for public evidence. Use the lean NotebookLM notebook for adversarial synthesis and the broader older notebook for source discovery; independently verify every material claim before adding it to the design.
- Keep live VPS inspection read-only during design work. Record sanitized service state, versions, and failure signals; never copy credentials, endpoints, account identifiers, or raw logs into the repository.
- Approve a replacement design before writing its implementation plan. Approve the plan before runtime changes. If the user grants standing best-judgment authority, self-review against fixed requirements and record the decision instead of pausing for synchronous approval.

## Testing Guidelines

Run link-checker regression, link, secret, and whitespace checks for every documentation-checker change. Run link, secret, and whitespace checks for every documentation-only change. Run Mermaid validation when any diagram changes. Inspect rendered diagrams when layout or labels matter. No coverage target or unit-test framework exists until runtime implementation begins.

## Commit & Pull Request Guidelines

Use `<type>[(scope)]: <imperative summary>` with lowercase text, no trailing period, and at most 50 characters. Commit one logical change with its tests and documentation. Preserve useful atomic commits; squash noisy checkpoints. Pull requests explain scope, affected decisions, remaining unknowns, evidence links, and exact validation commands run.

## Agent Checkpoints

Follow `docs/git-workflow.md`. Until `docs/active-goal.md` records PR #2 merged and tree equality verified, use legacy cutover exception: work only on `research/full-system-design-dev`, push it normally, and update generated `research/full-system-design` only through `scripts/publish-feature-clean.ps1`; do not start this migration work from `main`. After cutover, start each task from clean current `main` and use short-lived `feat/`, `fix/`, `refactor/`, `docs/`, `chore/`, or `spike/` branch. Cleanup is not cutover gate: keep permanent dev branch and publisher as history unless user requests removal; only generated clean branch is optional deletion after exact verification and explicit authority. Agents do not commit or merge directly to `main` without explicit authority. Rebase only unshared local history. Push verified branches normally and integrate through PR. Never use plain force push. `--force-with-lease`, destructive reset/clean, broad restore, and branch deletion require exact-target verification plus explicit authority. Keep `docs/active-goal.md` current before handoff or compaction.

## Security & Agent Instructions

Never commit credentials, private endpoints, provider/account identifiers, raw logs, database dumps, or personal note content. Preserve unrelated worktree changes. Treat existing research files as recorded evidence; refresh only facts that are time-sensitive or explicitly questioned. Do not change VPS services during documentation work. Planned architecture is not proof of deployed behavior.
