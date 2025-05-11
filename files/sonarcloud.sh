#!/bin/bash

read -e -p "Enter the path to the file containing SonarCloud tokens (one per line): " TOKEN_FILE

if [[ ! -f "$TOKEN_FILE" ]]; then
  echo "File not found!"
  exit 1
fi

while IFS= read -r SONARCLOUD_TOKEN; do
  [[ -z "$SONARCLOUD_TOKEN" ]] && continue
  RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${SONARCLOUD_TOKEN}:" https://sonarcloud.io/api/languages/list)
  if [ "$RESPONSE_CODE" -eq 200 ]; then
    echo "Token '$SONARCLOUD_TOKEN' is 😍VALID."
  else
    echo "Token '$SONARCLOUD_TOKEN' is 😭INVALID (HTTP $RESPONSE_CODE)."
  fi
done < "$TOKEN_FILE"
