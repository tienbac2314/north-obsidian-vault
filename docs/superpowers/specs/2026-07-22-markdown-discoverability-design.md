# Markdown discoverability design

Status: completed historical specification. Current behavior is enforced by [`scripts/check-markdown-links.ps1`](../../../scripts/check-markdown-links.ps1).

Date: 2026-07-22
Status: Approved through standing user authorization to choose the best documented option

## Goal

Make every tracked Markdown file discoverable from root `README.md` while preserving current broken-link validation. A newly added or renamed Markdown file must fail repository checks until ordinary Markdown links connect it to the documentation graph.

## Considered approaches

### Central catalog plus graph traversal

Use `docs/README.md` as a concise grouped catalog and traverse local Markdown links from root `README.md`. This keeps navigation and validation based on the same links readers use.

### Directory indexes

Add an index to every documentation directory and require parent-to-child navigation. This distributes ownership but adds several files and repeated structure without improving this repository's small documentation set.

### Separate manifest

List required documents in a machine-oriented manifest. This makes validation direct but creates a second inventory that can disagree with reader-facing navigation.

## Decision

Use central catalog plus graph traversal. Root `README.md` remains the graph entrypoint. `docs/README.md` groups current authority, superseded design history, research, and raw evidence, and links every tracked Markdown document that is not already reached through another intentional entrypoint.

No new dependency or configuration format is introduced. Markdown remains both navigation interface and validation input.

## Components

### Documentation catalog

`docs/README.md` provides short group descriptions and explicit local links. Status labels continue to distinguish current authority, provisional work, superseded history, and raw evidence.

### Link checker

`scripts/check-markdown-links.ps1` keeps its current target-existence checks. It also builds a directed graph among tracked Markdown files, beginning at `README.md`, and reports every tracked Markdown file not visited through a local Markdown link.

Only tracked `.md` files participate. External URLs, email links, image links, anchor-only links, and link-shaped examples inside fenced code blocks do not create graph edges. Links to tracked Markdown files may include fragments or percent-encoded path characters. Existing broken-link reporting remains independent from reachability reporting.

### Contributor rule

`AGENTS.md` states that every new or renamed Markdown file must be connected to the root documentation graph. It lists the regression command beside repository documentation checks.

## Data flow

1. Ask Git for tracked Markdown paths.
2. Read each file once, mask fenced code without changing line positions, and validate every remaining local link target as today.
3. Resolve local links that target tracked Markdown files into graph edges.
4. Traverse from root `README.md`.
5. Emit broken-link and unreachable-file failures together, then return a nonzero exit code when either class exists.

Path comparison follows Windows case-insensitive behavior in this repository while normalizing directory separators to forward slashes for Git-relative output.

## Failure handling

Failure output names only repository-relative paths and link line numbers; it never prints note contents. Missing root `README.md` is a checker failure. A local link may exist on disk yet remain a broken tracked-document reference if its Markdown target is not tracked.

The checker does not require every document to link back to the catalog. Reachability from root is sufficient, so deliberate transitive navigation remains valid.

## Testing

Add `scripts/test-markdown-links.ps1`. It creates isolated temporary Git repositories, copies the checker under test, and verifies:

- an unlinked tracked Markdown file produces a nonzero exit and names the orphan;
- a tracked Markdown file reached transitively from root passes;
- a missing target shown only inside fenced code does not become navigation or fail validation;
- temporary repositories are removed after each run.

Development follows red-green order: add the regression script, confirm the orphan expectation fails against current checker, add minimal traversal behavior, then confirm both cases pass. Repository completion checks include the regression script, link checker, secret scan, Mermaid validation, whitespace check, publisher integration test, and clean-history parity checks.

## Scope

This change improves repository documentation navigation only. It does not change product architecture, sync selection, Obsidian behavior, Hermes behavior, or runtime implementation gates.
