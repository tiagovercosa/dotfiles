export ZDOTDIR="$HOME/.config/zsh"

### Exports and variables ###
# Define default applications
export EDITOR="nvim"
export BROWSER="firefox"
export MANPAGER="less"
export PAGER="less"
export READER="zathura"
export DIFFPROG="nvim -d $1"
export VISUAL="nvim"
export PAGER="less -Ri"
export HISTCONTROL=ignoredups:erasedups
export GTK_USE_PORTAL=1
export PLASMA_USE_QT_SCALING=1
# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export QT_QPA_PLATFORM="wayland;xcb"
# export QT_QPA_PLATFORMTHEME="gtk3"

# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# X11
#export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
#export XAUTHORITY="$XDG_DATA_HOME/Xauthority"

[[ -d ${HOME}/bin ]] && export PATH=$PATH:${HOME}/bin
[[ -d ${HOME}/.local/bin ]] && export PATH=$PATH:${HOME}/.local/bin
[[ -d ${HOME}/.local/xmgrace/bin ]] && export PATH=$PATH:${HOME}/.local/xmgrace/bin

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE="$ZDOTDIR/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="-"
export STARDICT_DATA_DIR="$XDG_DATA_HOME"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# Disables less history file
export LESSHISTFILE=/dev/null

# R user config
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron" # Change R environment file location
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-seccomp-filter-sandbox"

# Disables less history file
export LESSHISTFILE=/dev/null

# Set no. of lines in history
export HISTSIZE=5000
export SAVEHIST=5000

# Set bat highlighting colour theme
export BAT_THEME="base16"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
