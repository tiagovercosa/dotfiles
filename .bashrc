### Sources ###
source "$HOME/.config/user-dirs.dirs"
source "$HOME/.bash_aliases"

### fzf ###
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"
bind -x '"\C-l": clear'

### Exports and variables ###
# Define default applications
export EDITOR="nvim"
export TERM="xterm-kitty"
export BROWSER="firefox"
export MANPAGER="less"
export PAGER="less"
export READER="zathura"
export QT_QPA_PLATFORMTHEME="qt5ct"
export DIFFPROG="nvim -d $1"
export VISUAL="nvim"
export PAGER="less -Ri"
export HISTCONTROL=ignoredups:erasedups

# Default directories in compliance with XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Realine
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# X11
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_DATA_HOME/Xauthority"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter" 
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="-"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# R user config
export R_PROFILE_USER="$XDG_CONFIG_HOME/r/.Rprofile"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/r/.Renviron" # Change R environment file location

# Disables less history file
export LESSHISTFILE=/dev/null

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv 
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-seccomp-filter-sandbox"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

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

### COLORS IN LESS (31 - red; 32 - green; 33 - yellow; 0 - reset/normal; 1 - bold; 4 - underlined) ###
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

### Options ###
set -o vi
shopt -s autocd
shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:erasedups

PATH="$HOME/.local/bin:${PATH}"

#PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1="\[$(tput setaf 5)\]\w \[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

PS1="\[$(tput setaf 5)\]\w\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput setaf 2)\]\$(get_branch)\[$(tput sgr0)\]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Change window title ###
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st-256color|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# Starship
#eval "$(starship init bash)"

### Functions ###
fcd () {
  cd "$(find -type d | fzf)"
}

open () {
  xdg-open "$(find -type f | fzf)"
}

## Get word definition function ##
### Usage: def <word> ###
function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}

## Archive extraction function ###
### Usage: ex <file> ###
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Add git branch if its present to PS1
get_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
  #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/\(.*\)/(\1) /'
}
