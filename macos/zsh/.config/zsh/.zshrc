source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/prompt.zsh"

# Set change directory
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt nobeep
setopt numeric_glob_sort

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^L' clear-screen

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
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -G "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -G "$realpath"'

# aliases
source "$ZDOTDIR/aliases.zsh"

# fzf
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source "$ZDOTDIR/fzf.zsh"

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

path=(
  "$HOME/Projetos/GitHub/packmol"
  "${XDG_DATA_HOME:-$HOME/.local/share}/npm/bin"
  "/opt/homebrew/opt/node@22/bin"
  $path
  )

export PATH

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

