#!/usr/bin/env bash

echo "🔍 Please enter the filename containing GitHub tokens:"
read -e -r token_file

if [[ ! -f "$token_file" ]]; then
  echo "❌ File not found. Exiting."
  exit 1
fi

line_number=0

while IFS= read -r token; do
  ((line_number++))
  [[ -z "$token" ]] && continue

  echo "📝 Checking token on line $line_number: ${token:0:6}******"
  http_status=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: token $token" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user)
  if [[ "$http_status" == "200" ]]; then
    echo "✅ Line $line_number: Token is valid!"
  else
    echo "⚠️  Token is INVALID or expired!"
  fi
done < "$token_file"
