export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'  # strip-cwd-prefix removes the leading ./ from results

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

# Nord colors (variables from nord.zsh)
FZF_DEFAULT_OPTS+="
  --color=fg:$nord4,bg:-1,hl:$nord8
  --color=fg+:$nord6,bg+:$nord1,hl+:$nord8,gutter:-1
  --color=border:$nord3,separator:$nord3,scrollbar:$nord3,preview-border:$nord3
  --color=prompt:$nord9,pointer:$nord15,marker:$nord14,spinner:$nord15
  --color=info:$nord3_bright,header:$nord9,query:$nord6
"

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="${(q)result}"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
# Bound in .zshrc

