# Supermemory current state

## Verified facts

- Self-hosted server version `0.0.5` and embedded engine were running on the Oracle VPS.
- Local data was active and modified on 2026-07-19.
- Embedding plan was pinned to `gemini-embedding-2-preview`, 768 dimensions, through a named OpenAI-compatible endpoint that was not the user-managed 9Router hostname.
- Official 0.0.5 documentation says embedding choice is locked so incompatible vectors cannot mix, even when dimensions match.
- Historical `my-opencode-setup` work made Supermemory sole persistent memory owner after removing Mem0.

## Raw finding

The running service proves local semantic storage is available. It does not show that the user enjoys its workflow, that captures preserve source fidelity, or that retrieved memory causes growth.

## Analysis

Supermemory solves a later retrieval/context problem. Current failure occurs earlier: raw source is saved without personal interpretation or review. Sending every capture directly into memory extraction risks losing source boundaries, inventing durable conclusions, and creating a corpus the user still will not review.

## Recommendation status

Keep Supermemory outside the MVP critical path and use it as an experiment comparator. Do not delete or migrate existing data. A future evaluation should measure:

- exact raw-source preservation;
- provenance from extracted memory to capture;
- correction/deletion propagation;
- export and restore;
- retrieval precision against keyword/file search;
- effect on weekly review usefulness.

## Uncertainty

No current API usage history, restore exercise, or user-rated retrieval sample was inspected. "Not enjoying it" is a valid usability observation, not a technical failure diagnosis.

