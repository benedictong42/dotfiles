#!/bin/bash

# Allows installing apple store apps
install_mass() {
  brew_install "Mas" "mas"
}

mas_install() {
  local -r name="$1"
  local -r id="$2"
  
  # Install the formula
  if ! _is_installed_via_mas "$id"; then
    execute "mas purchase $id" "Installing $name"
  else
    print_ok "$name already installed (via apple or mas)"
  fi
}

_is_installed_via_mas() {
  mas list | grep "$1" &> /dev/null && return 0 || return 1
}
