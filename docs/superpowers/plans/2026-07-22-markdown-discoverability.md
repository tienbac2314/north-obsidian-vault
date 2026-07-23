# Markdown Discoverability Implementation Plan

Status: completed historical plan. Non-authoritative; do not execute. Current behavior is enforced by [`scripts/check-markdown-links.ps1`](../../../scripts/check-markdown-links.ps1).

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make every tracked Markdown file reachable from root `README.md` and reject future orphan documents.

**Architecture:** `docs/README.md` becomes complete grouped catalog. Existing PowerShell link checker builds graph from same local links it validates, traverses from root `README.md`, and reports tracked Markdown files not reached.

**Tech Stack:** Markdown, PowerShell 5.1, Git

## Global Constraints

- Keep Markdown as only navigation and validation input; add no dependency or manifest.
- Preserve existing broken-local-link behavior and output path privacy.
- Include only Git-tracked `.md` files in reachability graph.
- Keep root `README.md` as graph entrypoint.
- Work and commit only on `research/full-system-design-dev`; push it normally.
- Publish `research/full-system-design` only through `scripts/publish-feature-clean.ps1` after all work is committed and verified.

---

### Task 0: Exclude fenced examples from navigation

**Files:**
- Create: `scripts/test-markdown-links.ps1`
- Modify: `scripts/check-markdown-links.ps1`
- Modify: `docs/superpowers/specs/2026-07-22-markdown-discoverability-design.md`
- Modify: `docs/superpowers/plans/2026-07-22-markdown-discoverability.md`

**Interfaces:**
- Consumes: Markdown source text
- Produces: source text with fenced-code characters masked and original line endings preserved for link scanning

- [ ] **Step 1: Write focused fenced-code regression test**

Create `scripts/test-markdown-links.ps1` with checker invocation and temporary-repository helpers from Task 2, but only this fixture and assertion:

```powershell
$fence = ([string][char]96) * 3
[IO.File]::WriteAllText(
    (Join-Path $repo 'README.md'),
    "# Root`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
)
Invoke-Git -WorkingDirectory $repo -Arguments @('init', '-b', 'main')
Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

$fencedResult = Invoke-Checker -Path $repo
if ($fencedResult.ExitCode -ne 0) {
    throw "Checker treated a fenced example as navigation:`n$($fencedResult.Output)"
}
```

- [ ] **Step 2: Run test and confirm red state**

Run:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
```

Expected: exit 1 because current checker reports `missing.md` as a broken local link.

- [ ] **Step 3: Add fenced-code masking before link matching**

Add this function above checker state initialization:

```powershell
function Get-LinkScanContent {
    param([Parameter(Mandatory)] [string]$Content)

    $insideFence = $false
    $fenceMarker = ''
    $fenceLength = 0
    $result = [Text.StringBuilder]::new($Content.Length)

    foreach ($line in [regex]::Split($Content, '(?<=\n)')) {
        $lineBody = $line.TrimEnd([char[]]"`r`n")
        if (-not $insideFence) {
            $opening = [regex]::Match($lineBody, '^ {0,3}(?<fence>`{3,}|~{3,})')
            if (-not $opening.Success) {
                [void]$result.Append($line)
                continue
            }

            $insideFence = $true
            $fenceMarker = $opening.Groups['fence'].Value.Substring(0, 1)
            $fenceLength = $opening.Groups['fence'].Value.Length
        }
        else {
            $closingPattern = '^ {0,3}' + [regex]::Escape($fenceMarker) + '{' + $fenceLength + ',}[ \t]*$'
            if ($lineBody -match $closingPattern) {
                $insideFence = $false
            }
        }

        [void]$result.Append([regex]::Replace($line, '[^\r\n]', ' '))
    }

    return $result.ToString()
}
```

Inside each Markdown-file loop, change link matching to:

```powershell
$content = [IO.File]::ReadAllText($fullFile)
$scanContent = Get-LinkScanContent -Content $content
$matches = [regex]::Matches($scanContent, '(?<!\!)\[[^\]]+\]\((?<target>[^)]+)\)')
```

- [ ] **Step 4: Run focused and baseline verification**

Run:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: fenced-code regression, repository links, and secret scan pass; whitespace check exits 0.

- [ ] **Step 5: Commit and push parser fix**

```powershell
git add docs/superpowers/specs/2026-07-22-markdown-discoverability-design.md docs/superpowers/plans/2026-07-22-markdown-discoverability.md scripts/check-markdown-links.ps1 scripts/test-markdown-links.ps1
git commit -m "fix(docs): ignore fenced link examples"
git push
```

Expected: one parser-fix commit appears on `origin/research/full-system-design-dev`.

### Task 1: Complete documentation catalog

**Files:**
- Modify: `docs/README.md`
- Modify: `AGENTS.md`

**Interfaces:**
- Consumes: current status vocabulary and authority ordering in `docs/README.md`
- Produces: reader-facing links from root graph to every tracked Markdown file

- [ ] **Step 1: Replace `docs/README.md` with complete grouped catalog**

```markdown
# Documentation catalog

