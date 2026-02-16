#!/bin/sh

INTERFACE="wlan0"

iwctl station "$INTERFACE" show 2>/dev/null | awk -v mode="$1" '
/State/ { state=$2 }
/Connected network/ { ssid=$3 }
/RSSI/ { rssi=$2 }

END {
    if (mode == "--ssid") {
        if (state == "connected")
            print ssid
        exit
    }

    if (state != "connected") {
        print "󰤭"
        exit
    }

    if (rssi >= -50)
        print "󰤨"
    else if (rssi >= -60)
        print "󰤥"
    else if (rssi >= -70)
        print "󰤢"
    else
        print "󰤟"
}'

