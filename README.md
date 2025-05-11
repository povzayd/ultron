🤖 Ultron

Ultron is a powerful command-line tool for validating API keys and tokens across various services like Slack, GitLab, AWS, GitHub, Stripe, and more. Just feed it a plain text file with your keys, and let Ultron handle the rest.


---

✨ Features

🔌 Multi-Service Support – Validate keys from platforms like Slack, GitHub, AWS, and others.

⚙️ Automated Validation – Quickly check the status of each API key.

📄 Plain Text Input – Use simple .txt files to input your keys.

✅ Clear Feedback – Get real-time results on which keys are valid or invalid.



---

🛠 Installation
```
git clone https://github.com/povzayd/ultron.git
cd ultron
```
Make sure the script is executable:
```
chmod +x ultron files/*
```
Alternatively You can download it from the [Releases](https://github.com/povzayd/ultron/releases) option also. Once you download it just unzip it & then run:
```
dpkg -i ultron.deb
```
---

To access `ultron` universally 
Run the following command after cloning the repo [If you are installing from the releases you don't need to do that.]

```
mv ultron /usr/bin/
mv -r files /usr/bin/
```
🚀 Usage

1. ✍️ Create a plain text file (e.g., keys.txt) with your API keys:
```
api_key_1
api_key_2
api_key_3
```

2. ▶️ Run Ultron:
```
ultron
```
3. Select The Service
4. Enter the file name
  `api.txt` 
5. 📊 View results to see which keys are valid.




---

🌐 Supported Services

🧵 Slack

🧪 GitLab

☁️ AWS

🐙 GitHub

💳 Stripe

➕ ...and more coming soon!

```
Ultron API Key Validator Help
```

About the Input File Format
To validate your API keys using Ultron, prepare a plain text file containing your keys.

General Guidelines
- Each API key should be on its own line.
- All paired keys follow the format key:secret.
- Avoid extra spaces before or after the key.
- Do not include comments or other text in the file.
- The file should contain only keys relevant to the chosen service.

Examples of Valid API Keys by Service
API keys/ID:Secret of each service should have individual files.

1. Slack Webhook Checker
- Slack webhook URLs look like: `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX`
- Example file content: `https://hooks.slack.com/services/T12345678/B87654321/abcd1234efgh5678ijkl9012`

2. GitLab Personal Access Tokens
- Typically a long alphanumeric string, e.g., `glpat-abcdefghijklmnopqrstuvwxyz123456`
- Example file content: `glpat-1a2b3c4d5e6f7g8h9i0jklmnopqrstuv`

3. Mailgun API Keys
- Usually start with 'key-', e.g., `key-3ax6xnjp29jd6fds4gc373sgvjxteol0`

4. Telegram Bot Tokens
- Format: <bot_id>:<bot_token>, e.g., `123456789:ABCdefGhIJKlmNoPQRsTUVwxyZ1234567890`

5. YouTube API Keys
- Typically a 39-character string: `AIzaSyA-abcdefghijklmnopqrstuvwxyz1234567890`

6. RazorPay API Keys
- Key ID and secret usually in pairs or separate lines, e.g., `key_id:rzp_test_1DP5mmOlF5G5ag key_secret:your_secret_key_here`

7. Twilio Account SID & Auth Token
- Account SID starts with 'AC' followed by 32 hex chars: `ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`
- Auth Token is a 32-character hex string: ACCOUNT_SID:AUTH_TOKEN per line

8. AWS Access Key ID & Secret Access Key
- Access Key ID format (20 chars): `AKIAIOSFODNN7EXAMPLE`
- Secret Access Key (40 chars): `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`
- `ACCESS-KEY-ID:SECRET-ACCESS-KEY [EACH PER LINE]`

9. Heroku API Keys
- A 32-character hex string, e.g., `HRKU-1e79da9e-8b35-48b9-b21d-727373738`

10. Shodan API Keys
- 32-character hex string, e.g., `1234567890abcdef1234567890abcdef`

11. WakaTime API Keys
- UUID format, e.g., `12345678-1234-1234-1234-1234567890ab`

12. Calendly API Keys
- Bearer tokens, e.g., `eyJraWQiOiIxY2UxZTEzNjE3ZGNmNzY2YjNjZWJjY2Y4ZGM1YmFmYThhNjVlNjg0MDIzZjdjMzJiZTgzNDliMjM4MDEzNWI0IiwidHlwIjoiUEFUIiwiYWxnIjoiRVMyNTYifQ...`

13. IPStack API Keys
- Numeric or alphanumeric keys, e.g., `1234567890abcdef`

14. SonarCloud Tokens
- Typically a long alphanumeric string, e.g., `1234567890abcdef1234567890abcdef12345678`

15. GitHub Personal Access Tokens
- Format starts with 'ghp_' or 'gho_' followed by 36 alphanumeric chars, e.g., `ghp_16characterstokenhere1234567890abcd`

16. Stripe API Keys
- Secret keys start with 'sk_live_' or 'sk_test_', e.g., `sk_test_randomkeyyjWDarjtT1zdp7dc`

17. Spotify API Tokens
- Bearer tokens, typically long base64-like strings, e.g., `BQDfZ4f9qz3pT9Lq1xYvN8V...`

18. Discord Webhook URLs
- URLs like: `https://discord.com/api/webhooks/123456789012345678/abcdefghijklmnopqrstuvwxyzABCDEFGHI`

---

🤝 Contributing

We welcome contributions!

1. 🍴 Fork the repo


2. 🌿 Create a new branch


3. ✨ Add your feature or fix


4. 🧪 Test your changes


5. 📬 Submit a pull request



Got an idea? Open an issue to discuss it!



Would you like me to generate a badge section (e.g., stars, license, etc.) as well?
