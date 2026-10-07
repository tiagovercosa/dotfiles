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
# zsh-vi-mode first, initialized right away (not on the first prompt), so every
# plugin and bindkey loaded after it in .zshrc overrides its defaults.
ZVM_INIT_MODE=sourcing
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
# Keep Tab for fzf-tab (^N is already history-search-forward in .zshrc)
export DEJA_CYCLE_KEY=
zinit ice wait"0" lucid depth=1 pick"deja.plugin.zsh"
zinit light Giammarco-Ferranti/deja
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

