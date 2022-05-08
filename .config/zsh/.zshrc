# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

#ZSH_THEME="robbyrussell"

plugins=(vi-mode
    	bgnotify
    	fzf
    	sudo
    	git)

source $ZSH/oh-my-zsh.sh

# User configuration

### COLORS IN LESS (31 - red; 32 - green; 33 - yellow; 0 - reset/normal; 1 - bold; 4 - underlined) ###
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    command man "$@"
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias v='nvim'
alias update="sudo pacman -Syu"
alias myip="curl ipinfo.io/ip"

alias cf='cd $(fd . -H -t d ~ | fzf)'
alias fzfo='devour xdg-open "$(rg --files | fzf)" &> /dev/null'
alias zat='echo "$(rg --files -t pdf | fzf)" | xargs -r -0 -I{} devour zathura "{}"'
alias oko='devour okular "$(rg --files -t pdf | fzf)" &> /dev/null'
# alias rgf='$(rg --files | fzf)'

alias data='cd /storage'

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias l='exa -l --color=always --group-directories-first'  # Long format
alias lt='exa -T --color=always --group-directories-first' # Tree listing

alias du='du -sh'

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Adding flags
alias ..='cd ..'
alias ...='cd ../..'
alias clima="curl http://pt.wttr.in"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'

# Starship
eval "$(starship init zsh)"

# startx
alias startx='startx "$XINITRC"'

# FZF
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

autoload -Uz compinit
compinit

### Added by Zinit's installer
if [[ ! -f $ZDOTDIR/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$ZDOTDIR/.zinit" && command chmod g-rwX "$ZDOTDIR/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$ZDOTDIR/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZDOTDIR/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
