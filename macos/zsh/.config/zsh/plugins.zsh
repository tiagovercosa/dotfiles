# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Install zinit if it is not already installed
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Extra completion definitions (must be in fpath before compinit)
zinit light zsh-users/zsh-completions

# Load completions (cache in XDG_CACHE_HOME instead of ZDOTDIR)
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zinit cdreplay -q

# fzf-tab needs compinit already loaded
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git

# Keep Tab for fzf-tab (^N is already history-beginning-search-forward in .zshrc)
export DEJA_CYCLE_KEY=
zinit ice wait"0" lucid depth=1 pick"deja.plugin.zsh"
zinit light Giammarco-Ferranti/deja

# Syntax highlighting last: it wraps the widgets defined before it
zinit light zdharma-continuum/fast-syntax-highlighting
