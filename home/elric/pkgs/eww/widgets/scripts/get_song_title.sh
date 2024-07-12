#!/bin/sh
zscroll -l 16 --delay 0.3 --match-command 'playerctl --player=spotify status' --match-text "Playing" "--scroll 1" --match-text "Paused" "--scroll 0" --update-check true 'playerctl --player=spotify metadata --format "{{ title }}"'

