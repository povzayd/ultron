#!/bin/bash

read -e -p "Enter the path to your API keys file: " KEYS_FILE

if [[ ! -f "$KEYS_FILE" ]]; then
  echo "File not found: $KEYS_FILE"
  exit 1
fi

#Function to check a single key
check_key() {
  local API_KEY="$1"
# Skip empty lines
  [[ -z "$API_KEY" ]] && exit 0

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Accept: application/vnd.heroku+json; version=3" \
    https://api.heroku.com/account)

  if [[ "$RESPONSE" -eq 200 ]]; then
    echo "✅ $API_KEY: VALID"
  else
    echo "❌ $API_KEY: INVALID"
  fi
}

export -f check_key

#Run 10 checks in parallel (adjust -P 10 as needed)
grep -v '^\s*$' "$KEYS_FILE" | xargs -P 10 -n 1 -I {} bash -c 'check_key "$@"' _ {}

