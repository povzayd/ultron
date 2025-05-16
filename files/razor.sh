#!/bin/bash

# Script to check Razorpay API key and secret validity

echo "====================================="
echo "Razorpay API Key Validator"
echo "====================================="
echo "This script will check the validity of Razorpay API keys and secrets."
echo

# Prompt user for the input file
read -e -p "Enter the path to your credentials file (format: key:secret per line): " INPUT_FILE

# Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File not found: $INPUT_FILE"
  exit 1
fi

echo
echo "Starting validation of credentials in $INPUT_FILE..."
echo "-----------------------------------"

# Process each line in the file
while IFS=: read -r CLIENT_KEY CLIENT_SECRET || [ -n "$CLIENT_KEY" ]; do
  # Skip empty lines or lines without both key and secret
  if [[ -z "$CLIENT_KEY" || -z "$CLIENT_SECRET" ]]; then
    continue
  fi
#Trim any whitespace
  CLIENT_KEY=$(echo "$CLIENT_KEY" | xargs)
  CLIENT_SECRET=$(echo "$CLIENT_SECRET" | xargs)

  echo -n "Checking $CLIENT_KEY: "

#he API call
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -u "$CLIENT_KEY:$CLIENT_SECRET" https://api.razorpay.com/v1/payments)

  if [ "$RESPONSE" -eq 200 ]; then
    echo "✅ VALID"
  else
    echo "❌ INVALID (HTTP $RESPONSE)"
  fi
done < "$INPUT_FILE"

echo "-----------------------------------"
echo "Validation complete!"
##########fingers crossed hope this works #########
