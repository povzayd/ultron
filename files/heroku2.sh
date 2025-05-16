#!/bin/bash

read -e -p "Enter the path to your API keys file: " KEYS_FILE

if [[ ! -f "$KEYS_FILE" ]]; then
  echo "File not found: $KEYS_FILE"
  exit 1
fi

while read -r API_KEY; do
#

  [[ -z "$API_KEY" ]] && continue

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Accept: application/vnd.heroku+json; version=3" \
    https://api.heroku.com/account)

  if [[ "$RESPONSE" -eq 200 ]]; then
    echo "✅ $API_KEY: VALID"
  else
    echo "❌ $API_KEY: INVALID"
  fi
done < "$KEYS_FILE"
