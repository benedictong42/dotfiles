#!/bin/bash

install_asdf() {
  brew_install "asdf" "asdf"

  # install node
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 18.1.0
}
