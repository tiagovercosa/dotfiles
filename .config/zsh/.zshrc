# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.config/oh-my-zsh"

# ZSH_THEME="bira"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"

# DISABLE_UPDATE_PROMPT="true"

# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    git
    vi-mode
    bgnotify
    fzf
    sudo
)
 
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# nnn configuration
export NNN_PLUG='p:preview-tabbed;f:fzopen;i:imgview'
export NNN_OPTS=eo
export NNN_OPS_PROG=0
export NNN_OPENER=xdg-open
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'

# Aliases
alias nv='nvim'
alias update="sudo pacman -Syu"
alias myip="curl ipinfo.io/ip"

alias cf='cd $(fd . -H -t d ~ | fzf)'
alias fzfo='devour xdg-open "$(rg --files | fzf)" &> /dev/null'
alias zat='echo "$(rg --files -t pdf | fzf)" | xargs -r -0 -I{} devour zathura "{}"'
alias oko='devour okular "$(rg --files -t pdf | fzf)" &> /dev/null'
# alias rgf='$(rg --files | fzf)'

alias hd='cd /storage'

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias l='exa -l --color=always --group-directories-first'  # Long format
alias lt='exa -T --color=always --group-directories-first' # Tree listing

# i3config
# alias i3conf='nvim ~/.config/i3/config'
# alias i3bconf='nvim ~/.config/i3blocks/config'

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'

# Commit for VimWiki
alias wiki-commit='git add . && git commit -a -m "updated on `date +'%Y%m%d_%H:%M'`" && git push origin main'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    command man "$@"
}

# Adding flags
alias ..='cd ..'
alias ...='cd ../..'
alias n='nnn -cCx'
alias clima="curl http://pt.wttr.in"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

#git dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# StarShip config
eval "$(starship init zsh)"

[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

autoload -Uz compinit
compinit

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

### Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
