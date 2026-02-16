#!/bin/sh

vol=$(pamixer --get-volume)
if pamixer --get-mute | grep -q true; then
    echo '󰝟'
elif [ $vol -eq 0 ]; then
    echo '󰕿' 
elif [ $vol -lt 50 ]; then
    echo '󰖀'
else
    echo '󰕾'
fi
