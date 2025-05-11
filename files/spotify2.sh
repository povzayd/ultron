#!/bin/bash

#Prompt user for the input file
read -e -p "Enter the path to your Spotify access keys file: " INPUT_FILE

#check if file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

echo "Starting validation of Spotify access keys in $INPUT_FILE..."

#Process each line in the file
while IFS= read -r ACCESS_TOKEN; do
    # Skip empty lines
    if [[ -z "$ACCESS_TOKEN" ]]; then
        continue
    fi

    # Trim any whitespace
    ACCESS_TOKEN=$(echo "$ACCESS_TOKEN" | xargs)

    echo -n "Checking access token: $ACCESS_TOKEN... "

    # Make the API call to validate the token
    RESPONSE=$(curl -s -X GET "https://api.spotify.com/v1/artists/0oSGxfWSnnOXhD2fKuz2Gy" -H "Authorization: Bearer $ACCESS_TOKEN")

    # Check if the access token is valid
    if echo "$RESPONSE" | grep -q "David Bowie"; then
        echo "✅ VALID"
    else
        ERROR_MSG=$(echo "$RESPONSE" | jq -r '.error.message')
        echo "❌ INVALID - $ERROR_MSG"
    fi
done < "$INPUT_FILE"

echo "Validation complete!"