Root [`README.md`](../README.md) is graph entrypoint. This catalog links every tracked Markdown document and labels its role. [`AGENTS.md`](../AGENTS.md) defines repository contribution rules.

## Current authority

Read these before continuing product design:

1. [Active goal](current-state/active-goal.md) - current checkpoint, settled choices, and exact next action.
2. [Simplification brief](research/simplification-brief.md) - fixed product requirements and intentionally removed components.
3. [Sync and agent extension evaluation](research/sync-and-agent-extensions.md) - completed transport and extension evidence.
4. [NotebookLM adversarial review](research/notebooklm-adversarial-review.md) - completed challenge, retractions, and retained conclusions.
5. [Hermes research](research/hermes.md) and [Obsidian research](research/obsidian.md) - current component evidence.
6. [Decision log](decisions/decision-log.md) and [unresolved questions](decisions/unresolved-questions.md).
7. [Feature branch workflow](current-state/branch-workflow.md).

No replacement product architecture specification or implementation plan is approved. Sync choice, remaining design sections, written spec review, and implementation planning remain required gates.

## Repository maintenance

- [Markdown discoverability design](superpowers/specs/2026-07-22-markdown-discoverability-design.md)
- [Markdown discoverability implementation plan](superpowers/plans/2026-07-22-markdown-discoverability.md)
- [Repository history](current-state/repository-history.md)
- [Pull-request summary](pull-request-summary.md)

## Supporting current-state records

- [Hermes and Telegram](current-state/hermes-and-telegram.md)
- [Supermemory inventory](current-state/supermemory.md)
- [VPS inventory](current-state/vps-inventory.md)

These records describe observed context. Planned architecture is not proof of deployed behavior.

## Research and evidence

### Current component evidence

- [9Router](research/9router.md)
- [Hermes](research/hermes.md)
- [Obsidian](research/obsidian.md)
- [Sync and agent extensions](research/sync-and-agent-extensions.md)

### Challenge and simplification records

- [Simplification brief](research/simplification-brief.md)
- [NotebookLM adversarial review](research/notebooklm-adversarial-review.md)
- [NotebookLM simplification follow-up](research/notebooklm-simplification-followup.md)
- [NotebookLM simplification prompt](research/notebooklm-simplification-prompt.md)

### Historical option research

- [Notion](research/notion.md)
- [OpenViking](research/openviking.md)
- [Semantic search](research/semantic-search.md)
- [Storage options](research/storage-options.md)
- [Supermemory](research/supermemory.md)
- [Telegram](research/telegram.md)

### Raw investigations

- [Official sources](../research-notes/official-sources.md)
- [Repository findings](../research-notes/repo-findings.md)
- [VPS findings](../research-notes/vps-findings.md)

Raw investigations preserve evidence and may include historical observations. Refresh only facts that are time-sensitive or explicitly questioned.

## Superseded design history

