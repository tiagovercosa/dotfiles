# Set the directory we wont to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Install zinit if it is not already installed
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

# Set change directory
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=50000
HISTFILE="$ZDOTDIR/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions zstyling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -G "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -G "$realpath"'

# aliases
cdi() {
	local dir;
	dir=$(zoxide query -i "$@") && cd "$dir"
}

alias vi='nvim'

alias ls='eza --color=always --sort=extension --group-directories-first'
alias ll='eza -l --color=always --sort=extension --group-directories-first'
alias la='eza -la --color=always --sort=extension --group-directories-first'
alias lt='eza --tree --level=2 --sort=extension --group-directories-first'
alias lg='eza -lh --git --color=always --sort=extension --group-directories-first'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

alias tree='tree -C'

# Cluster LCCMat
alias cluster='TERM=xterm-256color ssh -p80 tiago@164.41.10.150'
alias lccmat='TERM=xterm-256color ssh -X tiago@100.73.56.10'
alias imac='TERM=xterm-256color ssh -X tiagolima@100.75.126.24'

# Apps
alias qtgrace='/Applications/qtgrace.app/Contents/MacOS/qtgrace'
alias vmd='/Applications/VMD2b1.app/Contents/MacOS/startup.command'

path=(
  "$HOME/Projetos/GitHub/packmol"
  "${XDG_DATA_HOME:-$HOME/.local/share}/npm/bin"
  "/opt/homebrew/opt/node@22/bin"
  $path
  )

export PATH

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

