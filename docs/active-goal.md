# Active goal

Updated: 2026-07-23

## Objective

Land PR #2 with reviewed modular design aligned to FNS-only native attachments, reproducible core vault bootstrap, proposal-only Hermes Release 3, authenticated transactional Release 4A, and evidence-gated rollout. Runtime and VPS remain unchanged.

## Checkpoint

- Official Obsidian registry, plugin scorecards, GitHub manifests, READMEs, and repository searches confirm Drive Attachments is desktop-only and no current alternative meets every seamless private arbitrary-file requirement.
- DEC-028 replaces Windows-only Drive ingress with normal Obsidian attachment capture on both clients and FNS as sole live note and attachment transport.
- Current architecture, behavior, failure, security, roadmap, and interaction modules keep vault files as one attachment content authority and FNS as sole live synchronization transport; historical research and superseded decisions remain intact.
- DEC-030 replaces ambiguous `INBOX` and split proposal paths with one `STAGING` workflow: neutral capture, explicit review requests, incoming agent proposals, and visible reviewed feedback. Hermes remains deferred and may create a replacement only from explicit `revise` review after later promotion.
- DEC-031 keeps Release 3 proposal-only, then gates accepted filing, exact dependency patches, and weekly changed-note link gardening behind Release 4A evidence. No runtime Hermes access or mutation is authorized now.
- DEC-032 adds detailed in-vault human/agent manual under `SYSTEM/Guides`; guide documents operation but grants no authority.
- DEC-033 treats synchronized review gestures as intent, requires authenticated hash-bound receipts, and gives deterministic executor canonical path, concurrency, rollback, idempotency, budget, and retention contracts.
- DEC-034 adds non-destructive vault initializer, meaningful Home and templates, exact folder creation, safe-repeat test, and Stage 4 cross-platform bootstrap gate.
- Already-filed canonical notes remain in place through sidecar review requests; only raw Unsorted notes move into pending queue.
- Every generated plan/spec now declares current, completed, or superseded status in-file; current authority remains modular design.
- Markdown checker regression now covers fenced examples, ordinary broken links, untracked Markdown targets, orphan rejection, and transitive reachability.
- Full verification passed: Markdown regressions, vault initializer regressions, publisher regressions, 201 local links across 64 reachable Markdown files, secret scan across 73 tracked files, 9 rendered Mermaid diagrams, and whitespace.
- Independent whole-system review plus focused re-reviews report no unresolved Critical or Important findings.
- Publisher checkpoint verified remote dev, clean/dev tree equality, one clean commit over current `origin/main`, mergeable PR #2, intended diff, and updated PR description. Remote equality must be rechecked after any later bookkeeping commit; Git refs are final proof.

## Next action

Merge PR #2 through normal review, then verify `origin/main` matches published clean tree. That verification activates new workflow immediately: every later task starts from current `main` on short-lived branch. No legacy cleanup blocks Stage 1.

## Blockers

- FNS physical Windows/Android note and native-attachment gates remain unrun.
- Hermes gateway supervisor stability remains unresolved; no vault workload is authorized.
- Backup destination, cadence, encryption, and restore schedule remain Release 2 promotion gates.
- PR #2 merge and `main` tree verification remain only Git-workflow cutover gate. Generated clean branch deletion is optional afterward; permanent dev branch and publisher may remain as history.

## Authority

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- [Architecture modules](architecture/recommended-architecture.md)
- [Behavior and experiments](behavior/capture-to-digest.md)
- [First release](roadmap/mvp.md)
- [Phased roadmap](roadmap/phased-roadmap.md)
- [Decision log](decisions/decision-log.md)
- [Git workflow](git-workflow.md)

`docs/archive/`, `docs/superpowers/`, chat history, and NotebookLM output remain history or working evidence unless promoted into current modules or accepted decisions.
