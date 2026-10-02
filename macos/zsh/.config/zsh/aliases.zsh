# Aliases for zsh

# Zoxide integration
cdi() {
	local dir;
	dir=$(zoxide query -i "$@") && cd "$dir"
}

# Directory listing
alias ls='eza --group-directories-first'
alias ll='eza -l --git --group-directories-first'
alias la='eza -la --git --group-directories-first'
alias lt='eza -lr -s time --git'

alias tree='eza --tree --icons auto'

alias -- -='cd -'

# Reuse ls completrions for eza
compdef eza=ls

# Core utilities
alias rg="rg --colors 'match:fg:magenta' --colors 'match:style:bold'"
alias grep="rg --colors 'match:fg:magenta' --colors 'match:style:bold'"
alias fgrep='rg -F'
alias diff='diff --color=auto'

# Apps
# alias qtgrace='/Applications/qtgrace.app/Contents/MacOS/qtgrace'
alias tlup='sudo env PATH="/Library/TeX/texbin:$PATH" tlmgr update --self --all'
alias vmd='/Applications/VMD2b1.app/Contents/MacOS/startup.command'
alias vi='nvim'
