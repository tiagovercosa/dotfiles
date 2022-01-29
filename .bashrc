#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export EDITOR="nvim"
export TERM="st"
export BROWSER="firefox"
export MANPAGER="less"
export READER="zathura"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG=~/.config/starship/config.toml

### COLORS IN LESS (31 - red; 32 - green; 33 - yellow; 0 - reset/normal; 1 - bold; 4 - underlined) ###
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#nnn config
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=1                                 # trash (needs trash-cli) instead of delete

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
alias vim='nvim'
alias nvimconf='nvim ~/.config/nvim/init.vim'

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias l='exa -l --color=always --group-directories-first'  # Long format
alias lt='exa -aT --color=always --group-directories-first' # Tree listing

# i3config
alias i3conf='nvim ~/.config/i3/config'
alias i3bconf='nvim ~/.config/i3blocks/config'

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Adding flags
alias ..='cd ..'
alias ...='cd ../..'
alias n='nnn -d'

#git dotfiles
alias dotfile='/usr/bin/git --git-dir=$HOME/dotfile/ --work-tree=$HOME'

# StarShip config
eval "$(starship init bash)"

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
