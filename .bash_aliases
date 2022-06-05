### Aliases ###
alias startx='startx "$XINITRC"'

alias ls='exa --color=always --group-directories-first'      # Normal listing
alias la='exa -la --color=always --group-directories-first'  # All files and dirs (long format)
alias l='exa -l --color=always --group-directories-first'   # Long format
alias ll='exa -lh --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'  # Tree listing

alias du='du -sh'

alias ..="cd .." 
alias ...="cd ../.."
alias clima="curl http://pt.wttr.in"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'


alias v="nvim"

# Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias update="sudo pacman -Syu"
alias myip="curl ipinfo.io/ip"

alias data='cd /storage'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ip='ip -color=auto'
alias diff='diff --color=auto'

#git dotfiles
#alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# udisks
alias drive='udisksctl mount -b'
alias undrive='udisksctl unmount -b'

