#
#
#
#
#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No color

clear
echo -e "${GREEN}==============================================${NC}"
echo -e "${GREEN}           Ultron API Key Validator Help           ${NC}"
echo -e "${GREEN}==============================================${NC}"
echo -e ""
echo -e "${GREEN}About the Input File Format:${NC}"
echo -e "To validate your API keys using Ultron, prepare a plain text file containing your keys."
echo -e ""
echo -e "${GREEN}General Guidelines:${NC}"
echo -e "  - Each API key should be on its own line."
echo -e "  - All Paired Keys Follow Same Format key:secret"
echo -e "  - Avoid extra spaces before or after the key."
echo -e "  - Do not include comments or other text in the file."
echo -e "  - The file should contain only keys relevant to the chosen service."
echo -e ""
echo -e "${GREEN}Examples of Valid API Keys by Service:${NC}"
echo -e ""
echo -e "API Keys/ID:Secret of each Service Should Have Individual Files."
echo -e "I KNOW ITS DUMB TO MENTION THIS BUT PEOPLE ASKED ABOUT IT"
echo -e "${YELLOW}1) Slack Webhook Checker:${NC}"
echo -e "  Slack webhook URLs look like:"
echo -e "    https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
echo -e "  Example file content:"
echo -e "    https://hooks.slack.com/services/T12345678/B87654321/abcd1234efgh5678ijkl9012"
echo -e ""

echo -e "${YELLOW}2) GitLab Personal Access Tokens:${NC}"
echo -e "  Typically a long alphanumeric string, e.g.:"
echo -e "    glpat-abcdefghijklmnopqrstuvwxyz123456"
echo -e "  Example file content:"
echo -e "    glpat-1a2b3c4d5e6f7g8h9i0jklmnopqrstuv"
echo -e ""

echo -e "${YELLOW}3) Mailgun API Keys:${NC}"
echo -e "  Usually start with 'key-', e.g.:"
echo -e "    key-3ax6xnjp29jd6fds4gc373sgvjxteol0"
echo -e ""

echo -e "${YELLOW}4) Telegram Bot Tokens:${NC}"
echo -e "  Format: <bot_id>:<bot_token>, e.g.:"
echo -e "    123456789:ABCdefGhIJKlmNoPQRsTUVwxyZ1234567890"
echo -e ""

echo -e "${YELLOW}5) YouTube API Keys:${NC}"
echo -e "  Typically a 39-character string:"
echo -e "    AIzaSyA-abcdefghijklmnopqrstuvwxyz1234567890"
echo -e ""
#
#echo -e "${YELLOW}6) Grafana API Tokens:${NC}"
#echo -e "  Usually a long alphanumeric string, e.g.:"
#echo -e "    eyJrIjoiY2YyZDYxYmUtZDE2YS00ZjQ5LTk5M2MtZDIzZjI3YjA3Y2Q5IiwiaWQiOjEsImlkIjoxfQ=="
#echo -e ""

echo -e "${YELLOW}7) RazorPay API Keys:${NC}"
echo -e "  Key ID and Secret usually in pairs or separate lines, e.g.:"
echo -e "    key_id:rzp_test_1DP5mmOlF5G5ag"
echo -e "    key_secret:your_secret_key_here"
echo -e ""

echo -e "${YELLOW}8) Twilio Account SID & Auth Token:${NC}"
echo -e "  Account SID starts with 'AC' followed by 32 hex chars:"
echo -e "    ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
echo -e "  Auth Token is a 32-character hex string:"
echo -e "    ACCOUNT_SID:AUTH_TOKEN per line"
echo -e ""

echo -e "${YELLOW}9) AWS Access Key ID & Secret Access Key:${NC}"
echo -e "  Access Key ID format (20 chars):"
echo -e "    AKIAIOSFODNN7EXAMPLE"
echo -e "  Secret Access Key (40 chars):"
echo -e "    wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
echo -e "  ACCESS-KEY-ID:SECRET-ACCESS-KEY [EACH PER LINE]"
echo -e ""

echo -e "${YELLOW}10) Heroku API Keys:${NC}"
echo -e "  A 32-character hex string, e.g.:"
echo -e "    HRKU-1e79da9e-8b35-48b9-b21d-727373738"
echo -e "PLEASE NOTE THAT THE HEROKU CHECKER ON 10th NUMBER IS" 
echo -e "SLOWER THEN THE ONE ON 19th NUMBER. THE 19th ONE HAS"
echo -e "BEEN TESTED FOR UPTO AN ACCURACY OF 1 PER 11665"
echo -e "[It Means I Had 1 valid key placed at end of 11664 keys I didn't get any rate limit though some sources claim that Heroku allows only 4500 requests per Hour.The approx time taken was around 13 minutes.]" 
echo -e ""

