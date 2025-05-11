#!/bin/bash

echo "====================================="
echo "🔑 ipstack API Key Validator"
echo "====================================="
echo

read -e -p "📄 Enter the path to your ipstack API key file (one key per line): " INPUT_FILE

if [ ! -f "$INPUT_FILE" ]; then
  echo "❌ File not found: $INPUT_FILE"
  exit 1
fi

echo
echo "🚦 Starting validation of keys in $INPUT_FILE..."
echo "-----------------------------------"

while IFS= read -r KEY || [ -n "$KEY" ]; do
  [[ -z "$KEY" ]] && continue
  KEY=$(echo "$KEY" | xargs)

  RESPONSE=$(curl -s "https://api.ipstack.com/65.77.88.66?access_key=$KEY")

  # Check for "success":false in response
  if echo "$RESPONSE" | grep -q '"success":false'; then
    ERROR_TYPE=$(echo "$RESPONSE" | grep -o '"type":"[^"]*"' | cut -d':' -f2 | tr -d '"')
    echo "❌ $KEY is INVALID ($ERROR_TYPE)"
  else
    IP=$(echo "$RESPONSE" | grep -o '"ip":"[^"]*"' | cut -d':' -f2 | tr -d '"')
    if [[ -n "$IP" ]]; then
      echo "✅ $KEY is VALID (IP: $IP)"
    else
      echo "⚠️  $KEY: Unexpected response"
    fi
  fi
done < "$INPUT_FILE"

echo "-----------------------------------"
echo "🎉 Validation complete!"
