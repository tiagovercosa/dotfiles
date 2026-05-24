setlocal conceallevel=2

" Use `<localleader>l` to trigger continuous compilation
nmap <localleader>l <Plug>(vimtex-compile)

" Use `<localleader>k` to trigger stop continuous compilation
nmap <localleader>k <Plug>(vimtex-stop)

" Use `<localleader>c` to trigger clean compilation files
nmap <localleader>c <Plug>(vimtex-clean)

" Use `<localleader>x` to trigger clean compilation files
nmap <localleader>C <Plug>(vimtex-clean-full)

" Define a custom shortcut to trigger VimtexView
nmap <localleader>v <plug>(vimtex-view)

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
	\ 'Underfull \\hbox',
  \ 'Overfull \\hbox',
  \ 'LaTeX Warning: .\+ float specifier changed to',
  \ 'LaTeX hooks Warning',
  \ 'Package siunitx Warning: Detected the "physics" package:',
  \ 'Package hyperref Warning: Token not allowed in a PDF string',
  \]


function! s:TexFocusVim() abort
  silent execute "!osascript -e 'tell application \"Ghostty\" to activate'"
endfunction

augroup vimtex_event_focus
    au!
    au User VimtexEventView call s:TexFocusVim()
augroup END

