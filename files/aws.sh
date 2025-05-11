#!/bin/bash

# Script to check AWS credentials validity using sts get-caller-identity

echo "====================================="
echo "AWS Credentials Validator"
echo "====================================="
echo "This script will check the validity of AWS credentials."
echo

# Prompt user for the input file
read -e -p "Enter the path to your AWS credentials file (format: AWS_ACCESS_KEY_ID:AWS_SECRET_ACCESS_KEY per line): " INPUT_FILE

# Check if file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File not found: $INPUT_FILE"
  exit 1
fi

echo
echo "Starting validation of AWS credentials in $INPUT_FILE..."
echo "-----------------------------------"

# Process each line in the file
while IFS=: read -r ACCESS_KEY SECRET_KEY || [ -n "$ACCESS_KEY" ]; do
  # Skip empty lines or lines without both key and secret
  if [[ -z "$ACCESS_KEY" || -z "$SECRET_KEY" ]]; then
    continue
  fi

  # Trim any whitespace
  ACCESS_KEY=$(echo "$ACCESS_KEY" | xargs)
  SECRET_KEY=$(echo "$SECRET_KEY" | xargs)

  echo -n "Checking credentials for $ACCESS_KEY: "

  # Temporarily set AWS credentials as environment variables
  export AWS_ACCESS_KEY_ID="$ACCESS_KEY"
  export AWS_SECRET_ACCESS_KEY="$SECRET_KEY"
  
  # Make the API call to validate credentials
  RESULT=$(aws sts get-caller-identity 2>&1)
  EXIT_CODE=$?
  
  if [ $EXIT_CODE -eq 0 ]; then
    # Extract account and user information
    ACCOUNT=$(echo "$RESULT" | grep "Account" | cut -d'"' -f4)
    ARN=$(echo "$RESULT" | grep "Arn" | cut -d'"' -f4)
    echo "✅ VALID"
    echo "   Account: $ACCOUNT"
    echo "   Identity: $ARN"
  else
    ERROR_MSG=$(echo "$RESULT" | head -1)
    echo "❌ INVALID"
    echo "   Error: $ERROR_MSG"
  fi
  
  # Unset the environment variables
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  
  echo "-----------------------------------"
done < "$INPUT_FILE"

echo "Validation complete!"
