#!/bin/bash

# Dependency: emoj (https://github.com/sindresorhus/emoj)
# Install via npm: `npm install --global emoj`

# @raycast.title Search Emojis
# @raycast.author Caleb Stauffer
# @raycast.authorURL https://github.com/crstauf
# @raycast.description Search for emojis related to input.

# @raycast.icon 📙
# @raycast.mode fullOutput
# @raycast.packageName Communication
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "Search for..." }


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if ! command -v emoj &> /dev/null; then
	echo "emoj command is required (https://github.com/sindresorhus/emoj).";
	exit 1;
fi

emojis=$(emoj "$1")

if [ -z "$emojis" ]; then
	echo "No emojis found for \"${1}\""
	exit 0
fi

echo "Emojis found for \"$1\":"
echo ""
echo "$emojis"
echo ""