#hmmmmmmm
#!/bin/bash

#Prompt user for the input file
read -p "Enter the path to your LinkedIn client IDs and secrets file: " INPUT_FILE

#Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

echo "Starting validation of LinkedIn client IDs and secrets in $INPUT_FILE..."

#Process each line in the file
while IFS= read -r LINE; do
    # Skip empty lines
    if [[ -z "$LINE" ]]; then
        continue
    fi

    # Split the line into client ID and secret
    CLIENT_ID=$(echo "$LINE" | cut -d: -f1)
    CLIENT_SECRET=$(echo "$LINE" | cut -d: -f2-)

    # Check if client ID and secret are in the correct format
    if [[ -z "$CLIENT_ID" || -z "$CLIENT_SECRET" ]]; then
        echo "❌ INVALID - $LINE (Invalid format)"
        continue
    fi

    # Make an API request to validate the client ID and secret
    RESPONSE=$(curl -s -X POST \
        -H "Content-type: application/x-www-form-urlencoded" \
        -d "grant_type=client_credentials&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET" \
        'https://www.linkedin.com/oauth/v2/accessToken')

    # Check if the client ID and secret are valid
    if echo "$RESPONSE" | grep -q "access_token"; then
        echo "✅ VALID - $LINE"
    else
        echo "❌ INVALID - $LINE"
        echo "$RESPONSE"
    fi
done < "$INPUT_FILE"

echo "Validation complete!"
