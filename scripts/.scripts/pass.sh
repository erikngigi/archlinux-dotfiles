#!/usr/bin/env bash

# Prompt for details
read -p "Enter Category (personal or work): " category
read -p "Enter Email: " email
read -p "Enter Service Name: " service
read -p "Enter Use Case: " use_case
read -p "Enter Password: " password

# Ensure all required fields are entered
if [[ -z "$category" || -z "$email" || -z "$service" || -z "$use_case" || -z "$password" ]]; then
  echo "Error: All fields except 'Notes' are required."
  exit 1
fi

# Create the strucuture output
output="$password
Email: $email
Use Case: $use_case"

# Save to pass
pass insert -m "$category/$email/$service" <<< "$output"
