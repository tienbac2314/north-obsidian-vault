# FNS implementation evidence and Oracle preflight

Status: current dated implementation evidence. Public facts and sanitized
observations support Stage 1 and Stage 2; they do not prove user-facing sync.

Observed: 2026-07-23.

## Public release facts

- Fast Note Sync server [`3.6.0`](https://github.com/haierkeys/fast-note-sync-service/releases/tag/3.6.0) was published 2026-07-20. Release supplies Linux ARM64 binary and multi-platform Docker image.
- Obsidian Fast Note Sync plugin [`2.4.0`](https://github.com/haierkeys/obsidian-fast-note-sync/releases/tag/2.4.0) was published 2026-07-20 and declares mobile support. Server and plugin release notes add manual conflict resolution.
- Verified Docker index digest is `sha256:560ab727f2a0bac804a6db9e467b68d7df1a1cf059e72dfccc0412aa4c62e89e`; ARM64 manifest is present.
- Server issues [`#339`](https://github.com/haierkeys/fast-note-sync-service/issues/339), [`#342`](https://github.com/haierkeys/fast-note-sync-service/issues/342), and [`#346`](https://github.com/haierkeys/fast-note-sync-service/issues/346) remain open. Passed Obsidian plugin review does not cover these server and authorization reports.
- Upstream configuration defaults include open registration and static example token keys. Deployment contract replaces them with closed registration and generated runtime-only keys.

## Sanitized Oracle preflight

| Check | Observed result | Gate |
|---|---|---|
| Architecture and OS | ARM64; Ubuntu 24.04 | Pass |
| Docker Engine | 29.1.3 | Pass |
| Docker Compose | 2.40.3 | Pass |
| Free root filesystem capacity | about 28 GB | Pass for synthetic pilot and one stopped-service copy |
| Proposed loopback port | unused | Pass |
| Proposed isolated runtime root | absent | Pass |
| Existing FNS container | none | Pass |
| Host Nginx | installed, valid configuration, inactive, no enabled route | Reject as assumed ingress |
| Cloudflare Tunnel | installed, active managed and PM2-supervised processes, valid local credentials | Pass only with new isolated tunnel |
| Existing tunnel routes | three, none to be edited | Isolation requirement |
| Host firewall | inactive; raw FNS bind must remain loopback | Mandatory control |

No hostname, IP address, account identifier, endpoint, credential, configuration
body, or raw log is recorded.

## Implementation inference

Observed host does not have reusable Nginx ingress described by earlier plan.
Starting dormant Nginx or inserting FNS into existing routes would create
unnecessary coupling. Dedicated Cloudflare Tunnel gives exact rollback boundary
while retaining loopback-only origin.

TLS hostname remains internet-reachable and FNS-authenticated. This does not
resolve reported server risks. Therefore:

- synthetic disposable account and vault only;
- no personal or employer content;
- no MCP, external REST consumer, sharing, Git, mirror, configuration sync, or headless client;
- no change to existing tunnel routes or process supervisors;
- failure preserves state and stops promotion.

Operational commands and recovery contract live in [FNS pilot operations](../../deploy/fns/README.md).

## Implementation checkpoint

Observed later on 2026-07-23:

- Pinned server image started healthy with all Linux capabilities dropped and raw listener on IPv6 loopback only.
- Dedicated unprivileged tunnel service validates its isolated configuration. Existing two cloudflared processes and three earlier routes were not edited.
- TLS health returned HTTP `200` from Windows. Oracle resolver retained stale DNS during immediate verification, so remote self-check was not treated as public-path authority.
- Registration remains closed. No FNS user, token, vault, MCP consumer, REST consumer, Git integration, sharing link, mirror, or headless client was created.
- Obsidian `1.12.7` and verified FNS plugin `2.4.0` assets were installed for one disposable Windows vault.
- Vault initializer regression passed, then created 18 directories and six starter files. Top-level roots are `DAILY`, `HUB`, `PARA`, `STAGING`, `SYSTEM`, and `ZETA`.
- Obsidian opened layout and presented first-open plugin trust warning. Automation stopped without changing Restricted Mode. Human acceptance and credential ownership are next gates.

Two runtime failures were contained before public use:

1. Capability-dropped container could not write host-owned `0700` bind mount. Contract now makes FNS config and storage root-owned before first start.
2. Dedicated tunnel account could not traverse deployment root, then `localhost` selected IPv4 against IPv6-only listener. Contract now grants traverse-only root access and pins tunnel origin to exact IPv6 loopback.

No personal notes entered pilot.
