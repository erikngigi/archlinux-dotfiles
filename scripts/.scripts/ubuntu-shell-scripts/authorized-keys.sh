#!/bin/bash

# Get the username of the currently logged-in user
CURRENT_USER=$(whoami)

# Ensure the script is run as the intended user or with sufficient privileges
if [[ "$EUID" -ne 0 && "$CURRENT_USER" != "$USER" ]]; then
	echo "You must run this script as the target user or with sudo."
	exit 1
fi

echo "Setting up SSH authorized_keys for user: $CURRENT_USER"

# Define the SSH directory and authorized_keys file path
SSH_DIR="/home/$CURRENT_USER/.ssh"
AUTHORIZED_KEYS_FILE="$SSH_DIR/authorized_keys"

# Create the .ssh directory if it doesn't exist
if [[ ! -d "$SSH_DIR" ]]; then
	echo "Creating SSH directory: $SSH_DIR"
	mkdir -p "$SSH_DIR"
	chmod 700 "$SSH_DIR"
	chown "$CURRENT_USER:$CURRENT_USER" "$SSH_DIR"
fi

# Create the authorized_keys file if it doesn't exist
if [[ ! -f "$AUTHORIZED_KEYS_FILE" ]]; then
	echo "Creating authorized_keys file: $AUTHORIZED_KEYS_FILE"
	touch "$AUTHORIZED_KEYS_FILE"
	chmod 600 "$AUTHORIZED_KEYS_FILE"
	chown "$CURRENT_USER:$CURRENT_USER" "$AUTHORIZED_KEYS_FILE"
fi

echo "The following lines have been uncommented in $SSH_CONFIG:"
echo " - PubkeyAuthentication yes"
echo " - AuthorizedKeysFile .ssh/authorized_keys"
echo "A backup of the original file has been saved as $SSH_CONFIG.bak."

# Instructions for adding public keys
echo "The SSH directory and authorized_keys file have been set up for user $CURRENT_USER."
echo "You can add public keys to the authorized_keys file using:"
echo "    echo '<public_key>' >> $AUTHORIZED_KEYS_FILE"
echo "Replace <public_key> with the actual public key."

# Define the SSH config file path
SSH_CONFIG="/etc/ssh/sshd_config"

# Backup the original SSH config file
cp "$SSH_CONFIG" "$SSH_CONFIG.bak"

# Uncomment the PubkeyAuthentication line
sed -i '/^#PubkeyAuthentication yes/s/^#//' "$SSH_CONFIG"

# Uncomment the AuthorizedKeysFile line
sed -i '/^#AuthorizedKeysFile\s\+.ssh\/authorized_keys/s/^#//' "$SSH_CONFIG"

# Restart the SSH service to apply changes
systemctl restart sshd

echo "Setup complete."
