#!/bin/bash

install_asdf() {
  brew_install "asdf" "asdf"

  # install node
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 18.1.0
 
  # install java
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  asdf install java zulu-11.54.23

  # install ruby
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

  # install golang
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
}
