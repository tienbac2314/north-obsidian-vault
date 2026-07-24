# Dusk source and variant manifest

Date: 2026-07-25  
Status: immutable Goal 1 baseline

## Source authority

```text
C:\Users\TienBac\Documents\New project\dusk-obsidian-vault-master
```

This root is the sole current local Dusk authority. The separate historical
`C:\Users\TienBac\Documents\New project\Dusk` tree is outside Goal 1 source
scope.

## Complete source summary

| Measure | Value |
| --- | ---: |
| Directories | 421 |
| Files | 1,571 |
| Bytes | 293,256,520 |
| Safely hashed files | 1,425 |
| Excluded sensitive/configuration files | 146 |
| Excluded bytes | 1,310,186 |

Canonical safe file rows use:

```text
slash-normalized-relative-path|byte-length|uppercase-sha256
```

Rows are sorted, joined with LF, and end with one LF. Canonical safe-manifest
SHA-256:

```text
D7E55C61CD6395F938F1842CBED66D71D22DCD8480BA5EE2628CD5452CB3B6AB
```

Complete directory-inventory SHA-256:

```text
9D27733F0D0DD786414971CF96ECFA81EF18245FB58457E43A501CDFC5FFA756
```

## Top-level inventory

| Item | Kind | Bytes when file |
| --- | --- | ---: |
| `Dusk` | Directory | |
| `Dusk_empty` | Directory | |
| `Dusk_light` | Directory | |
| `Dusk_light_empty` | Directory | |
| `new from discord` | Directory | |
| `if you have the older zip file just update these` | Directory | |
| `Media` | Directory | |
| `Dusk.zip` | File | 18,423,995 |
| `Dusk_empty.zip` | File | 18,318,519 |
| `Dusk_light.zip` | File | 16,891,130 |
| `Dusk_light_empty.zip` | File | 16,784,441 |
| `README.md` | File | 4,372 |
| `LICENSE` | File | 1,068 |

## Safe variant manifests

| Top-level group | Safe files | Safe bytes | Canonical manifest SHA-256 |
| --- | ---: | ---: | --- |
| Root files | 6 | 70,423,525 | `3954E9597B1DD3409A774D5B82A30CF01048893B5D3F1E3C6C562CCFB0E42D6E` |
| `Dusk` | 371 | 42,331,960 | `91CED3ED4FAD2EBE4F78B5B133D19533ACEE9019BA937778BEA2B2808FE2AB4B` |
| `Dusk_empty` | 314 | 41,905,223 | `CAECEB59016EDFF4A44FA08AE03E64EB62CFB7582140C3242A55F20E468DBC28` |
| `Dusk_light` | 343 | 35,878,020 | `C03D3D3850BF4D30AB9BA769D9257375E8BD09997F7C5FD06EF8C03E1638264A` |
| `Dusk_light_empty` | 286 | 35,451,283 | `DFB98C6486B8E5F80C5BB3D9489E47A467E842A5C5E757E6760BC31A8A056980` |
| `new from discord` | 91 | 2,497,754 | `2BFB8BB1427A839FE6EAB8F055F1D7E92CE51CEEA90AB5699667D942974DE70B` |
| Update folder | 6 | 42,564 | `7BDBA55712B5BEC00F14284725BCC22965084AC5F59B9A70F3FBF4486AAD09B6` |
| `Media` | 8 | 63,416,005 | `72707C3BAD6C688B2299E5DA8E054667A8FB79EF1203ABE55DAF2F569A379E46` |

These hashes exclude sensitive/configuration files by design. They are stable
comparison anchors, not claims about excluded bytes.

## Secret exclusions

Preflight never opened or hashed:

- `.obsidian/todoist-token`;
- community-plugin `data.json`;
- any path segment whose name indicates token, secret, credential, password,
  API key, or authentication data.

Later configuration compatibility work requires an explicit safe-field
allowlist per plugin. No full `data.json` copy or dump is authorized.

## Tablet source comparison

Tablet source:

```text
/sdcard/Documents/dusk-obsidian-vault-master
```

Observed totals match PC exactly:

| Measure | PC | Android |
| --- | ---: | ---: |
| Files | 1,571 | 1,571 |
| Bytes | 293,256,520 | 293,256,520 |
| Safe manifest rows | 1,425 | 1,425 |
| Canonical safe-manifest SHA-256 | `D7E55C61...B6AB` | `D7E55C61...B6AB` |

ADB rendered the curly apostrophe in two literature-note filenames as mojibake
on transport. Variant, length, and file SHA-256 uniquely mapped each row back
to the PC path. No tablet file was renamed or changed.

## Raw evidence

Untracked raw files remain under:

```text
G:\Dusk-Goal1-Discovery-20260725\source-manifests
```

- `source-files.canonical.txt`
- `source-files.csv`
- `source-directories.txt`
- `source-summary.json`
- `android-source-files.canonical.txt`

Repository reports retain counts and hashes only. Raw rows stay outside Git to
avoid importing demo-note filenames or sensitive configuration topology into
review history.

## Baseline use

Before and after every desktop or Android experiment:

1. compare source authority against the canonical safe-manifest hash;
2. create a new disposable copy outside source and live vault;
3. remove or disable sync and external-writer state in the disposable copy;
4. write a new copy manifest and rollback checkpoint;
5. never reuse first-open baseline for plugin updates.

