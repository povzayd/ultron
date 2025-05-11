#!/bin/bash

# Check for jq dependency
if ! command -v jq >/dev/null 2>&1; then
    echo "Error: 'jq' is required but not installed. Please install jq and try again."
    exit 1
fi

# Prompt user for the credentials file
read -e -rp "Enter the path to the file containing Twilio credentials (ACCOUNT_SID:AUTH_TOKEN per line): " file_path
file_path=$(echo "$file_path" | xargs)  # Trim whitespace

if [ ! -f "$file_path" ]; then
    echo "Error: File not found!"
    exit 1
fi

while IFS= read -r credentials || [ -n "$credentials" ]; do
    # Skip empty lines or lines without a colon
    if [[ -z "$credentials" || "$credentials" != *:* ]]; then
        continue
    fi

    account_sid=$(echo "$credentials" | cut -d ':' -f1 | xargs)
    auth_token=$(echo "$credentials" | cut -d ':' -f2- | xargs)

    # Validate format
    if [[ ! "$account_sid" =~ ^AC[a-zA-Z0-9]{32}$ || -z "$auth_token" ]]; then
        echo "❌ Skipping invalid line: $credentials"
        continue
    fi

    # Call Twilio API
    response=$(curl -s -u "$account_sid:$auth_token" \
        "https://api.twilio.com/2010-04-01/Accounts/$account_sid.json")

    error_message=$(echo "$response" | jq -r '.message // empty')
    returned_sid=$(echo "$response" | jq -r '.sid // empty')

    if [[ -n "$error_message" || -z "$returned_sid" ]]; then
        echo "❌ Invalid Twilio Credentials: $account_sid:$auth_token"
    else
        echo "✅ Valid Twilio Credentials: $account_sid:$auth_token"
    fi
done < "$file_path"
