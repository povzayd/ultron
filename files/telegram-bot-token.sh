#Telegram bot Token
#!/bin/bash

#Prompt user for the file containing Telegram bot tokens
read -e -p "Enter the path to the file containing Telegram bot tokens: " file

#Check if the file exists
if [[ ! -f "$file" ]]; then
    echo "File not found!"
    exit 1
fi

#Read and validate each token
while IFS= read -r token || [[ -n "$token" ]]; do
    token=$(echo "$token" | xargs) # Trim whitespace
    if [[ -z "$token" ]]; then
        continue
    fi

    # Make API call
    response=$(curl -s "https://api.telegram.org/bot${token}/getMe")

    # Check if the response contains "ok":true
    if echo "$response" | grep -q '"ok":true'; then
        echo "Token '$token' is 😁VALID."
    else
        echo "Token '$token' is 😒INVALID or malformed."
    fi
done < "$file"
#
#
#
