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

# LS_COLORS: used by completion menus (list-colors) and eza
if command -v vivid >/dev/null 2>&1; then
  export LS_COLORS="$(vivid generate nord)"
fi

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$nord3"

# zsh-syntax-highlighting
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$nord11"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$nord9"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[function]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[command]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=$nord8"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$nord8,underline"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$nord9"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$nord9"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$nord4,underline"
ZSH_HIGHLIGHT_STYLES[path]="fg=$nord4,underline"
ZSH_HIGHLIGHT_STYLES[path_prefix]='underline'
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$nord15"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=$nord15"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$nord7"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$nord7"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$nord14"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$nord14"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$nord14"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$nord15"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$nord13"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$nord13"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$nord13"
ZSH_HIGHLIGHT_STYLES[assign]='none'
ZSH_HIGHLIGHT_STYLES[comment]="fg=$nord3_bright"
