#!/bin/sh
# available_mb="$(eww get EWW_CPU | jq -r '.available_mem')"
# available_gb=$((available_mb/1000))
# printf "%.0f" ${available_gb}
#
available_mb="$(eww get EWW_RAM | jq -r '.available_mem')"
total_mb="$(eww get EWW_RAM | jq -r '.total_mem')"

used_mb=$((total_mb - available_mb))

used_gb=$((used_mb / 1024 / 1024 / 1024))
total_gb=$((total_mb / 1024 / 1024 / 1024))

printf "%s/%s gb" "$used_gb" "$total_gb"
