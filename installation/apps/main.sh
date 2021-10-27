#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# Load install functions

# Essentials
source essentials/xcode.sh
source essentials/homebrew.sh
source essentials/git.sh

# Browsers
source browsers/chrome.sh
source browsers/firefox.sh

# Clis
source clis/antibody.sh
source clis/awscli.sh
source clis/bfg.sh
source clis/duti.sh
source clis/exa.sh
source clis/fd.sh
source clis/fish.sh
source clis/fonts.sh
source clis/gnupg.sh
source clis/lazydocker.sh
source clis/lazygit.sh
source clis/neovim.sh
source clis/node14.sh
source clis/nvm.sh
source clis/python.sh
source clis/ripgrep.sh
source clis/terraform.sh
source clis/vim.sh
source clis/zsh.sh

# Developer
source developer/dbeaver.sh
source developer/kitty.sh
source developer/postman.sh
source developer/docker.sh
source developer/vscode.sh
source developer/keybase.sh
source developer/pycharm.sh

# Lifestyle
source lifestyle/iina.sh
source lifestyle/megasync.sh
source lifestyle/raycast.sh
source lifestyle/rectangle.sh
source lifestyle/vlc.sh
source lifestyle/whatsapp.sh
source lifestyle/android_messages.sh




