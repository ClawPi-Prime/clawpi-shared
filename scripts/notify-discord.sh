#!/bin/bash
# Send a message to Discord #meta-discussions
# Usage: notify-discord.sh "message text"
#
# Requires DISCORD_BOT_TOKEN env var to be set, or reads from
# ~/.openclaw/openclaw.json via openclaw CLI.

CHANNEL_ID="1485230521419169842"
MESSAGE="${1:-ping}"

# Read token from openclaw config at runtime
DISCORD_BOT_TOKEN=$(openclaw config get channels.discord.accounts.default.token 2>/dev/null | tr -d '"')

if [ -z "$DISCORD_BOT_TOKEN" ]; then
  echo "notify-discord: no token available" >&2
  exit 1
fi

curl -s -X POST "https://discord.com/api/v10/channels/${CHANNEL_ID}/messages" \
  -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"content\":\"${MESSAGE}\"}" > /dev/null
