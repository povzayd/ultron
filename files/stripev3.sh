#!/bin/bash

echo "🚀 Stripe API Key Validator 🚀"

read -e -p "📂 Enter the path to the text file containing Stripe API key and secret pairs (key:secret per line): " filepath

if [[ ! -f "$filepath" ]]; then
  echo "❌ File not found! Please check the path and try again."
  exit 1
fi

line_number=0

while IFS= read -r line || [[ -n "$line" ]]; do
  ((line_number++))
  
  # Skip empty lines
  if [[ -z "$line" ]]; then
    echo "⚠️  Line $line_number: Skipped empty line."
    continue
  fi
  
  # Check if line contains exactly one colon
  if [[ $(grep -o ":" <<< "$line" | wc -l) -ne 1 ]]; then
    echo "❌ Line $line_number: Invalid format (expected 'key:secret'). Skipping."
    continue
  fi
  
  key="${line%%:*}"
  secret="${line##*:}"
  
  # Basic validation for empty key or secret
  if [[ -z "$key" || -z "$secret" ]]; then
    echo "❌ Line $line_number: Key or secret is empty. Skipping."
    continue
  fi
  
  echo "🔍 Line $line_number: Checking Stripe secret API key..."
  
  # Call Stripe API to validate secret key
  response=$(curl -s -u "$secret:" https://api.stripe.com/v1/account)
  
  if echo "$response" | grep -q '"error"'; then
    echo "❌ Line $line_number: Invalid Stripe secret API key."
  else
    echo "✅ Line $line_number: Stripe secret API key is valid!"
  fi

done < "$filepath"

echo "🎉 Validation complete!"
