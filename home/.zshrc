

export PATH=/opt/homebrew/bin:$PATH

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Opt out of Homebrew analytics
# https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out
export HOMEBREW_NO_ANALYTICS=1

# Opt out of Homebrew auto update when running commands like install
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_NO_AUTO_UPDATE=1


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# Antibody update - run this when new bundles are added to bundles.txt
alias antibody_update="antibody bundle < ~/.config/antibody/bundles.txt > ~/.zsh_plugins.sh"

# Load plugins from antibody
[ -f ~/.zsh_plugins.sh ] && source ~/.zsh_plugins.sh
autoload -U compinit && compinit
autoload -Uz async && async


# # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Define zsh specific aliases
alias reload="source ~/.zshrc"
alias pyenv="source venv/bin/activate"

# Source shared aliases
[ -f ~/.config/aliases ] && source ~/.config/aliases;

# Source local config if it exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Setup asdf
# https://hackercodex.com/guide/python-development-environment-on-mac-osx/
. $(brew --prefix asdf)/libexec/asdf.sh
# asdf reshim ruby
# asdf reshim java
# asdf reshim golang
# asdf reshim nodejs


# https://github.com/asdf-vm/asdf/issues/692#issuecomment-642748733
autoload -U +X bashcompinit && bashcompinit

# set up bash completions
# https://blog.natterstefan.me/how-to-use-multiple-node-version-with-asdf
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash


export PATH=$PATH:~/.fake_executables

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export JAVA_HOME="$HOME/.asdf/installs/java/zulu-11.54.23"

export PATH="$PATH:/Applications/flameshot.app/Contents/MacOS/"

asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    JAVA_HOME="$(dirname "$(dirname "$(realpath "${java_path}")")")"
  fi
}

# autoload -U add-zsh-hook
# add-zsh-hook precmd asdf_update_java_home

# Use starship propmt
eval "$(starship init zsh)"