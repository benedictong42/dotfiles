#!/bin/bash

setup_default_shell() {
  local -r shellPath "$(get_base_installation_path)/$1"

  if ! grep "$shellPath" /etc/shells &> /dev/null; then
    execute "sudo echo $shellPath | sudo tee /etc/shells" "Make $1 a standard shell in /etc/shells"
  else
    print_ok "$1 already defined as a standard shell in /etc/shells"
  fi

  if ! test "$(_get_default_shell)" == "$shellPath"; then
    execute "sudo chsh -s $shellPath $USER" "Set $1 as default shell"
  else
    print_ok "$1 is already the default shell"
  fi
}

_get_default_shell() {
  finger "$USER" | grep -oG 'Shell: .*' | cut -d ' ' -f2
}
