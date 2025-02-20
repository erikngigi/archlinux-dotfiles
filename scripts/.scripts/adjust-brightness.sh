#!/usr/bin/env bash

set -e

# Check if ddcutil is installed
if ! command -v ddcutil &>/dev/null; then
	echo "ddcutil is not installed. Please install it first."
	exit 1
fi

# Function to set brightness
set_brightness() {
	local screen=$1
	local value=$2
	ddcutil setvcp 10 "$value" --display "$screen"
}

# Function to get current brightness
get_brightness() {
	local screen=$1
	ddcutil getvcp 10 --display "$screen" | grep -Po 'current value\s*=\s*\K\d+'
}

# Function to get screen model using ddcutil
get_screen_models() {
	ddcutil detect | awk -F': ' '/Model:/ {gsub(/^ +| +$/, "", $2); print $2}'
}

# Read screen models into an array
mapfile -t screen_models < <(get_screen_models)

# Default to "Unknown Model" if no model is found
model1="${screen_models[0]:-Unknown Model}"
model2="${screen_models[1]:-Unknown Model}"

# Prompt user for screen selection
echo "Which screen would you like to adjust?"
echo "1. Screen 1 ($model1) Current Brightness:$(get_brightness 1)"
echo "2. Screen 2 ($model2) Current Brightness:$(get_brightness 2)"
echo "3. Both Screens"
echo "0. Exit"
read -p "Enter your choice (0, 1, 2, or 3): " screen_choice

# Validate screen choice
if [[ "$screen_choice" == "0" ]]; then
	exit 0
elif [[ "$screen_choice" != "1" && "$screen_choice" != "2" && "$screen_choice" != "3" && "$screen_choice" != "0" ]]; then
	echo "Invalid choice. Please run the script again and select 1, 2, or 3."
	exit 1
fi

# Prompt user for brightness value
read -p "Enter the brightness value (0-100): " brightness_value

# Validate brightness value
if [[ "$brightness_value" -lt 0 || "$brightness_value" -gt 100 ]]; then
	echo "Invalid brightness value. Please enter a value between 0 and 100."
	exit 1
fi

# Set brightness based on the user choice
case "$screen_choice" in
1)
	set_brightness 1 "$brightness_value"
	echo "Screen 1 brightness is now $(get_brightness 1)"
	;;
2)
	set_brightness 2 "$brightness_value"
	echo "Screen 2 brightness is now $(get_brightness 2)"
	;;
3)
	set_brightness 1 "$brightness_value"
	set_brightness 2 "$brightness_value"
	echo "Screen 1 brightness is now $(get_brightness 1)"
	echo "Screen 2 brightness is now $(get_brightness 2)"
	;;
esac

echo "Brightness adjusted successfully."
