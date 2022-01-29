" Change leader key
let mapleader=","

" Set bg
set background=dark

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
 
" Set real colors
set termguicolors

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Enable syntax highlighting
syntax enable  

" Set relative line numbering
set number relativenumber

" Mouse scrolling
set mouse=nicr

" Use system clipboard
set clipboard=unnamedplus

"  Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile

set mouse=a
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo

set whichwrap+=<,>,[,],h,l
