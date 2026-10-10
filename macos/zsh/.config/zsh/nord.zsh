# Nord palette shared by the shell and CLI tools.
# https://www.nordtheme.com/docs/colors-and-palettes
# Must be sourced before plugins.zsh and fzf.zsh, which read these variables.

# Polar Night
nord0='#2E3440'
nord1='#3B4252'
nord2='#434C5E'
nord3='#4C566A'
nord3_bright='#616E88'  # Comments (same as nord-vim)
# Snow Storm
nord4='#D8DEE9'
nord5='#E5E9F0'
nord6='#ECEFF4'
# Frost
nord7='#8FBCBB'
nord8='#88C0D0'
nord9='#81A1C1'
nord10='#5E81AC'
# Aurora
nord11='#BF616A'  # red
nord12='#D08770'  # orange
nord13='#EBCB8B'  # yellow
nord14='#A3BE8C'  # green
nord15='#B48EAD'  # purple

# bat (also used by MANPAGER and the fzf previews)
export BAT_THEME='Nord'

# LS_COLORS: used by completion menus (list-colors) and fd.
# eza ignores it (see aliases.zsh) and uses ~/.config/eza/theme.yml.
if command -v vivid >/dev/null 2>&1; then
  export LS_COLORS="$(vivid generate nord)"
fi

# deja
export DEJA_HIGHLIGHT_STYLE="fg=$nord3"

# fast-syntax-highlighting
# Set before the plugin loads: its built-in theme only fills styles that are
# still unset. A theme picked with `fast-theme` would override these.
typeset -gA FAST_HIGHLIGHT_STYLES
FAST_HIGHLIGHT_STYLES[default]='none'
FAST_HIGHLIGHT_STYLES[unknown-token]="fg=$nord11"
FAST_HIGHLIGHT_STYLES[reserved-word]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[subcommand]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[alias]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[suffix-alias]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[global-alias]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[builtin]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[function]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[command]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[hashed-command]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[precommand]="fg=$nord8,underline"
FAST_HIGHLIGHT_STYLES[commandseparator]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[redirection]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[exec-descriptor]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[path]="fg=$nord4,underline"
FAST_HIGHLIGHT_STYLES[path-to-dir]="fg=$nord4,underline"
FAST_HIGHLIGHT_STYLES[path_pathseparator]=''
FAST_HIGHLIGHT_STYLES[globbing]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[globbing-ext]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[history-expansion]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$nord7"
FAST_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$nord7"
FAST_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$nord14"
FAST_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$nord14"
FAST_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$nord14"
FAST_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[back-or-dollar-double-quoted-argument]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[assign]='none'
FAST_HIGHLIGHT_STYLES[assign-array-bracket]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[variable]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[comment]="fg=$nord3_bright"
FAST_HIGHLIGHT_STYLES[mathvar]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[mathnum]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[matherr]="fg=$nord11"
FAST_HIGHLIGHT_STYLES[for-loop-variable]='none'
FAST_HIGHLIGHT_STYLES[for-loop-operator]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[for-loop-number]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[for-loop-separator]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[here-string-tri]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[here-string-text]="fg=$nord14"
FAST_HIGHLIGHT_STYLES[here-string-var]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[case-input]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[case-parentheses]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[case-condition]="fg=$nord14"
FAST_HIGHLIGHT_STYLES[paired-bracket]="bg=$nord2"
FAST_HIGHLIGHT_STYLES[bracket-level-1]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[bracket-level-2]="fg=$nord15"
FAST_HIGHLIGHT_STYLES[bracket-level-3]="fg=$nord13"
FAST_HIGHLIGHT_STYLES[single-sq-bracket]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[double-sq-bracket]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[double-paren]="fg=$nord9"
FAST_HIGHLIGHT_STYLES[correct-subtle]="fg=$nord8"
FAST_HIGHLIGHT_STYLES[incorrect-subtle]="fg=$nord11"
FAST_HIGHLIGHT_STYLES[subtle-separator]="fg=$nord3_bright"
FAST_HIGHLIGHT_STYLES[subtle-bg]="bg=$nord1"
