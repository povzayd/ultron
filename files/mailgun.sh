#!/bin/bash

# Function to check the validity of a Mailgun API key
check_api_key() {
    local api_key=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" --user "api:$api_key" "https://api.mailgun.net/v3/domains")
    
    if [ "$response" -eq 200 ]; then
        echo "✅ Valid Mailgun API Key: $api_key"
    else
        echo "❌ Invalid Mailgun API Key: $api_key"
    fi
}

# Prompt the user for the text file containing Mailgun API keys
echo "Enter the path to the file containing Mailgun API keys:"
read -e file_path

# Check if file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Read the file line by line and check each API key
while IFS= read -r api_key; do
    check_api_key "$api_key"
done < "$file_path"
