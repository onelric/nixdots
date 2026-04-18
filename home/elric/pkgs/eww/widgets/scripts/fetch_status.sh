#!/bin/sh
grep -q Charging /sys/class/power_supply/BAT0/status && echo "󰂄" || echo " "
