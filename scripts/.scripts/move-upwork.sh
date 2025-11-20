#!/bin/bash

# Define the desired positions for each window
TIME_TRACKER_POSITION="80 100"
CONTROL_PANEL_POSITION="440 100"
MESSAGE_PANEL="560 100"
SETTINGS_PANEL="560 100"
ABOUT_PANEL="600 100"

# Function to move a window by name
move_window() {
    local window_name=$1
    local position=$2

    # Search for the window using its name
    WINDOW_ID=$(xdotool search --name "$window_name" | head -n 1)
    if [ -n "$WINDOW_ID" ]; then
        # Move the window to the specified position
        xdotool windowmove "$WINDOW_ID" $position
        echo "Moved '$window_name' to $position"
    else
        echo "Window '$window_name' not found."
    fi
}

# Wait for the applications to launch
sleep 2

# Move both windows
move_window "Time Tracker" "$TIME_TRACKER_POSITION"
move_window "Control Panel" "$CONTROL_PANEL_POSITION"
move_window "Messages" "$MESSAGE_PANEL"
move_window "Settings" "$SETTINGS_PANEL"
move_window "About" "$ABOUT_PANEL"
move_window "Upwork" "$ABOUT_PANEL"
