#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restart Dock
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 👨🏻‍💻
# @raycast.packageName System
#
# Documentation:
# @raycast.description Restart Finder
# @raycast.author Jordi Clement
# @raycast.authorURL https://github.com/jordicl

killall Dock
echo "Restarted Dock"
