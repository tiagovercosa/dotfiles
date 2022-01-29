# Define PATH
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# Define default applications
export TERM="st-256color"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"
export MANPAGER="less"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG=~/.config/starship/config.toml
export HISTCONTROL=ignoredups:erasedups

# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_DATA_HOME/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/R/.Renviron" # Change R environment file location
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHITFILE="-"  # Stop less from creating history file
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc" # Change gtk-2.0 config file location
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron" # Change R environment file location
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc" # Use python startup
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history" # Change node.js history location
export WGETRC="$XDG_CONFIG_HOME/wgetrc"


# Disables less history file
export LESSHISTFILE=/dev/null

# Set no. of lines in history
export HISTSIZE=1000
export SAVEHIST=1000

### COLORS IN LESS (31 - red; 32 - green; 33 - yellow; 0 - reset/normal; 1 - bold; 4 - underlined) ###
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Set bat highlighting colour theme
export BAT_THEME="base16"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
  exec startx "$XINITRC"
fi
