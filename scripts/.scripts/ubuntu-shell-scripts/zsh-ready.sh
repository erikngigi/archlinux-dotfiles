#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root. Use sudo to run it."
	exit 1
fi

# Update package lists and install necessary packages
echo "Installing stow, zsh, and curl..."
apt update -y && apt install -y stow zsh curl

# Install rustup using curl
echo "Installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Change the default shell to zsh for the current user
CURRENT_USER=$(whoami)
if chsh -s "$(which zsh)" "$CURRENT_USER"; then
	echo "Default shell changed to zsh for user $CURRENT_USER."
else
	echo "Failed to change the default shell to zsh."
fi

# Verify installations
echo "Verifying installations..."
echo "stow version:"
stow --version

echo "rustup version:"
rustup --version

echo "zsh version:"
zsh --version

echo "Installation of stow, rustup and zsh is complete!"
