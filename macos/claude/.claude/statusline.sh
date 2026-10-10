#!/usr/bin/env bash
# Statusline do Claude Code no estilo do prompt (prompt.zsh + Nord).
# Recebe o JSON da sessão pela stdin e imprime uma linha.

input=$(cat)

dir=$(jq -r '.workspace.current_dir // .cwd' <<<"$input")
model=$(jq -r '.model.display_name // .model.id' <<<"$input")
model_id=$(jq -r '.model.id // ""' <<<"$input")
transcript=$(jq -r '.transcript_path // ""' <<<"$input")

# Nord (https://www.nordtheme.com/docs/colors-and-palettes)
nord3='76;86;106'
nord11='191;97;106'
nord13='235;203;139'
nord14='163;190;140'
nord15='180;142;173'
fg() { printf '\e[38;2;%sm' "$1"; }
reset=$'\e[0m'
sep=" $(fg "$nord3")│$reset "

# Diretório e git: as mesmas funções e estilos do prompt do zsh (prompt.zsh).
location=$(cd "$dir" 2>/dev/null && ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}" zsh -fc '
  source "$ZDOTDIR/nord.zsh"
  source "$ZDOTDIR/prompt.zsh"
  local _prompt_root
  _prompt_git; local git=$REPLY
  _prompt_dir "$_prompt_root"
  print -nP -- "$REPLY$git"
')

# Uso do contexto: tokens de entrada da última resposta do agente principal
context=""
if [[ -f $transcript ]]; then
  used=$(tail -n 200 "$transcript" | jq -s '
    map(select(.type == "assistant" and (.isSidechain | not) and .message.usage != null))
    | last | .message.usage
    | if . == null then empty
      else .input_tokens + .cache_read_input_tokens + .cache_creation_input_tokens end
  ' 2>/dev/null)
  if [[ -n $used ]]; then
    size=200000
    [[ $model_id == *"[1m]"* ]] && size=1000000
    pct=$(( used * 100 / size ))
    color=$nord14
    (( pct >= 50 )) && color=$nord13
    (( pct >= 80 )) && color=$nord11
    context="${sep}$(fg "$color")${pct}%${reset}"
  fi
fi

printf '%s%s%s%s%s\n' "$location" "$sep" "$(fg "$nord15")" "$model" "$reset$context"