These files preserve earlier, overbuilt architecture. They are not implementation instructions:

- [Executive summary](executive-summary.md)
- [System design](system-design.md)
- Architecture: [options](architecture/options.md), [recommended architecture](architecture/recommended-architecture.md), [data model](architecture/data-model.md), [failure handling](architecture/failure-handling.md), [security](architecture/security.md), and [diagrams](architecture/diagrams.md)
- Behavior: [capture to digest](behavior/capture-to-digest.md), [interaction examples](behavior/interaction-examples.md), and [experiments](behavior/experiments.md)
- Roadmaps: [MVP](roadmap/mvp.md) and [phased roadmap](roadmap/phased-roadmap.md)
- Superseded spec: [Obsidian and OpenViking workspace design](superpowers/specs/2026-07-20-obsidian-openviking-workspace-design.md)
- Superseded plans: [personal knowledge pipeline research](superpowers/plans/2026-07-19-personal-knowledge-pipeline-research.md) and [first-release implementation](superpowers/plans/2026-07-21-first-release-implementation.md)

## Status vocabulary

- **Current:** governs present design work.
- **Provisional:** researched recommendation awaiting approval.
- **Superseded:** preserved history; do not implement.
- **Postponed:** outside first design until evidence justifies promotion.
```

- [ ] **Step 2: Add graph rule to `AGENTS.md` documentation conventions**

Append this sentence to `Documentation Style & Naming Conventions`:

```markdown
Every new or renamed Markdown file must be reachable from root `README.md` through local Markdown links; add it to `docs/README.md` when no narrower current entrypoint fits.
```

- [ ] **Step 3: Verify catalog documentation**

Run:

```powershell
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
git diff --check
```

Expected: link and secret checks print passed messages; `git diff --check` prints nothing and exits 0.

- [ ] **Step 4: Commit and push catalog**

```powershell
git add AGENTS.md docs/README.md
git commit -m "docs: catalog repository documents"
git push
```

Expected: one documentation commit appears on `origin/research/full-system-design-dev`.

### Task 2: Enforce root-graph reachability

**Files:**
- Modify: `scripts/test-markdown-links.ps1`
- Modify: `scripts/check-markdown-links.ps1`
- Modify: `AGENTS.md`

**Interfaces:**
- Consumes: tracked `.md` paths from `git ls-files` and ordinary local Markdown links
- Produces: exit 1 plus `Unreachable Markdown file:` and the repository-relative path for each orphan; exit 0 only when every tracked Markdown file is reached from root

- [ ] **Step 1: Write isolated regression test**

Create `scripts/test-markdown-links.ps1`:

```powershell
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$checker = Join-Path $PSScriptRoot 'check-markdown-links.ps1'
if (-not (Test-Path -LiteralPath $checker)) {
    throw "Markdown link checker is missing: $checker"
}

function Invoke-Git {
    param(
        [Parameter(Mandatory)] [string]$WorkingDirectory,
        [Parameter(Mandatory)] [string[]]$Arguments
    )

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& git -C $WorkingDirectory @Arguments 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }
    if ($exitCode -ne 0) {
        throw "git $($Arguments -join ' ') failed:`n$($output -join "`n")"
    }
}

function Invoke-Checker {
    param([Parameter(Mandatory)] [string]$Path)

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& powershell -NoProfile -File (Join-Path $Path 'scripts/check-markdown-links.ps1') 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }
    return [pscustomobject]@{
        ExitCode = $exitCode
        Output = ($output -join "`n")
    }
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("markdown-link-test-" + [Guid]::NewGuid().ToString('N'))
$repo = Join-Path $tempRoot 'repo'
New-Item -ItemType Directory -Path (Join-Path $repo 'scripts') -Force | Out-Null

