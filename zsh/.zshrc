#####
# XDG
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

#####
# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

#####
# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#####
# Plugins
[[ -o interactive ]] && source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/opt/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source <(fzf --zsh)

# history substring search keybinds (set after zsh-vi-mode loads)
zvm_after_init_commands+=('bindkey "^[[A" history-substring-search-up; bindkey "^[[B" history-substring-search-down')

#####
# Aliases & Functions
source $HOME/.zsh_alias
source $HOME/.zsh_functions

#####
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#####
# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

#####
# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
[[ -x "$HOME/.tmuxifier/bin/tmuxifier" ]] && eval "$(tmuxifier init -)"

#####
# pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

#####
# OSS CAD Suite (yosys, ghdl — sourced after Homebrew so Homebrew Python takes priority)
[[ -f "$HOME/tools/oss-cad-suite/environment" ]] && source "$HOME/tools/oss-cad-suite/environment"

#####
# zoxide (replaces cd with frecency-based jumping)
eval "$(zoxide init zsh)"

#####
# Starship
eval "$(starship init zsh)"

#####
# Atuin
eval "$(atuin init zsh)"

. "$HOME/.local/share/../bin/env"
