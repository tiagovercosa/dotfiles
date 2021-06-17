# Define PATH
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# Define default applications
export TERM="kitty"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"
export MANPAGER="less"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG=~/.config/starship/config.toml

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
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron" # Change R environment file location
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Disables less history file
export LESSHISTFILE=/dev/null

# Disables less history file
export PYTHONHISTFILE=/dev/null

# Set no. of lines in history
export HISTSIZE=1000
export SAVEHIST=1000

# nnn configuration
export NNN_OPTS=eo
#export NNN_FCOLORS='030304020006060801050501'
export NNN_OPENER=xdg-open
export NNN_TRASH=1
export NNN_PLUG='r:preview-tabbed;t:preview-tui;o:fzopen;c:fzcd;p:pdfview;i:imgview'
export NNN_FIFO=/tmp/nnn.fifo
#export NNN_BMS='h:~;m:/run/media/nate/;t:~/.local/share/Trash/files/;'
#set --export NNN_FIFO "/tmp/nnn.fifo"

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

