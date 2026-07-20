# Semantic retrieval evaluation

## Baseline

Start with Obsidian filenames, folders, wikilinks/backlinks, properties where useful, and text search. Write bilingual query set before adding vectors. Semantic search must improve retrieval of known valuable notes, not merely produce plausible similarity.

## OpenViking gate

Pilot only after meaningful corpus exists and first release is stable. Compare top-k correctness, provenance, latency, deletion/update propagation, rebuild, privacy, and operator burden against plain vault search.

## Embedding integrity

Index generation fixes:

```text
provider + exact model + dimensions + normalization/preprocessing + chunker + metric
```

Never mix models, even if dimensions match. New contract builds isolated new generation. Outage fails closed.

## Transport experiment

| Choice | Benefit | Risk |
|---|---|---|
| Dedicated exact 9Router route | Central credentials/observability | Gateway outage; must prove no model substitution |
| Local Ollama `embeddinggemma` | Privacy and provider independence; bilingual candidate | ARM64 CPU indexing/rebuild latency and service burden |
| 9Router combo | Availability | Silent vector incompatibility |

9Router combo is rejected. Benchmark other two using identical corpus and answer key. Restricted/work notes default local-only or no embedding.
