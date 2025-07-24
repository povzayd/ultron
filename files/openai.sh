#!/bin/bash
echo "🔐 OpenAI API Key Validator"
read -ep "📄 Enter the filename containing API keys: " FILE
if [ ! -f "$FILE" ]; then
  echo "❌ File not found: $FILE"
  exit 1
fi
echo "🔍 Validating API keys from '$FILE'..."
#Read and validate each key
while IFS= read -r API_KEY || [[ -n "$API_KEY" ]]; do
#Skp empty lines
  if [ -z "$API_KEY" ]; then
    continue
  fi
#Make API request
  response=$(curl -s -o /dev/null -w "%{http_code}" https://api.openai.com/v1/models \
    -H "Authorization: Bearer $API_KEY")

#Check the HTTP response code
  case "$response" in
    200)
      echo "✅ VALID         : $API_KEY"
      ;;
    401)
      echo "❌ INVALID       : $API_KEY"
      ;;
    429)
      echo "⚠ RATE-LIMITED  : $API_KEY"
      ;;
    *)
      echo "❓ UNKNOWN ($response): $API_KEY"
      ;;
  esac
done < "$FILE"
#working push now!!!!!!
