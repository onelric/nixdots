#!/bin/sh

INTERFACE="wlp0s20f3"

STATE=$(nmcli -t -f DEVICE,STATE device status | awk -F: -v i="$INTERFACE" '$1==i {print $2}')

CONNECTED_ICON="󰤨"
DISCONNECTED_ICON="󰤭"

if [ "$1" = "--ssid" ]; then
    nmcli -t -f DEVICE,CONNECTION device status | awk -F: -v i="$INTERFACE" '$1==i {print $2}'
    exit
fi

if [ "$STATE" = "connected" ]; then
    echo "$CONNECTED_ICON"
else
    echo "$DISCONNECTED_ICON"
fi
