#bash
#!/bin/bash

#Prompt user for the input file
read -e -p "Enter the path to your Shodan API keys file: " INPUT_FILE

#Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

echo "Starting validation of Shodan API keys in $INPUT_FILE..."

#Process each line in the file
while IFS= read -r API_KEY; do
    # Skip empty lines
    if [[ -z "$API_KEY" ]]; then
        continue
    fi

    # Trim any whitespace
    API_KEY=$(echo "$API_KEY" | xargs)

    echo -n "Checking API key: $API_KEY... "

    # Make the API call to validate the key
    RESPONSE=$(curl -s -X GET "https://api.shodan.io/account/profile?key=$API_KEY")

    # Check if the API key is valid
    if echo "$RESPONSE" | grep -q "credits"; then
        echo "✅ VALID"
    else
        echo "❌ INVALID"
    fi
done < "$INPUT_FILE"

echo "Validation complete!"
