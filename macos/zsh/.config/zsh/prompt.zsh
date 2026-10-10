zmodload zsh/datetime
autoload -Uz add-zle-hook-widget add-zsh-hook

typeset -g _prompt_status=0      # exit status of the last command
typeset -g _prompt_start=        # EPOCHREALTIME when the last command started
typeset -g _prompt_duration=     # formatted duration ("" when under 2s)
typeset -g _prompt_line1=        # first line of the full prompt

export VIRTUAL_ENV_DISABLE_PROMPT=1
PS2="%F{$nord3}❯❯ %f"

# Directory: repo-relative inside git (truncate_to_repo), ~ for $HOME,
# last 5 components, "…/" when the path no longer starts at ~ or /.
function _prompt_dir() {
  local root=$1 dir pwd=${PWD:A}
  if [[ -n $root && $root != ${HOME:A} ]]; then
    dir=${root:t}${pwd#$root}
  else
    dir=${PWD/#$HOME/\~}
  fi
  local -a parts=(${(s:/:)dir})
  (( $#parts > 5 )) && dir=${(j:/:)parts[-5,-1]}
  [[ $dir == '~'* || $dir == /* ]] || dir="…/$dir"
  REPLY="%B%F{$nord9}${dir//\%/%%}%f%b"
  [[ -w $PWD ]] || REPLY+="%F{$nord11}🔒%f"
}

# Git: find the repo root without forking, then a single `git status`.
function _prompt_git() {
  REPLY= _prompt_root=
  local d=${PWD:A}
  while :; do
    [[ -e $d/.git ]] && { _prompt_root=$d; break; }
    [[ $d == / ]] && return
    d=${d:h}
  done

  local line branch= ahead=0 behind=0 stash=0
  local conflicted= untracked= modified= staged= renamed= deleted=
  for line in ${(f)"$(git --no-optional-locks status --porcelain=v2 --branch --show-stash 2>/dev/null)"}; do
    case $line in
      '# branch.head '*) branch=${line#\# branch.head } ;;
      '# branch.ab '*)   local -a ab=(${=line}); ahead=${ab[3]#+}; behind=${ab[4]#-} ;;
      '# stash '*)       stash=1 ;;
      'u '*)             conflicted='=' ;;
      '? '*)             untracked='?' ;;
      [12]' '*)
        local x=${line[3]} y=${line[4]}
        [[ $x == R ]] && renamed='»'
        [[ $x == [MATC] ]] && staged='+'
        [[ $x == D || $y == D ]] && deleted='✘'
        [[ $y == [MT] ]] && modified='*'
        ;;
    esac
  done
  [[ -z $branch ]] && return
  [[ $branch == '(detached)' ]] && branch=HEAD

  REPLY="%F{$nord3} ${branch//\%/%%}%f"
  local changes=$conflicted$untracked$modified$staged$renamed$deleted ab_sym=
  if (( ahead && behind )); then ab_sym='⇕'
  elif (( ahead )); then ab_sym='⇡'
  elif (( behind )); then ab_sym='⇣'
  fi
  (( stash )) && ab_sym+='$'
  [[ -n $changes ]] && REPLY+="%F{$nord15}$changes%f"
  [[ -n $ab_sym ]] && REPLY+="%F{$nord8}$ab_sym%f"
}

function _prompt_venv() {
  REPLY=
  [[ -n $VIRTUAL_ENV ]] || return
  local name=${VIRTUAL_ENV:t} line
  if [[ -r $VIRTUAL_ENV/pyvenv.cfg ]]; then
    while IFS= read -r line; do
      [[ $line == prompt[[:space:]]#=* ]] && name=${${${line#*=}## #}//[\'\"]/}
    done < $VIRTUAL_ENV/pyvenv.cfg
  fi
  REPLY=" %F{$nord3}py:$name%f"
}

# Command duration, shown only from 2s on (e.g. 5s, 1m3s, 1h0m2s).
function _prompt_format_duration() {
  local -i secs=$1 d h m s
  REPLY=
  (( secs < 2 )) && return
  d=$(( secs / 86400 )) h=$(( secs % 86400 / 3600 )) m=$(( secs % 3600 / 60 )) s=$(( secs % 60 ))
  (( d )) && REPLY+="${d}d"
  (( d || h )) && REPLY+="${h}h"
  (( d || h || m )) && REPLY+="${m}m"
  REPLY="%F{$nord13}$REPLY${s}s%f"
}

function _prompt_render() {
  local char_color=$nord14
  (( _prompt_status != 0 )) && char_color=$nord11
  PROMPT=$'\n'"$_prompt_line1"$'\n'"%F{$char_color}❯%f "
}

function _prompt_preexec() {
  _prompt_start=$EPOCHREALTIME
}

function _prompt_precmd() {
  _prompt_status=$?

  _prompt_duration=
  if [[ -n $_prompt_start ]]; then
    _prompt_format_duration $(( EPOCHREALTIME - _prompt_start ))
    _prompt_duration=$REPLY
    _prompt_start=
  fi

  local _prompt_root left
  _prompt_git;  local git=$REPLY
  _prompt_dir "$_prompt_root"; left=$REPLY$git
  _prompt_venv; left+=$REPLY

  # Right-align the duration on the first line (starship's $fill).
  _prompt_line1=$left
  if [[ -n $_prompt_duration ]]; then
    local zero='%([BSUbfksu]|([FK]|){*})'
    local -i lw=${(m)#${(S%%)left//$~zero/}} rw=${(m)#${(S%%)_prompt_duration//$~zero/}}
    local -i pad=$(( COLUMNS - lw - rw ))
    (( pad < 1 )) && pad=1
    _prompt_line1+="${(l:pad:: :)}$_prompt_duration"
  fi

  RPROMPT=
  _prompt_render
}

# Transient prompt: runs when ENTER is pressed
function _prompt_transient() {
  [[ $CONTEXT == start ]] || return 0
  local char_color=$nord14
  (( _prompt_status != 0 )) && char_color=$nord11
  PROMPT="%B%F{$nord9}%~%f%b %F{$char_color}❯%f "
  RPROMPT=$_prompt_duration
  zle reset-prompt
}

# Non-interactive shells (e.g. the Claude Code statusline) only reuse the functions
[[ -o interactive ]] || return 0

add-zsh-hook preexec _prompt_preexec
add-zsh-hook precmd _prompt_precmd
add-zle-hook-widget zle-line-finish _prompt_transient
