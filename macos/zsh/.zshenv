# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# EZA Config
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"

# ZSH config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Exports and variables
export VISUAL="$EDITOR"
export PAGER="less -Ri"
export STARDICT_DATA_DIR="$XDG_DATA_HOME"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# GPG configuration
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Disables less history file
export LESSHISTFILE=/dev/null

# R user config
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron"

# Starship configuration
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

