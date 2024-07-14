#!/bin/sh

# Check if application class is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <application_class>"
  exit 1
fi

# Name of the application class to search for
APP_CLASS=$1

# Get the tree of windows managed by sway
WINDOWS=$(swaymsg -t get_tree)

# Parse the JSON to find the workspace of the application class
WORKSPACE=$(echo "$WINDOWS" | jq -r --arg APP_CLASS "$APP_CLASS" '
  def find_class($class): 
    .nodes[]
    | recurse(.nodes[]?)
    | select(.window_properties.class == $class);
  .nodes[]
  | select(.type == "output")
  | .nodes[]
  | select(.type == "workspace")
  | select(any(find_class($APP_CLASS); true))
  | .name
')

# If a workspace was found, switch to it
if [ -n "$WORKSPACE" ]; then
    swaymsg workspace "$WORKSPACE"
else
    echo "Application with class $APP_CLASS not found."
fi

