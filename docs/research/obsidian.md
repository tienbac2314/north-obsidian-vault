# Obsidian evaluation

## Evidence

- Official source: [How Obsidian stores data](https://github.com/obsidianmd/obsidian-help/blob/21a11f649571d2fbf02b4d639c5c352009fe07e9/en/Files%20and%20folders/How%20Obsidian%20stores%20data.md), accessed 2026-07-19.
- Commit: `21a11f649571d2fbf02b4d639c5c352009fe07e9`.
- Verified: vaults are local folders containing Markdown plain-text notes; other editors can modify them; Obsidian maintains rebuildable metadata cache.
- Current state: Obsidian is not installed and no vault exists.

## Fit

Obsidian is a strong future reading/editing layer because pipeline can export durable notes as ordinary Markdown. It does not itself solve capture transformation or weekly synthesis.

## Recommendation

Postpone installation until MVP creates at least 20 useful durable notes or the user asks for local browsing. From day one, make export deterministic:

```text
knowledge/<topic-slug>/<note-id>.md
reviews/weekly/YYYY-Www.md
sources/<capture-id>.md   # metadata/reference, not necessarily full copyrighted payload
```

Use YAML properties only for stable machine fields; keep explanation readable without plugins. Never require a community plugin for core access.

## Tradeoffs

- Portable/offline/Git-friendly versus synchronization setup and potential merge conflicts.
- Excellent linking/manual curation versus no built-in reliable event queue.
- Local control versus attachment duplication and mobile sync choices.

## Uncertainty

Sync provider, mobile workflow, vault privacy, and Git strategy are undecided. OpenViking indexing of a future vault should be evaluated only after plain-file behavior works.
