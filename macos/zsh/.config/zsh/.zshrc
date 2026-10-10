source "$ZDOTDIR/nord.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/prompt.zsh"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set change directory
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt nobeep
setopt numeric_glob_sort

# Keybindings
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
bindkey '^L' clear-screen
bindkey '^F' _fzf_file_no_hidden

# Home/End (cmd+← / cmd+→ no kitty)
for km in viins vicmd; do
  bindkey -M $km '^[[H' beginning-of-line
  bindkey -M $km '^[[F' end-of-line
  bindkey -M $km '^[OH' beginning-of-line
  bindkey -M $km '^[OF' end-of-line
done

# History
HISTSIZE=50000
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=$HISTSIZE
setopt extended_history
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions zstyling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no  # let fzf-tab show the menu and insert the common prefix first
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'LS_COLORS= eza -1 --color=always --icons=auto --group-directories-first "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'LS_COLORS= eza -1 --color=always --icons=auto --group-directories-first "$realpath"'

# GPG
export GPG_TTY=$TTY

# aliases
source "$ZDOTDIR/aliases.zsh"

# fzf
source "$ZDOTDIR/fzf.zsh"

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

source "$ZDOTDIR/local.zsh"
