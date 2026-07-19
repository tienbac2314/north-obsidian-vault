# Findings from `tienbac2314/my-opencode-setup`

Accessed: **2026-07-19**. Repository default branch: `master`. Head observed: `a2d3ae4b74cccd45871b883555b3d696b129c429`.

CodeGraph metadata exists in the repository, but no CodeGraph runtime was available in the current client. Discovery therefore used read-only `git log`, `git show`, and narrow text searches.

## Traceable findings

| Commit | Path | Verified fact | Historical context | Implication here |
|---|---|---|---|---|
| `5086f0803e1e5e2a8a0ffeda85957bab18908a01` | `config/supermemory.jsonc.example`, `scripts/toggle-memory.ps1` | Added switching support for a Supermemory client/server. | Repository was moving away from a difficult Mem0 integration. | Existing Supermemory use is an implementation history, not proof it should own this pipeline. |
| `fc9ffcb84f9c77bcc5fb132debdfa3becf4e2ab1` | `README.md`, `bootstrap.ps1`, `scripts/set-credentials.ps1` | Removed active Mem0 integration and established Supermemory-only memory ownership. | Commit message preserved Mem0 artifacts only for historical reference. | Reintroducing Mem0 would repeat removed complexity without solving capture behavior. |
| `058581c3c42d03d9a89e30f0f0ecb280232f8300` | `plugins/models-discovery.js`, `docs/opencode-bugs-known.md` | Added 9Router model discovery corrections and documented missing model/modalities behavior. | 9Router already served as centralized model inventory for OpenCode. | Current 9Router use is real, but discovery compatibility work shows gateway abstraction is not cost-free. |
| `0ab10428bb48303c77ae19ee7e9bb66a274b81b1` | `docs/research/openviking-memory-platform-comparison.md`, `docs/superpowers/plans/2026-07-15-openviking-pilot-migration.md` | Recommended an OpenViking pilot without cutover; required backup, isolation, import, outage, and dual-client gates. | Compared OpenViking with Supermemory and Mem0 and verified Hermes integration. | Reuse research, but do not treat OpenViking as approved production dependency. |
| `bf57a319b40b9fd5bd0bc2828c245ada3d8b1781` | `docs/superpowers/plans/2026-07-15-openviking-pilot-migration.md` | Updated version assumptions after research. | Demonstrates component versions change quickly. | Pin versions and record access dates in any pilot. |
| `7ad22c1e6cc456f8c1b8243dddfef7d32684974f` | `docs/history/architecture-evolution.md`, `docs/history/decisions.md` | Reconstructed history and stated current boundary: Supermemory owns persistent memory; OpenViking is inactive. | Later cleanup left some material available through Git history rather than current tree. | Cite commit and path, not only current working-tree presence. |

## Raw research finding

The historical OpenViking comparison identified a potentially useful shared context backend for OpenCode and Hermes, but also found maturity, automatic capture, isolation, migration, backup, and operational risks. This pipeline has a narrower first problem: reliably transform scattered captures into reviewed learning. Shared agent memory should not replace that problem definition.

## Analysis

Past work repeatedly increased integration complexity before proving user value. Mem0 needed compatibility shims; Supermemory became sole memory owner; OpenViking remained pilot-only. This history supports a reversible MVP with plain records and explicit promotion instead of another memory-platform migration.

## Uncertainty

Historical documents may describe versions that changed after their commit dates. Only the commit-local statement is treated as historical evidence; current capability claims use the official source register.
