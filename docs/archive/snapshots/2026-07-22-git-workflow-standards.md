# Git workflow standards

Status: superseded snapshot archived on 2026-07-22. Do not use as current instruction; follow [Git workflow](../../git-workflow.md).

1. Keep `main` stable. Agents do not commit or merge directly without explicit authority.
2. Start from clean, current `main` with fetch and fast-forward-only pull.
3. Use short-lived `feat/`, `fix/`, `refactor/`, `docs/`, `chore/`, or `spike/` branches.
4. Use `<type>[(scope)]: <imperative summary>`; lowercase, no period, maximum 50 characters.
5. Commit one logical, independently reviewable change with its tests and documentation.
6. Verify changed behavior, required repository checks, staged diff, and `git diff --check` before commit.
7. Preserve useful atomic commits; squash noisy checkpoints.
8. Rebase only unshared local history. Update pushed/shared branches through merge or PR.
9. Never use plain force push, `git reset --hard`, `git clean`, or broad destructive restore without explicit approval.
10. Spike branches relax history quality, not secret, verification, or safety rules.
11. Push verified branch and integrate through PR unless task explicitly authorizes another path.
12. Delete branches only after replacement history and resulting `main` tree are verified.

Exact current commands: [Git workflow runbook](../../git-workflow.md).
