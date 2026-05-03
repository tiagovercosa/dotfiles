export DISABLE_AUTO_TITLE="true"

# Carrega o Zinit
if [[ -r /opt/homebrew/opt/zinit/zinit.zsh ]]; then
  source /opt/homebrew/opt/zinit/zinit.zsh
fi

# Historic config
HISTFILE="$ZDOTDIR/history"
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
setopt sharehistory
setopt extendedglob
setopt interactive_comments
setopt autocd

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt hist_ignore_space

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -M vicmd '^p' history-search-backward
bindkey -M vicmd '^n' history-search-forward

# Plugins
if (( ${+functions[zinit]} )); then
  zinit light zsh-users/zsh-completions

  # Load completions
  autoload -Uz compinit
  if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi
  zinit cdreplay -q

  zinit light Aloxaf/fzf-tab
  zinit light zsh-users/zsh-autosuggestions
  zinit light zdharma-continuum/fast-syntax-highlighting
fi

# Completions zstyling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -G "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -G "$realpath"'

# Aceita sugestão com Ctrl+f quando o widget existir
if (( ${+widgets[autosuggest-accept]} )); then
  bindkey '^f' autosuggest-accept
fi

autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Prompt
# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

typeset -U path

path=(
  "$HOME/Projetos/GitHub/packmol"
  "${XDG_DATA_HOME:-$HOME/.local/share}/npm/bin"
  $path
  )

export PATH

# aliases
cdi() { 
	local dir;
	dir=$(zoxide query -i "$@") && cd "$dir"
}
alias vi='nvim'

alias ls='ls -G'
alias ll='ls -lhG'
alias la='ls -lahG'
alias l1='ls -1G'
alias lr='ls -lhGR'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

alias tree='tree -C'

# Cluster LCCMat
alias cluster='TERM=xterm-256color ssh -p80 tiago@164.41.10.150'
alias lccmat='TERM=xterm-256color ssh -X tiago@100.73.56.10'
alias imac='TERM=xterm-256color ssh -X tiagolima@100.75.126.24'

# Apps
alias qtgrace='/Applications/qtgrace.app/Contents/MacOS/qtgrace'
alias vmd='/Applications/VMD2b1.app/Contents/MacOS/startup.command'

# Shell integrations
eval "$(zoxide init zsh --cmd z)"
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
