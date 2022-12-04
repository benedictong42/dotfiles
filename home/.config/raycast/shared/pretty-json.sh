#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pretty JSON from clipboard
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🖨
# @raycast.packageName Developer Utilities
. $(brew --prefix asdf)/libexec/asdf.sh

pbpaste | python -m json.tool
