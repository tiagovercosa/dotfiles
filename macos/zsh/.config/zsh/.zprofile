eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -U path   # remove duplicatas automaticamente
path=(
  "$HOME/.local/bin"
  $HOME/bin(N-/)
  "$HOME/Projetos/GitHub/packmol"
  "$XDG_DATA_HOME/npm/bin"
  "/opt/homebrew/opt/node@22/bin"
  $path
  "/Applications/Obsidian.app/Contents/MacOS"
)
