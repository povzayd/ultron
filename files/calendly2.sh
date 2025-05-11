#!/bin/bash

#Prompt user for the input file
read -e -p "Enter the path to your Calendly personal access tokens file: " INPUT_FILE

#Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

echo "Starting validation of Calendly personal access tokens in $INPUT_FILE..."

#Process each line in the file
while IFS= read -r TOKEN; do
    # Skip empty lines
    if [[ -z "$TOKEN" ]]; then
        continue
    fi

    # Trim any whitespace
    TOKEN=$(echo "$TOKEN" | xargs)

    # Make an API request to validate the token
    RESPONSE=$(curl -s -X GET \
        -H "Authorization: Bearer $TOKEN" \
        'https://api.calendly.com/users/me')

    # Check if the token is valid
    if echo "$RESPONSE" | grep -q "resource"; then
        echo "✅ VALID - $TOKEN"
    else
        if echo "$RESPONSE" | grep -q "Invalid"; then
            echo "❌ INVALID - $TOKEN (Invalid token)"
        else
            echo "❌ INVALID - $TOKEN (Unknown error)"
        fi
    fi
done < "$INPUT_FILE"

echo "Validation complete!"

