#!/bin/bash
read -ep "Enter input filename: " INPUT_FILE
if [ ! -f "$INPUT_FILE" ]; then
    echo "File not found: $INPUT_FILE"
    exit 1
fi
echo ""
echo "Testing SMTP credentials from $INPUT_FILE..."
echo ""
while IFS= read -r line || [ -n "$line" ]; do
#Skip empty or commented lines
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    IFS=':' read -r HOST PORT USERNAME PASSWORD ENCRYPTION FROM <<< "$line"
    echo -n "$USERNAME@$HOST:$PORT → "
    swaks --to test@example.com \
          --from "$FROM" \
          --server "$HOST" \
          --port "$PORT" \
          --auth LOGIN \
          --auth-user "$USERNAME" \
          --auth-password "$PASSWORD" \
          --$ENCRYPTION \
          --timeout 10 \
          --quit-after RCPT >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ WORKING"
    else
        echo "❌ FAILED"
    fi
done < "$INPUT_FILE"