echo -e "${YELLOW}11) Shodan API Keys:${NC}"
echo -e "  32-character hex string, e.g.:"
echo -e "    1234567890abcdef1234567890abcdef"
echo -e ""

echo -e "${YELLOW}12) WakaTime API Keys:${NC}"
echo -e "  UUID format, e.g.:"
echo -e "    12345678-1234-1234-1234-1234567890ab"
echo -e ""

echo -e "${YELLOW}13) Calendly API Keys:${NC}"
echo -e "  Bearer tokens, e.g.:"
echo -e "eyJraWQiOiIxY2UxZTEzNjE3ZGNmNzY2YjNjZWJjY2Y4ZGM1YmFmYThhNjVlNjg0MDIzZjdjMzJiZTgzNDliMjM4MDEzNWI0IiwidHlwIjoiUEFUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJodHRwczovL2F1dGguY2FsZW5kbHkuY29tIiwiaWF0IjoxNzQ2NjIxNjgwLCJqdGkiOiI0ZGExYjlkOC0zOWNlLTRmZGQtYTA4ZC01NjQ2OGY1Mzc3Y2IiLCJ1c2VyX3V1aWQiOiJjMjI5Yzg3YS02ODMwLTQxNDEtOGEwYS01MDM0ZjU2ZjM3ZDQifQ.rVrqOE0xWv2tmYoM0JN53jbFCIbtapitokenexampleinvalidshitTVVdfbRAyZsYxGqrg"

echo -e ""

echo -e "${YELLOW}14) IPStack API Keys:${NC}"
echo -e "  Numeric or alphanumeric keys, e.g.:"
echo -e "    1234567890abcdef"
echo -e ""

echo -e "${YELLOW}15) SonarCloud Tokens:${NC}"
echo -e "  Typically a long alphanumeric string, e.g.:"
echo -e "    1234567890abcdef1234567890abcdef12345678"
echo -e ""

echo -e "${YELLOW}16) GitHub Personal Access Tokens:${NC}"
echo -e "  Format starts with 'ghp_' or 'gho_' followed by 36 alphanumeric chars, e.g.:"
echo -e "    ghp_16characterstokenhere1234567890abcd"
echo -e ""

echo -e "${YELLOW}17) Stripe API Keys:${NC}"
echo -e "  Secret keys start with 'sk_live_' or 'sk_test_', e.g.:"
echo -e "    sk_test_4eC39HqLyjWDarjtT1zdp7dc"
echo -e ""

echo -e "${YELLOW}18) Spotify API Tokens:${NC}"
echo -e "  Bearer tokens, typically long base64-like strings, e.g.:"
echo -e "    BQDfZ4f9qz3pT9Lq1xYvN8V..."
echo -e ""

echo -e "${YELLOW}19) Discord Webhook URLs:${NC}"
echo -e "  URLs like:"
echo -e "    https://discord.com/api/webhooks/123456789012345678/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
echo -e ""
echo -e "${YELLOW}21) SMTP Validator:${NC}"
echo -e "  smtp.example.com:465:user@example.com:pass:ssl:user@example.com, e.g.:"
echo -e "    smtp.mailgun.org:587:no-reply@randomportal.com:d1a558b9604010bab610616cea908eefc-b20e3d79:tls:no-reply@randomportal.com"
echo -e ""
echo -e "${YELLOW}22) OpenAI API Keys:${NC}"
echo -e "1 API Key Per Line, e.g.:"
echo -e "   sk-proj--examplekey123testtrynott0val1dat3th157h157h19gissorandomthatidontevenknowwhtyiwroteitasanexampleNearlyallopenaiapikeysare150characterslonganditcontainsAZazand0to9onlynospecialcharacterslolyoucangonow0"
echo -e ""

echo -e "${GREEN}How to Use:${NC}"
echo -e "  1) Select the service from the menu."
echo -e "  2) When prompted, provide the path to your file containing the keys."
echo -e "  3) The tool will validate each key and display the results."
echo -e ""
echo -e "${GREEN}Additional Tips:${NC}"
echo -e "  - Keep your API keys secure and avoid sharing them publicly."
echo -e "  - Regularly rotate your keys to maintain security."
echo -e "  - If you encounter errors, verify the key format and ensure the keys are active."
echo -e ""
echo -e "${GREEN}Thank you for using Ultron!${NC}"
echo -e "For more information, visit: ${RED}https://github.com/povzayd${NC}"
echo -e ""
read -ep "Press Enter to return to the main menu..."
#./mastercaller.sh
#./mastercaller.sh
#calling ultron
#updated help.sh rn 9:01 IST 
./ultron
