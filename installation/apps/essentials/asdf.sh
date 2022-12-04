#!/bin/bash

install_asdf() {
  brew_install "asdf" "asdf"

  # install python
  execute "asdf plugin-add python"
  execute "asdf install python 3.9.10"
  execute "asdf global python 3.9.10"

  # install node
  execute "asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git"
  execute "asdf install nodejs 18.1.0"
  execute "asdf global nodejs 18.1.0"
 
  # install g
  execute "asdf plugin-add golang https://github.com/kennyp/asdf-golang.git"
  execute "asdf install golang 1.19.3"
  execute "asdf global golang 1.19.3"
  # install java
  execute "asdf plugin-add java https://github.com/halcyon/asdf-java.git"
  execute "asdf install java zulu-11.54.23"
  execute "asdf global java zulu-11.54.23"

  # install ruby
  execute "asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git"

  # install golang
  execute "asdf plugin-add golang https://github.com/kennyp/asdf-golang.git"
}
