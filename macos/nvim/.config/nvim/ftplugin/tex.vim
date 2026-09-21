setlocal conceallevel=2

function! s:TexFocusVim() abort
  silent execute "!osascript -e 'tell application \"Ghostty\" to activate'"
endfunction

augroup vimtex_event_focus
    au!
    au User VimtexEventView call s:TexFocusVim()
augroup END

let s:undo = 'setlocal conceallevel<'
if exists('b:undo_ftplugin') && !empty(b:undo_ftplugin)
  let b:undo_ftplugin = b:undo_ftplugin . ' | ' . s:undo
else
  let b:undo_ftplugin = s:undo
endif