try {
    Copy-Item -LiteralPath $checker -Destination (Join-Path $repo 'scripts/check-markdown-links.ps1')
    $fence = ([string][char]96) * 3
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    Invoke-Git -WorkingDirectory $repo -Arguments @('init', '-b', 'main')
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $fencedResult = Invoke-Checker -Path $repo
    if ($fencedResult.ExitCode -ne 0) {
        throw "Checker treated a fenced example as navigation:`n$($fencedResult.Output)"
    }

    [IO.File]::WriteAllText((Join-Path $repo 'orphan.md'), "# Orphan`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $orphanResult = Invoke-Checker -Path $repo
    if ($orphanResult.ExitCode -eq 0) {
        throw 'Checker accepted an unlinked tracked Markdown file.'
    }
    if ($orphanResult.Output -notmatch [regex]::Escape('Unreachable Markdown file: orphan.md')) {
        throw "Checker did not name orphan.md:`n$($orphanResult.Output)"
    }

    New-Item -ItemType Directory -Path (Join-Path $repo 'docs') | Out-Null
    [IO.File]::WriteAllText(
        (Join-Path $repo 'README.md'),
        "# Root`n`n[Catalog](docs/catalog.md)`n`n${fence}markdown`n[Missing](missing.md)`n$fence`n"
    )
    [IO.File]::WriteAllText((Join-Path $repo 'docs/catalog.md'), "# Catalog`n`n[Orphan](../orphan.md)`n")
    Invoke-Git -WorkingDirectory $repo -Arguments @('add', '.')

    $linkedResult = Invoke-Checker -Path $repo
    if ($linkedResult.ExitCode -ne 0) {
        throw "Checker rejected transitively linked Markdown files:`n$($linkedResult.Output)"
    }

    Write-Host 'Markdown link checker tests passed.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
```

- [ ] **Step 2: Run regression test and confirm red state**

Run:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
```

Expected: exit 1 with `Checker accepted an unlinked tracked Markdown file.` Current checker validates targets but does not detect orphans.

- [ ] **Step 3: Replace checker with minimal graph implementation**

Replace `scripts/check-markdown-links.ps1` with:

```powershell
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$markdownFiles = @(& git -C $repoRoot ls-files '*.md')
if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked Markdown files.' }

function Get-LinkScanContent {
    param([Parameter(Mandatory)] [string]$Content)

    $insideFence = $false
    $fenceMarker = ''
    $fenceLength = 0
    $result = [Text.StringBuilder]::new($Content.Length)

    foreach ($line in [regex]::Split($Content, '(?<=\n)')) {
        $lineBody = $line.TrimEnd([char[]]"`r`n")
        if (-not $insideFence) {
            $opening = [regex]::Match($lineBody, '^ {0,3}(?<fence>`{3,}|~{3,})')
            if (-not $opening.Success) {
                [void]$result.Append($line)
                continue
            }

            $insideFence = $true
            $fenceMarker = $opening.Groups['fence'].Value.Substring(0, 1)
            $fenceLength = $opening.Groups['fence'].Value.Length
        }
        else {
            $closingPattern = '^ {0,3}' + [regex]::Escape($fenceMarker) + '{' + $fenceLength + ',}[ \t]*$'
            if ($lineBody -match $closingPattern) {
                $insideFence = $false
            }
        }

        [void]$result.Append([regex]::Replace($line, '[^\r\n]', ' '))
    }

    return $result.ToString()
}

