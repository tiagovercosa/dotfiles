" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-css-color'
  Plug 'vimwiki/vimwiki'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree'                         
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'                          
  Plug 'vim-python/python-syntax'                        
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }    
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'mboughaba/i3config.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'arcticicestudio/nord'
  Plug 'lervag/vimtex'
  Plug 'dense-analysis/ale' " LaTeX Linting
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

source $HOME/.config/nvim/general/settings.vim

" VimWiki
let g:vimwiki_list = [{'path': '~/docs/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = ' ○◐●✗'

" Goyo
let g:goyo_width = 90

" Config i3
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Theme
if (has('termguicolors'))
  set termguicolors
endif

colorscheme nord

" let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_bold_vertical_split_line = 1
" let g:nord_uniform_diff_background = 1
" let g:nord_bold = 0
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1
 
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'nord'

" Always show tabs 
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" MAPPINGS
" =========================================================
" NERDTree
nnoremap <F3> :NERDTreeToggle <cr>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Fuzzy Search
nnoremap <C-f> :Files <cr>

" LaTeX bindings
nnoremap <Leader>c :VimtexCountWords<CR>
nnoremap <Leader>b :VimtexCompile<CR>
nnoremap <Leader>i :VimtexTocOpen<CR>
nnoremap <Leader>i :VimtexTocToggle<CR> \| <C-w>h
nnoremap <Leader>p :VimtexView<CR> 
nnoremap <Leader>x :VimtexClean<CR>
nnoremap <Leader>l :VimtexLabelsToggle<CR>

" nmap <Leader>wx <Plug>VimwikiIndex

" Execute texclear script when leaving .tex file
autocmd VimLeave *.tex !texclear %

" Compile the current file
nnoremap <m-c> :w! \| !compiler % <cr>

" Open the output file from the opened file
nnoremap <m-o> :!opout % <cr><cr>

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
