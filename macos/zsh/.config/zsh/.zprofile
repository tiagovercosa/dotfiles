eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -U path   # remove duplicatas automaticamente
path=(
  "$HOME/.local/bin"
  $HOME/bin(N-/)
  "$XDG_DATA_HOME/npm/bin"
  $path
  "/Applications/Obsidian.app/Contents/MacOS"
)
