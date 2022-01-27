
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
export PATH=/opt/homebrew/bin:$PATH


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Opt out of Homebrew analytics
# https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out
export HOMEBREW_NO_ANALYTICS=1

# Opt out of Homebrew auto update when running commands like install
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_NO_AUTO_UPDATE=1

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically call `nvm use` when switching to a directory that contains a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ZSH_THEME="powerlevel10k/powerlevel10k"

# # Antibody update - run this when new bundles are added to bundles.txt
alias antibody_update="antibody bundle < ~/.config/antibody/bundles.txt > ~/.zsh_plugins.sh"

# # Load plugins from antibody
[ -f ~/.zsh_plugins.sh ] && source ~/.zsh_plugins.sh
autoload -U compinit && compinit
autoload -Uz async && async


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Export GPG
export GPG_TTY=$(tty)

# Define zsh specific aliases
alias reload="source ~/.zshrc"
alias pyenv="source venv/bin/activate"

# Source shared aliases
[ -f ~/.config/aliases ] && source ~/.config/aliases;

# Source local config if it exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


# Setup asdf
# https://hackercodex.com/guide/python-development-environment-on-mac-osx/
. $(brew --prefix asdf)/asdf.sh
asdf reshim ruby

# https://github.com/asdf-vm/asdf/issues/692#issuecomment-642748733
autoload -U +X bashcompinit && bashcompinit

# set up bash completions
# https://blog.natterstefan.me/how-to-use-multiple-node-version-with-asdf
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
