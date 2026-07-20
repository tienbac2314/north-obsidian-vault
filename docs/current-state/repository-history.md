# Repository history relevant to this design

Status: verified historical evidence, accessed 2026-07-19.

The existing [`my-opencode-setup`](https://github.com/tienbac2314/my-opencode-setup) repository records three relevant phases:

1. **Mem0 integration and removal.** Self-hosted compatibility required request rewriting, fallback tools, and runtime workarounds. Commit `fc9ffcb84f9c77bcc5fb132debdfa3becf4e2ab1` removed active Mem0 use and established Supermemory-only memory ownership.
2. **Supermemory adoption.** Commit `5086f0803e1e5e2a8a0ffeda85957bab18908a01` added Supermemory client/server switching. Current repository metadata still pins the OpenCode wrapper integration, but this does not establish fit for a personal capture pipeline.
3. **OpenViking evaluation.** Commit `0ab10428bb48303c77ae19ee7e9bb66a274b81b1` recommended a gated pilot, not cutover. Backup/restore, isolation, import fidelity, outage replay, and dual-client behavior remained acceptance gates.

9Router was already part of model discovery. Commit `058581c3c42d03d9a89e30f0f0ecb280232f8300` corrected missing models and capabilities, showing both its usefulness and integration surface.

## Analysis

History argues against choosing a memory platform before validating capture and review behavior. Each memory backend can be added behind explicit interfaces later; none should own raw ingestion in MVP.

## Source trail

Detailed branch, commit, path, and interpretation records live in [`research-notes/repo-findings.md`](../../research-notes/repo-findings.md). Some historical documents are not in current `master` tree and were inspected with `git show <commit>:<path>`.
