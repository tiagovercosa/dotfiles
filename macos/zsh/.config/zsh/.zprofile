eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -d ${HOME}/bin ]] && export PATH=$PATH:${HOME}/bin
[[ -d ${HOME}/.local/bin ]] && export PATH=$PATH:${HOME}/.local/bin

