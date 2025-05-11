#bash
#!/bin/bash

#Function to check the validity of a Slack Webhook URL
check_api_key() {
    local webhook_url=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-type: application/json" -d '{"text":"Hello! This Is A Test Message"}' "$webhook_url")
    if [ "$response" -eq 200 ]; then
        echo "✅ Valid Slack Webhook URL: $webhook_url"
    else
        echo "❌ Invalid Slack Webhook URL: $webhook_url"
    fi
}

#Prompt the user for the text file containing Slack Webhook URLs
echo "Enter the path to the file containing Slack Webhook URLs (one per line):"
read -e file_path

#Check if file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found!"
    exit 1
fi

#Read the file line by line and check each webhook URL
while IFS= read -r webhook_url; do
    check_api_key "$webhook_url"
done < "$file_path"

