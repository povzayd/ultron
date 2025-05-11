#bash
#!/bin/bash

#Prompt the user for the file containing API keys
read -e -p "Enter the path to the file containing API keys: " file

#Check if the file exists
if [[ ! -f "$file" ]]; then
    echo "File not found!"
    exit 1
fi

#Read and process each API key in the file
while IFS= read -r key || [[ -n "$key" ]]; do
    # Trim whitespace
    key=$(echo "$key" | xargs)
    if [[ -z "$key" ]]; then
        continue
    fi

    # Call the WakaTime API
    response=$(curl -s -o /dev/null -w "%{http_code}" "https://wakatime.com/api/v1/users/current?api_key=$key")

    # Check HTTP response code
    if [[ "$response" -eq 200 ]]; then
        echo "API key '$key' is VALID.💯"
    else
        echo "API key '$key' is INVALID 🚫 (HTTP $response)."
    fi
done < "$file"
