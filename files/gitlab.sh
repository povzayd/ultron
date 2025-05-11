#!/bin/bash

read -e -p "Enter the path to your GitLab tokens file: " TOKENS_FILE

if [[ ! -f "$TOKENS_FILE" ]]; then
  echo "File not found: $TOKENS_FILE"
  exit 1
fi

GITLAB_API="https://gitlab.com/api/v4/personal_access_tokens/self"

while read -r TOKEN; do
  [[ -z "$TOKEN" ]] && continue

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
    --header "PRIVATE-TOKEN: $TOKEN" \
    "$GITLAB_API")

  if [[ "$RESPONSE" -eq 200 ]]; then
    echo "✅ $TOKEN: VALID"
  else
    echo "❌ $TOKEN: INVALID"
  fi
done < "$TOKENS_FILE"
