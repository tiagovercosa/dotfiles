call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
Plug 'arcticicestudio/nord'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'                         
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'                          
Plug 'vim-python/python-syntax'                        
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }    
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
call plug#end()   

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = ' ○◐●✗'

" config Goyo plugin
let g:goyo_width = 90
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

filetype plugin on

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme nord
let g:material_terminal_italics = 1
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" NERDTree
nnoremap <F3> :NERDTreeToggle <cr>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

set mouse=a
set number
set relativenumber
set background=dark
set nocompatible
" set cursorline

nnoremap <c-p> :Files <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Use system clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Execute texclear script when leaving .tex file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimLeave *.tex !texclear %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compile the current file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-c> :w! \| !compiler % <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open the output file from the opened file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-o> :!opout % <cr><cr>

" set spell spelllang=pt

function! ToggleSpell()
    if &spell
        if &spelllang == "pt"
            set spelllang=en
            echo "toggle spell" &spelllang
        elseif &spelllang == "en"
            set spell!
            echo "toggle spell off"
        endif
    else
        set spelllang=pt
        set spell!
        echo "toggle spell" &spelllang
    endif
endfunction

hi SpellCap ctermfg=Black ctermbg=Blue
hi SpellBad ctermfg=Black ctermbg=DarkRed

map <F2> :call ToggleSpell()<CR>
