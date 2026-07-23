# Git workflow runbook

## Rules

- Keep `main` stable and integrate through pull requests.
- Use one short-lived branch for one coherent outcome.
- Commit logical, independently reviewable changes; preserve useful atomic history and squash noisy checkpoints.
- Use conventional imperative subjects, lowercase, no trailing period, at most 50 characters.
- Rebase only unshared local history. Merge an advanced base into a pushed task branch.
- Push normally. Never use plain force push.
- Require explicit authority and exact-target verification for `--force-with-lease`, destructive reset or clean, broad restore, and branch deletion.
- Inspect `git status`, log, reflog, and branch tracking before recovery.

## Branch roles

- `main`: stable, verified integration branch.
- `feat/<name>`: user-visible capability.
- `fix/<name>`: defect correction.
- `refactor/<name>`: behavior-preserving restructuring.
- `docs/<name>`: documentation-only change.
- `chore/<name>`: repository maintenance.
- `spike/<name>`: disposable research or experiment.

Use lowercase kebab-case names. One branch owns one coherent outcome.

## Start task

Stop if worktree contains unrelated changes. Preserve them; do not reset or stash silently.

```powershell
git status --short --branch
git fetch origin
git switch main
git pull --ff-only origin main
git switch -c docs/<short-name>
```

Replace `docs/` with branch type matching work.

## Commit during work

Atomic means one independently reviewable and revertible logical change. Code, tests, and documentation may belong in same commit. Do not commit one file at a time merely because files differ.

```powershell
git diff --check
git diff -- <paths>
git add <paths>
git diff --cached --check
git diff --cached --stat
git commit -m "docs(scope): describe change"
```

Subjects use imperative mood, lowercase, no trailing period, and at most 50 characters. Allowed types: `feat`, `fix`, `perf`, `refactor`, `docs`, `test`, `build`, `ci`, `chore`, `revert`.

Run narrow behavior tests first, then required repository checks. Never claim an unrun check passed.

## Push and open PR

```powershell
git push -u origin HEAD
gh pr create --base main --head <branch-name> --title "<type>: <summary>" --body-file <path>
```

PR describes scope, affected decisions, remaining unknowns, evidence links, and exact verification commands. Agents do not merge unless task explicitly grants that authority.

## Preserve or squash history

Preserve commits when each remains useful for review or revert. Squash checkpoints when only final tree matters.

For an unshared local branch only:

```powershell
git fetch origin
git rebase -i origin/main
```

Never rebase a pushed/shared branch unless user explicitly authorizes exact rewrite. Never use plain `--force`; even `--force-with-lease` requires branch-specific approval.

When `main` advances under a pushed branch:

```powershell
git fetch origin
git merge origin/main
```

Resolve and verify on task branch, then push normally.

## Spike extraction

Commit experiments freely on `spike/<topic>`, but never relax secret or destructive-action rules. Promote useful work onto a fresh task branch from current `main`:

```powershell
git switch main
git pull --ff-only origin main
git switch -c feat/<topic>
git cherry-pick <useful-commit>
```

When only selected paths are useful:

```powershell
git restore --source spike/<topic> -- <exact-paths>
git diff -- <exact-paths>
```

Verify extracted result independently. Do not merge entire spike merely to avoid selecting valid work.

## Post-merge cleanup

Fetch and verify PR commits or final tree exist in `origin/main` before deletion:

```powershell
git fetch origin
git log --oneline --decorate origin/main -20
git merge-base --is-ancestor <branch-name> origin/main
```

Ancestor check applies when PR preserves branch commits. After squash integration, compare exact PR paths instead:

```powershell
git diff --exit-code <branch-name> origin/main -- <exact-pr-paths>
```

Delete exact local and remote branch only when task or user authorizes cleanup:

```powershell
git branch -d <branch-name>
git push origin --delete <branch-name>
```

## Recovery

Inspect before acting:

```powershell
git status --short --branch
git log --oneline --decorate --graph -20
git reflog -20
git branch -vv
```

Prefer a new recovery branch from known commit. Do not use `git reset --hard`, `git clean`, broad checkout/restore, or force push without explicit approval and verified exact targets.

## Legacy cutover

Permanent `research/full-system-design-dev`, generated `research/full-system-design`, and repository publisher exist only to deliver final migration PR. After PR #2 reaches `main` and tree equality is verified, stop using all three for normal work and begin every new task from current `main` on short-lived branch.

Cleanup is not cutover gate. Keep permanent dev branch and publisher as historical material unless user later requests removal. Generated clean branch may be deleted after exact remote target and merged `main` tree are verified; deletion remains optional and requires explicit authority.
