# Git workflow migration design

Status: superseded non-authoritative specification. Current authority is [Git workflow](../../git-workflow.md); do not execute this document independently.

Date: 2026-07-22. Status: approved concept; brevity revision pending review.

Replace permanent dev plus generated clean branches with stable `main` and short-lived task branches. Current two-branch workflow remains authority until transition reaches `main` and tree verification passes.

## Goal

- Keep `main` stable and verified.
- Preserve useful atomic commits without maintaining parallel histories.
- Squash noisy experiments when their checkpoints add no lasting value.
- Give future agents a short rule set with detailed commands one link away.

## Documentation layers

### `AGENTS.md`: quick authority

Future-agent Git section stays near this size:

1. Start from clean, current `main`; use `git fetch` and `git pull --ff-only`.
2. Work on short-lived `feat/`, `fix/`, `refactor/`, `docs/`, `chore/`, or `spike/` branches.
3. Agents do not commit or merge directly to `main` without explicit authority.
4. Use `<type>[(scope)]: <imperative summary>`; lowercase, no period, maximum 50 characters.
5. Commit one logical change with its tests and docs, not one commit per file.
6. Verify changed behavior, repository checks, staged diff, and `git diff --check` before commit.
7. Preserve useful atomic commits; squash noisy checkpoints.
8. Never rewrite a pushed or shared branch without explicit authorization.
9. Never use plain `--force`, `git reset --hard`, `git clean`, or broad destructive restore without approval.
10. Spike branches relax history quality, not secret, safety, or destructive-action rules.
11. Push verified branch and use PR for integration unless task explicitly authorizes another method.
12. Delete branches only after replacement history and resulting `main` tree are verified.

`AGENTS.md` links detailed runbook instead of repeating commands and edge cases.

### `branch-workflow.md`: runbook

Detailed runbook owns:

- exact clean-worktree and branch-start commands;
- Conventional Commit types and scope guidance;
- commit and integration verification;
- unshared-local rebase versus shared-branch merge/PR behavior;
- squash procedure and post-squash verification;
- spike cherry-pick or selective `git restore --source` extraction;
- local and remote branch cleanup;
- reflog and recovery procedure.

Historical specs and plans keep old commands but receive clear superseded labels. Future agents should not need them for normal Git work.

## Decisions

### Branches

- `main`: stable, verified, protected integration branch.
- `feat/<name>`: user-visible capability.
- `fix/<name>`: defect correction.
- `refactor/<name>`: behavior-preserving restructuring.
- `docs/<name>`: documentation-only work.
- `chore/<name>`: maintenance.
- `spike/<name>`: disposable research or experiment.

Names use lowercase kebab-case. One branch owns one coherent outcome.

### Commits

Format:

```text
<type>[(scope)]: <summary>
```

Types: `feat`, `fix`, `perf`, `refactor`, `docs`, `test`, `build`, `ci`, `chore`, `revert`.

Atomic means one independently reviewable and revertible logical change. Code, tests, and documentation may belong in same commit.

### Integration

- Preserve multi-commit history when commits remain useful independently.
- Squash experimental or noisy checkpoints when only final tree matters.
- Rebase only unshared local branches.
- Pushed or shared branches use merge or reviewed PR unless user authorizes exact rewrite.
- Agents normally stop after verified push and PR preparation.

### Safety

- Never use plain force push.
- `--force-with-lease` requires explicit branch-specific authorization.
- Never rewrite `main` or another shared branch.
- Destructive reset, clean, checkout, restore, and branch deletion require exact target verification and user authority.
- Use status, log, reflog, and remote refs before recovery.

## Staged migration

1. Update `AGENTS.md`, runbook, decisions, current entrypoints, and active FNS plan on `research/full-system-design-dev`.
2. Verify and push one final permanent-dev documentation commit.
3. Run current publisher once to generate final `research/full-system-design` snapshot.
4. Integrate generated clean branch into `main` through verified PR.
5. Confirm `origin/main` tree equals intended dev tree.
6. Switch current authority to `main` plus short-lived branches.
7. Remove publisher scripts in separate post-cutover branch.
8. Delete old branches only after explicit authorization and recoverable refs exist.

No deletion or publisher retirement occurs before step 5.

## Files changed during implementation

- `AGENTS.md`
- `README.md`
- `docs/README.md`
- `docs/current-state/branch-workflow.md`
- `docs/current-state/repository-history.md`
- `docs/current-state/active-goal.md`
- `docs/decisions/decision-log.md`
- `docs/superpowers/plans/2026-07-22-fns-human-sync-pilot.md`

Publisher scripts remain until verified cutover. Superseded plans remain historical rather than being mechanically rewritten.

## Completion gate

Migration completes only when:

- `origin/main` contains verified intended tree;
- quick rules and runbook name `main` plus short-lived branches as current authority;
- active plans no longer require permanent dev or generated clean branches;
- publisher is unnecessary for normal work;
- complete repository checks pass;
- old branches remain recoverable until separately approved deletion.
