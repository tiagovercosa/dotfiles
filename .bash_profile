#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

HISTFILE="$XDG_STATE_HOME/bash/history"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
