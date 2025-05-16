#!/bin/bash

#Prompt for the input file
read -e -p "📄 Enter the path to the file containing Discord webhook URLs: " file

#Check if file exists
if [[ ! -f "$file" ]]; then
  echo "❌ File does not exist."
  exit 1
fi

echo "🔎 Checking webhooks..."

#Loop through each URL in the file
while IFS= read -r url; do
#Skip empty lines
  [[ -z "$url" ]] && continue

#Senda a test POST request
  status=$(curl -s -o /dev/null -w "%{http_code}" -H "Content-Type: application/json" \
    -X POST -d '{"content":"Hello! This is a Test Message!"}' "$url")

  if [[ "$status" == "204" ]]; then
    echo "✅ VALID:   $url"
  else
    echo "⚠️ INVALID: $url (HTTP $status)"
  fi
done < "$file"

echo "🏁 Done checking all webhooks!"
