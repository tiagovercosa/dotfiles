export ZDOTDIR="$HOME/.config/zsh"

# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Exports and variables
export MANPAGER="sh -c 'col -bx | bat -l man --style plain --paging always'"
export DIFFPROG="nvim -d"
export VISUAL="nvim"
export PAGER="less -Ri"
export STARDICT_DATA_DIR="$XDG_DATA_HOME"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export ZINIT_HOME="$HOME/.local/share/zinit"

# GPG configuration
export GPG_TTY=$(tty)
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Disables less history file
export LESSHISTFILE=/dev/null

# Set bat highlighting colour theme
export BAT_THEME="base16"

# R user config
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron"

