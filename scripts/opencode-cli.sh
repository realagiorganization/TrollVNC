#!/usr/bin/env bash
set -euo pipefail

prompt=${1:-"Summarize TrollVNC in one sentence."}
api_key=${LLM_API_KEY:-}
api_url=${LLM_API_URL:-"https://api.openai.com/v1/chat/completions"}
model=${LLM_API_MODEL:-"gpt-4o-mini"}

if [[ -z "$api_key" ]]; then
  echo "LLM_API_KEY is required." >&2
  exit 1
fi

payload=$(cat <<JSON
{
  "model": "${model}",
  "messages": [
    {"role": "user", "content": "${prompt}"}
  ],
  "max_tokens": 80
}
JSON
)

response=$(curl -sS -X POST "$api_url" \
  -H "Authorization: Bearer ${api_key}" \
  -H "Content-Type: application/json" \
  -d "$payload")

printf '%s' "$response" | python - <<'PY'
import json
import sys

payload = sys.stdin.read()
try:
    data = json.loads(payload)
except json.JSONDecodeError:
    print("LLM response: invalid JSON")
    sys.exit(0)

choice = data.get("choices", [{}])[0]
content = choice.get("message", {}).get("content")
if content:
    print(content.strip())
else:
    print("LLM response received.")
PY
