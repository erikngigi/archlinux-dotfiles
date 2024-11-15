#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root. Use sudo to run it."
	exit 1
fi

echo "Starting system update and upgrade..."

# Update package lists and upgrade installed packages
apt update -y && apt upgrade -y

echo "Installing necessary packages..."

# List of packages to install
PACKAGES=(
	curl
	wget
	git
	vim
	htop
	unzip
	build-essential
	software-properties-common
	net-tools
	ufw
	python3-pip
)

# Install packages
apt install -y "${PACKAGES[@]}"

# Clean up unnecessary files
echo "Cleaning up..."
apt autoremove -y
apt clean

# Check for any issues with installed packages
dpkg --configure -a

echo "Setup completed. The system is updated and packages are installed."

echo "Creating a new user..."

# Prompt for the new user's name
read -p "Enter the new username: " NEW_USER

# Create the new user
adduser "$NEW_USER"

# Add the new user to the sudo group
usermod -aG sudo "$NEW_USER"

echo "Adding user to the sudoers file..."

# Backup the sudoers file
cp /etc/sudoers /etc/sudoers.bak

# Add the new user to the sudoers file for full administrative privileges
if ! grep -q "^$NEW_USER" /etc/sudoers; then
	echo "$NEW_USER ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
	echo "User $NEW_USER has been added to the sudoers file with NOPASSWD privileges."
else
	echo "User $NEW_USER is already in the sudoers file."
fi

echo "New user setup is complete. You can now switch to the new user using: su - $NEW_USER"
