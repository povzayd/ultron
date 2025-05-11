#!/bin/bash

# Usage: ./check_grafana_token.sh <GRAFANA_URL> <TOKEN>
GRAFANA_URL="$1"
TOKEN="$2"

if [ -z "$GRAFANA_URL" ] || [ -z "$TOKEN" ]; then
  echo "Usage: $0 <GRAFANA_URL> <TOKEN>"
  exit 1
fi

# Try permissions endpoint first (works for service accounts, API tokens, OAuth tokens)
response=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: Bearer $TOKEN" \
  "$GRAFANA_URL/api/access-control/user/permissions")

if [ "$response" -eq 200 ]; then
  echo "Token is valid."
else
  echo "Token is invalid or expired (HTTP $response)."
fi