$trackedByPath = @{}
$linksByFile = @{}
foreach ($relativeFile in $markdownFiles) {
    $normalized = $relativeFile.Replace('\', '/')
    $fullPath = [IO.Path]::GetFullPath((Join-Path $repoRoot $relativeFile))
    $trackedByPath[$fullPath] = $normalized
    $linksByFile[$normalized] = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
}

$failures = [Collections.Generic.List[string]]::new()
$checked = 0

foreach ($relativeFile in $markdownFiles) {
    $normalized = $relativeFile.Replace('\', '/')
    $fullFile = Join-Path $repoRoot $relativeFile
    $content = [IO.File]::ReadAllText($fullFile)
    $scanContent = Get-LinkScanContent -Content $content
    $matches = [regex]::Matches($scanContent, '(?<!\!)\[[^\]]+\]\((?<target>[^)]+)\)')

    foreach ($match in $matches) {
        $target = $match.Groups['target'].Value.Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }
        if ($target -match '^(?:https?://|mailto:|#)') { continue }

        $pathPart = ($target -split '#', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathPart)) { continue }

        $checked++
        $decoded = [Uri]::UnescapeDataString($pathPart)
        $candidate = Join-Path (Split-Path $fullFile -Parent) $decoded
        if (-not (Test-Path -LiteralPath $candidate)) {
            $line = ($content.Substring(0, $match.Index) -split "`n").Count
            $failures.Add("$relativeFile`:$line -> $pathPart")
            continue
        }

        $resolvedTarget = [IO.Path]::GetFullPath($candidate)
        if ([IO.Path]::GetExtension($resolvedTarget) -ieq '.md') {
            if (-not $trackedByPath.ContainsKey($resolvedTarget)) {
                $line = ($content.Substring(0, $match.Index) -split "`n").Count
                $failures.Add("$relativeFile`:$line -> $pathPart (Markdown target is not tracked)")
                continue
            }
            [void]$linksByFile[$normalized].Add($trackedByPath[$resolvedTarget])
        }
    }
}

$entrypoint = 'README.md'
$reachable = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$queue = [Collections.Generic.Queue[string]]::new()
$missingEntrypoint = -not $linksByFile.ContainsKey($entrypoint)
if (-not $missingEntrypoint) {
    [void]$reachable.Add($entrypoint)
    $queue.Enqueue($entrypoint)
}

while ($queue.Count -gt 0) {
    $source = $queue.Dequeue()
    foreach ($targetFile in $linksByFile[$source]) {
        if ($reachable.Add($targetFile)) {
            $queue.Enqueue($targetFile)
        }
    }
}

$unreachable = @($linksByFile.Keys | Where-Object { -not $reachable.Contains($_) } | Sort-Object)
foreach ($failure in $failures) {
    Write-Error "Broken local link: $failure" -ErrorAction Continue
}
if ($missingEntrypoint) {
    Write-Error "Missing Markdown entrypoint: $entrypoint" -ErrorAction Continue
}
foreach ($orphan in $unreachable) {
    Write-Error "Unreachable Markdown file: $orphan" -ErrorAction Continue
}

if ($failures.Count -gt 0 -or $missingEntrypoint -or $unreachable.Count -gt 0) {
    exit 1
}

Write-Host "Markdown link check passed: $checked local links; all $($markdownFiles.Count) files reachable from $entrypoint."
```

- [ ] **Step 4: Run isolated test and confirm green state**

Run:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
```

Expected: `Markdown link checker tests passed.` and exit 0.

- [ ] **Step 5: Register regression command in `AGENTS.md`**

Add after existing link-check command:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
```

Change testing guidance to:

```markdown
Run link-checker regression, link, secret, and whitespace checks for every documentation-checker change. Run link, secret, and whitespace checks for every documentation-only change. Run Mermaid validation when any diagram changes. Inspect rendered diagrams when layout or labels matter. No coverage target or unit-test framework exists until runtime implementation begins.
```

- [ ] **Step 6: Run focused and repository verification**

Run:

```powershell
powershell -NoProfile -File scripts/test-markdown-links.ps1
powershell -NoProfile -File scripts/check-markdown-links.ps1
powershell -NoProfile -File scripts/check-secrets.ps1
powershell -NoProfile -File scripts/check-mermaid.ps1
git diff --check
```

Expected: both link commands, secret scan, and Mermaid validation print passed messages; whitespace check prints nothing and exits 0.

- [ ] **Step 7: Commit and push checker**

```powershell
git add AGENTS.md scripts/check-markdown-links.ps1 scripts/test-markdown-links.ps1
git commit -m "feat(docs): reject orphaned Markdown"
git push
```

Expected: one checker commit appears on `origin/research/full-system-design-dev` and worktree is clean.
