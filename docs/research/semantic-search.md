# Semantic retrieval evaluation

## Problem framing

Semantic search is useful only if it helps retrieve known valuable notes that metadata, links, and full-text search miss. It does not create understanding and can hide provenance behind similarity scores.

## Baseline first

MVP retrieval stack:

1. exact source/capture/note IDs;
2. topic/project/content-type fields;
3. SQLite FTS over raw and approved derived text;
4. explicit related-note links;
5. recency and review-status filters.

This is inspectable, cheap, and adequate for a small corpus.

## Trigger for vectors

Add semantic retrieval only after at least 30 approved notes and two curated eight-question test sets. Trigger if FTS returns fewer than six correct top-five results twice or user repeatedly cannot find known material.

## Embedding integrity

An index generation is defined by:

```text
provider + model + dimensions + preprocessing + chunker version + distance metric
```

All fields are immutable for that generation. Never silently mix vectors. Rebuild into new generation, compare, then atomically switch. Preserve source IDs so indexes remain disposable.

## 9Router decision

Do not use model combos or cross-model fallback for embeddings. Current Supermemory correctly pins one embedding plan; official server rejects incompatible switching even with matching dimensions. Follow same rule.

Possible transport choices:

- direct pinned provider endpoint: recommended;
- local pinned embedding model: future cost/privacy experiment;
- 9Router exact no-fallback route: acceptable only if gateway can guarantee invariant and fails closed;
- 9Router combo: rejected.

## Evaluation

Measure top-k relevance, source provenance, correction/deletion propagation, latency, cost, and failure behavior. Keep an answer key written before running either system. Compare FTS, Supermemory, and later OpenViking on identical approved corpus.

## Security

Embedding calls expose content. Work-sensitive items default to local-only/no embedding unless policy permits. Do not log raw embedding requests. Delete vectors when source retention requires deletion.

## Remaining uncertainty

Corpus language mix, query style, and expected size are unknown. No vector backend is justified today.
