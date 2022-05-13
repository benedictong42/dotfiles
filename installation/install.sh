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
  install_xcode_command_line_tools
  install_homebrew
  install_git
  install_mas
  install_asdf
  opt_out_of_hombrew_analytics
  print_info "Finished installing essential tools"
  print_line

  print_info "Setting up git repository for tracking..."
  setup_git_tracking "$REPOSITORY_ORIGIN" "$(cd .. && pwd)"
  print_info "Finished setting up tracking via git"
  print_line

  print_info "Installing clis..."
  dangerously_run_all_funcs_in_dir "$(cd .. && pwd)/installation/apps/clis"
  print_info "Finished installing clis"
  print_line

  print_info "Installing developer tools..."
  dangerously_run_all_funcs_in_dir "$(cd .. && pwd)/installation/apps/developer"
  print_info "Finished installing developer tools"
  print_line

  print_info "Installing lifestyle tools..."
  dangerously_run_all_funcs_in_dir "$(cd .. && pwd)/installation/apps/lifestyle"
  print_info "Finished installing lifestyle tools"
  print_line

  print_info "Installing browsers..."
  dangerously_run_all_funcs_in_dir "$(cd .. && pwd)/installation/apps/browsers"
  print_info "Finished installing browsers"
  print_line

  print_info "Installing App Store Apps..."
  dangerously_run_all_funcs_in_dir "$(cd .. && pwd)/installation/apps/apple_store"
  print_info "Finished installing App Store Apps"
  print_line


  print_info "Installing system configuration..."
  setup_create_local_defaults
  setup_symlinks
  setup_default_shell "zsh"
  print_info "Finished configuring system"
  print_line

  print_info "Installing file associations..."
  setup_vscode_file_associations
  print_info "Finished configuring file associations"
  print_line
  

  print_success "🎉 System set up complete! (check README for remaining manual steps)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

init
main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
