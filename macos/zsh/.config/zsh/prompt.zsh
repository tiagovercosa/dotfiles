eval "$(starship init zsh)"

# O starship define PROMPT/RPROMPT como strings estáticas ('$(starship prompt ...)'),
# reavaliadas a cada exibição via prompt_subst. Basta guardá-las uma vez.
typeset -g STARSHIP_FULL_PROMPT="$PROMPT"
typeset -g STARSHIP_FULL_RPROMPT="$RPROMPT"

# Executado no momento em que você aperta ENTER
function transient-prompt-finish() {
  [[ $CONTEXT == start ]] || return 0

  setopt localoptions extendedglob

  local symbol_color=$nord14
  (( ${STARSHIP_CMD_STATUS:-0} != 0 )) && symbol_color=$nord11

  PROMPT="%B%F{$nord9}%~%f%b %F{$symbol_color}❯%f "

  RPROMPT=""
  if [[ -n "$STARSHIP_DURATION" ]]; then
    local duration="$(starship module cmd_duration --cmd-duration="$STARSHIP_DURATION")"
    local open='%{' close='%}'
    RPROMPT="${duration//(#m)$'\e'\[[0-9;]#m/$open$MATCH$close}"
  fi

  zle reset-prompt
}

function transient-prompt-precmd() {
  PROMPT="$STARSHIP_FULL_PROMPT"
  RPROMPT="$STARSHIP_FULL_RPROMPT"
}

# Carrega os módulos de ganchos do Zsh
autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

# Registra as funções nos momentos certos do ciclo de vida do shell
add-zle-hook-widget zle-line-finish transient-prompt-finish
add-zsh-hook precmd transient-prompt-precmd
