#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

HISTFILE="$XDG_STATE_HOME/bash/history"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
