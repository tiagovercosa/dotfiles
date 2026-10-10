# Aliases for zsh

# Directory listing
# eza uses only its own theme.yml: vivid's LS_COLORS would override it
eza() { LS_COLORS= command eza "$@" }

alias ls='eza --group-directories-first'
alias ll='eza -l --git --group-directories-first'
alias la='eza -la --git --group-directories-first'
alias lt='eza -lr -s time --git'

alias tree='eza --tree --icons auto'

alias -- -='cd -'

# Core utilities
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Apps
# alias qtgrace='/Applications/qtgrace.app/Contents/MacOS/qtgrace'
alias tlup='sudo env PATH="/Library/TeX/texbin:$PATH" tlmgr update --self --all'
alias vmd='/Applications/VMD2b1.app/Contents/MacOS/startup.command'
alias vi='nvim'
