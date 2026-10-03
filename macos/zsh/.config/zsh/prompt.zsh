eval "$(starship init zsh)"

# Variável global para armazenar temporariamente o prompt do Starship
typeset -g STARSHIP_BACKUP_PROMPT=""
typeset -g STARSHIP_BACKUP_RPROMPT=""

# Executado no momento em que você aperta ENTER
function transient-prompt-finish() {
  STARSHIP_BACKUP_PROMPT="$PROMPT"
  STARSHIP_BACKUP_RPROMPT="$RPROMPT"

  local symbol_color=green
  (( ${STARSHIP_CMD_STATUS:-0} != 0 )) && symbol_color=red

  PROMPT="%F{#81a1c1}%~%f %F{$symbol_color}❯%f "

  RPROMPT=""
  if [[ -n "$STARSHIP_DURATION" ]]; then
    setopt localoptions extendedglob
    local duration="$(starship module cmd_duration --cmd-duration="$STARSHIP_DURATION")"
    local open='%{' close='%}'
    RPROMPT="${duration//(#m)$'\e'\[[0-9;]#m/$open$MATCH$close}"
  fi
  
  zle reset-prompt
}

function transient-prompt-precmd() {
  # Se houver um backup, restaura o Starship completo para a nova linha
  if [[ -n "$STARSHIP_BACKUP_PROMPT" ]]; then
    PROMPT="$STARSHIP_BACKUP_PROMPT"
    RPROMPT="$STARSHIP_BACKUP_RPROMPT"
    STARSHIP_BACKUP_PROMPT=""
    STARSHIP_BACKUP_RPROMPT=""
  fi
}

# Carrega os módulos de ganchos do Zsh
autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

# Registra as funções nos momentos certos do ciclo de vida do shell
add-zle-hook-widget zle-line-finish transient-prompt-finish
add-zsh-hook precmd transient-prompt-precmd
