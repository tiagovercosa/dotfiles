export PATH="$HOME/.local/bin:$PATH"

# Define default applications
export TERM="xterm-kitty"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"
export MANPAGER="less"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export HISTCONTROL=ignoredups:erasedups
export DIFFPROG="nvim -d $1"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export VISUAL="nvim"
export PAGER="less -Ri"

# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Path to your oh-my-zsh installation.
#export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_DATA_HOME/Xauthority"

export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTFILE="$ZDOTDIR/.histfile"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHITFILE="-"  # Stop less from creating history file
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc" # Change gtk-2.0 config file location
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc" # Use python startup
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history" # Change node.js history location
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# R user config
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron" # Change R environment file location

# Disables less history file
export LESSHISTFILE=/dev/null

# Set no. of lines in history
export HISTSIZE=5000
export SAVEHIST=5000

# Set bat highlighting colour theme
export BAT_THEME="base16"

# NNN config
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="dicEx"
export NNN_TRASH=1
export NNN_PLUG='p:preview-tui'
export NNN_OPS_PROG=0
