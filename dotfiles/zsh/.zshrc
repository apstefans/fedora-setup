# Zsh configuration

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Completion
autoload -Uz compinit
compinit

# Key bindings
bindkey -e

# Load shared aliases
if [[ -f "$HOME/.bashrc.d/aliases.sh" ]]; then
    source "$HOME/.bashrc.d/aliases.sh"
fi

# User-local executable directories
typeset -U path
path=("$HOME/.local/bin" "$HOME/bin" $path)
export PATH

# Smarter directory navigation
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi

# Initialise Starship prompt
eval "$(starship init zsh)"
