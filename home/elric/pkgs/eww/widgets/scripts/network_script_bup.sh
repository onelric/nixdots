#!/bin/sh
INTERFACE="wlp0s20f3"

status_output="$(wpa_cli -i "$INTERFACE" status 2>/dev/null)"

ssid="$(echo "$status_output" | grep '^ssid=' | cut -d'=' -f2)"
state="$(echo "$status_output" | grep '^wpa_state=' | cut -d'=' -f2)"

if [[ $1 == "--ssid" ]] then
    echo "$ssid"
    exit 0
fi

if [ "$state" = "COMPLETED" ]; then
    if [ -n "$ssid" ]; then
        echo "󰤨"
        exit 0
    fi
else
    echo "󰤭"
    exit 0
fi
