# Repository guidelines

## Authority and scope

Read `README.md`, `docs/README.md`, `docs/active-goal.md`, and
`docs/git-workflow.md` before changing the repository. The assigned handoff and
`docs/active-goal.md` define the current task, worktree, branch, and safety
boundaries.

Current authority lives in `docs/system-design.md`, `docs/architecture/`,
`docs/behavior/`, `docs/roadmap/`, accepted `docs/decisions/`,
`docs/active-goal.md`, and `docs/git-workflow.md`. `docs/research/` is evidence.
`docs/archive/` is preserved history and must not be used as current
instruction.

## Working rules

- Stay within the assigned scope and preserve unrelated changes.
- Do not silently stash, reset, clean, restore, or rewrite work outside scope.
- Do not modify live vaults, source vaults, devices, remote services, or
  production data unless the task explicitly authorizes the exact operation.
- Separate observed facts, inferences, recommendations, and decisions.
- Promote accepted conclusions into authority files; research alone does not
  authorize implementation.
- Verify time-sensitive compatibility, security, and release claims against
  current primary sources.
- Keep `docs/active-goal.md` current before handoff or context compaction.

## Documentation

Use Markdown ATX headings, short paragraphs, CommonMark lists, fenced code
blocks with language identifiers, and kebab-case filenames.

Place content by purpose:

- behavior and product boundaries: `docs/system-design.md`, `docs/behavior/`;
- architecture, contracts, risks, diagrams: `docs/architecture/`;
- rollout steps: `docs/roadmap/`;
- current checkpoint: `docs/active-goal.md`;
- evidence: `docs/research/`;
- rationale and accepted choices: `docs/decisions/`;
- superseded material: `docs/archive/`;
- reusable checks and operations: `scripts/`.

Every Markdown file must be reachable from root `README.md` through local
links. Add new or renamed files to `docs/README.md` or another linked index.

## Validation

For documentation-only changes, run from repository root:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Also run `scripts/test-markdown-links.ps1` when the link checker changes,
`scripts/test-initialize-vault-template.ps1` when initialization or template
behavior changes, and `scripts/check-mermaid.ps1` when diagrams change. Run any
additional checks required by the task. Never claim an unrun check passed.

## Git and pull requests

Use `<type>[(scope)]: <imperative summary>` with lowercase text, no trailing
period, and at most 50 characters.

Use the assigned worktree and branch. If none is assigned, start from clean,
current `main` on a short-lived `feat/`, `fix/`, `refactor/`, `docs/`, `chore/`,
or `spike/` branch. Do not commit or merge directly to `main` without explicit
authority.

Commit one logical change with its tests and documentation. Rebase only
unshared local history. Never use plain force push. Destructive reset, clean,
broad restore, shared-history rewrites, force-with-lease, or branch deletion
require explicit authority and exact-target verification.

Pull requests must state scope, affected decisions, remaining unknowns,
evidence locations, and exact validation commands run.

## Security

Never commit or expose credentials, tokens, private endpoints, account or
device identifiers, raw logs, database dumps, or personal note content. Secret
checks must report filenames or paths only, never matched values. Planned
architecture and configuration are not proof of deployed behavior.
