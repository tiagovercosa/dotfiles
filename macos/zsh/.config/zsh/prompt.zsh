eval "$(starship init zsh)"

# Variável global para armazenar temporariamente o prompt do Starship
typeset -g STARSHIP_BACKUP_PROMPT=""

# 1. Executado no momento em que você aperta ENTER
function transient-prompt-finish() {
  # Salva a configuração dinâmica do Starship
  STARSHIP_BACKUP_PROMPT="$PROMPT"
  
  # Substitui pelo símbolo transiente (versão estática para velocidade instantânea)
  PROMPT="%F{green}❯%f "
  RPROMPT=""
  
  # Redesenha a linha atual com o prompt encolhido
  zle reset-prompt
}

# 2. Executado logo antes de exibir o prompt da PRÓXIMA linha
function transient-prompt-precmd() {
  # Se houver um backup, restaura o Starship completo para a nova linha
  if [[ -n "$STARSHIP_BACKUP_PROMPT" ]]; then
    PROMPT="$STARSHIP_BACKUP_PROMPT"
    STARSHIP_BACKUP_PROMPT=""
  fi
}

# Carrega os módulos de ganchos do Zsh
autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

# Registra as funções nos momentos certos do ciclo de vida do shell
add-zle-hook-widget zle-line-finish transient-prompt-finish
add-zsh-hook precmd transient-prompt-precmd
