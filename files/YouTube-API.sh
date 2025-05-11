
#!/bin/bash

#Function to check the validity of a YouTube API key
check_api_key() {
    local api_key=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" -iLk "https://www.googleapis.com/youtube/v3/activities?part=contentDetails&maxResults=1&channelId=UC-lHJZR3Gqxm24_Vd_AJ5Yw&key=$api_key")
    if [ "$response" -eq 200 ]; then
        echo "✅ Valid YouTube API Key: $api_key"
    else
        echo "❌ Invalid YouTube API Key: $api_key"
    fi
}

#Prompt the user for the text file containing YouTube API keys
echo "Enter the path to the file containing YouTube API keys (one per line):"
read -e file_path

#Check if file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found!"
    exit 1
fi

#Read the file line by line and check each API key
while IFS= read -r api_key; do
    check_api_key "$api_key"
done < "$file_path"
