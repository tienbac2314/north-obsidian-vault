Act as an adversarial systems designer. We are replacing an overbuilt personal knowledge pipeline, not preserving it. Use only supplied sources. Distinguish source-backed facts, community anecdotes, and your own inference. Cite source titles for every material claim.

User writes primarily in Obsidian. Ordinary notes must remain untouched. Moving a note into `INBOX/Pending Agent Review` explicitly requests processing and a separate proposed result. Telegram remains ordinary Hermes chat, not capture. Avoid paid Obsidian Sync. Oracle VPS already runs Hermes and 9Router. First release should omit OpenViking, embeddings, custom Python workspace service, and custom SQLite unless a concrete invariant cannot be met otherwise.

Answer these tasks:

1. Decompose required responsibilities: human note interface, multi-device sync, independent recovery, Hermes access, edit authorization, proposal review, generation-model gateway, and optional retrieval. State which can share a component and which must remain conceptually separate.
2. Identify every component or mechanism in current `system-design.md` that can be deleted, postponed, or replaced by an existing extension.
3. Compare three deployable shapes:
   - Self-hosted LiveSync plus official CLI filesystem mirror plus Hermes bundled Obsidian skill.
   - Fast Note Sync plus its MCP integration.
   - A local-first bridge using Local REST API or direct filesystem access without an always-on writable VPS vault.
4. For each shape, evaluate current deployability, Android/Windows usability, privacy, conflict behavior, outage behavior, review enforcement, recovery, maintenance burden, and dependence on unresolved upstream work.
5. Explicitly analyze LiveSync issue #1036 and Fast Note Sync issues #342, #339, and #346. Do not turn allegations into proven vulnerabilities.
6. Decide whether folder state plus Markdown proposal files plus Git history can replace custom SQLite workflow state. Give exact failure cases where it cannot.
7. Propose the fewest-component architecture that is safe enough to start using now. If no option safely supports always-on VPS writes today, say so and design a useful temporary mode rather than inventing a patch.
8. Explain what happens when sync, Hermes, 9Router, or upstream model providers are unavailable. Local Obsidian writing must continue, and queued work must not be silently lost.
9. State strongest argument against your recommendation and what evidence would change it.
10. End with:
   - recommended architecture now;
   - upgrade path after upstream fixes;
   - components intentionally omitted;
   - one remaining user decision that materially changes architecture.

Do not recommend new databases, queues, custom daemons, vector stores, orchestration frameworks, or backup products unless existing sources prove a required invariant cannot be met more simply. Do not assume prompt instructions alone enforce filesystem permissions.
