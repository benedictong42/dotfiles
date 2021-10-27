#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# If git tracking is not set up, the path to the current dotfiles will be
# REPLACED with the content at this origin. This is really only useful for
# when setting up the repo on a new env. No git actions are taken if the
# current directory is already a git repo.
declare -r REPOSITORY_ORIGIN="git@github.com:benedictong42/dotfiles.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Execute relative to location of this file
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

init() {
  # Set starting directory
  local -r startDir=$(pwd)

  # Load utils and functions
  source utils.sh && cd "$startDir" || exit 1
  source apps/main.sh && cd "$startDir" || exit 1
  source tasks/main.sh && cd "$startDir" || exit 1

  print_line
  print_info "SYSTEM SET UP - benedictong42/dotfiles"
  print_info "These scripts are going to modify your system and install new software."
  print_info "Make sure you know what you are doing!"
  print_line

  ask_for_confirmation "⚠️ Use these scripts at your own risk. Are you sure you want to proceed?"

  if ! answer_is_yes; then
    print_line
    print_success "Nothing was changed. Goodbye 👋🏻"
    exit 0
  fi
}





main() {
  print_info "You may be asked for your password to execute sudo."
  ask_for_sudo
  print_line

  print_info "Installing essential tools..."
  # find "$(cd .. && pwd)/installation/apps/essentials"
  install_monosnap
  # install_xcode_command_line_tools
  # install_homebrew
  # install_git
  # opt_out_of_hombrew_analytics
  # print_info "Finished installing core tools"
  # print_line

  # print_info "Setting up git repository for tracking..."
  # setup_git_tracking "$REPOSITORY_ORIGIN" "$(cd .. && pwd)"
  # print_info "Finished setting up tracking via git"
  # print_line

  # print_info "Installing clis..."
  # install_antibody
  # install_awscli
  # install_bfg
  # install_duti
  # install_exa
  # install_fd
  # install_fonts
  # install_fish
  # install_gnupg
  # install_lazydocker
  # install_lazygit
  # install_neovim
  # install_keg_only_node14
  # install_nvm
  # install_python
  # install_ripgrep
  # install_terraform
  # install_vim
  # install_zsh
  # print_info "Finished installing utilities"
  # print_line

  # print_info "Installing developer tools..."
  
  # install_dbeaver
  # install_docker
  # install_kitty
  # install_postman
  # install_vscode
  # install_pycharm
  # install_keybase
  
  # print_info "Installing lifestyle tools..."
  # install_iina # prefer this over vlc
  # install_megasync
  # install_rectangle
  # install_raycast
  # install_android_messages
  # install_whatsapp
  # print_info "Finished installing applications"
  # print_line

  # print_info "Installing browsers..."
  # install_chrome
  # install_firefox
  # print_info "Finished installing browsers"
  # print_line

  # print_info "Installing system configuration..."
  # setup_create_local_defaults
  # setup_symlinks
  # setup_terminal_theme
  # setup_default_shell
  # print_info "Finished configuring system"
  # print_line

  # print_info "Installing file associations..."
  # setup_vscode_file_associations
  # print_info "Finished configuring file associations"
  # print_line
  

  print_success "🎉 System set up complete! (check README for remaining manual steps)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

init
main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
