# Hermes and Telegram current state

## Verified facts

- One Hermes Gateway process was connected to Telegram polling on 2026-07-19.
- Sanitized Gateway state reported one Telegram DM target and no active agent at inspection time.
- Hermes configuration enabled Telegram toolsets including vision, files, memory, scheduling, and web access.
- Hermes used a custom model provider through a loopback OpenAI-compatible `/v1` endpoint served by 9Router.
- Official Hermes supports one Gateway process for multiple messaging platforms and custom model endpoints.
- Telegram Bot API 10.2 exposes unique `update_id`, reply context, media-group IDs, and retryable webhook delivery.

## Observation about current behavior

The user encounters useful material in AI chats, browser articles/Educative, and editor/terminal work. Current capture is usually unstructured copy-paste into a blank page, sometimes forgotten. Sustainable manual effort is about two minutes per day, so form-heavy capture will fail.

## Analysis

Telegram is already available on phone and PC and accepts text, links, screenshots, files, forwards, and replies. Hermes is useful as an orchestrator, but sending a message into a conversational agent is not equivalent to durable ingestion. If model execution starts before raw persistence, a 9Router outage can lose or delay the capture.

## Requirement

Use one bot initially, but split its internal responsibilities:

1. **Capture adapter:** validate sender, persist Telegram update and attachment metadata, then acknowledge.
2. **Processor:** classify/group/synthesize asynchronously through 9Router or another model endpoint.
3. **Digest publisher:** deliver review and export to Notion when available.

These can run in one process for MVP. Boundary matters more than deployment count.

## Unverified questions

- Can installed Hermes expose a pre-agent hook that persists the raw update before model execution?
- Does Hermes confirm Telegram polling offsets only after session state is safely written?
- Are screenshots downloaded before Telegram's 24-hour update retention window expires?
- Does work policy permit copied content to leave employer-controlled systems?
