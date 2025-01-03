#!/usr/bin/env bash

# Iterate through all connected and disconnected outputs
for output in $(xrandr --listmonitors | tail -n +2 | awk '{print $4}'); do
    status=$(xrandr --query | grep -w "$output" | grep "disconnected")
    if [ -n "$status" ]; then
        # Disable disconnected displays
        xrandr --output "$output" --off
    fi
done

# Set up connected displays
xrandr --output DP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
xrandr --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal
