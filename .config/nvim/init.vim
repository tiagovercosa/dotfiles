""" Options
syntax enable 			    " Use syntax highlighting
filetype plugin indent on 	" Detection, plugin and indent by filetype
set mouse=a                 " Allow the mouse to be used in neovim
set scrolloff=8             " Is one of my fav
set background=dark 		" Dark or light
set clipboard=unnamedplus 	" Use system clipboard
set path+=** 			    " Searches current directory recursively
set laststatus=2 		    " Always show statusline
set shiftwidth=4 		    " Number of spaces used for each step of indent
set tabstop=4 			    " Number of spaces a Tab in the text stands for
set expandtab 			    " Use spaces instead of tabs
set smarttab 			    " Tab in an indent inserts shiftwidth spaces
set noshowmode 			    " Prevent repeated mode below statusline
set termguicolors 		    " Use GUI colors for the terminal
set number relativenumber 	" Use relative numbers
set splitbelow splitright 	" New window is ut below or right of the current one
set wildmenu 			    " Display all matches when tab complete
set incsearch 			    " Perform incremental search
set nobackup 			    " Discard use of backup files
set noswapfile 			    " Discard use of swap files
set cursorline 			    " Highlight current line
set ignorecase              " ignore case in search patterns
set laststatus=2            " Always display the status line
set whichwrap+=<,>,[,],h,l
set showtabline=2           " always show tabs

""" Plugins
call plug#begin('~/.local/share/nvim/site/plugins')
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}      " Catppuccin theme
    Plug 'chrisbra/Colorizer'                         " Color previews
    Plug 'itchyny/lightline.vim'                      " Lightline Status Bar
    Plug 'tpope/vim-surround'                         " Change surrounding marks
    Plug 'vimwiki/vimwiki'                            " Personal Wiki in Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Completion and LSP support
    Plug 'honza/vim-snippets'                         " Snippet files
    "Plug 'jalvesaq/Nvim-R'                            " R code in Vim
    "Plug 'jalvesaq/vimcmdline'                        " Send lines to interpreter
call plug#end()

""" Settings
let maplocalleader = ","                " Set local leader
let mapleader =";"                      " Set global leader
" let R_assign_map = "__" " Nvim-R -> Press -- to have Nvim-R insert the assignment operator: <-
" let R_objbr_opendf = 0 " Nvim-R -> Don't expand a dataframe to show columns by default
" let rout_follow_colorscheme = 1 " Nvim-R -> Use terminal colorscheme in R output
" let r_indent_align_args = 0 " ft-r-indent -> Do not align arguments
" let r_indent_ess_comments = 0 " ft-r-indent -> Do not comment like ESS
" let r_indent_ess_compatible = 0 " ft-r-indent -> Do not make ESS compatible
" let cmdline_follow_colorscheme = 1 " vimcmdline -> Interpreter follows terminal colorscheme
" let cmdline_app = {} " vimcmdline -> Create dictionary for new interpreters
" let cmdline_app['sh'] = 'bash' " vimcmdline -> Use bash as sh interpreter
" let cmdline_app['python'] = 'ipython' " vimcmdline -> Use bash as sh interpreter
colorscheme catppuccin                  " Set color palette
let g:lightline = { 'colorscheme': 'catppuccin' }
let g:vimwiki_list = [{'path': '~/documents/repos/mywiki', 'syntax': 'markdown',
            \ 'ext': '.md', 'path_html': '~/document/repos/mywiki/html_path'}] " vimwiki -> Change paths
let g:vimwiki_global_ext = 0            " vimwiki -> Don't overwrite md files' filetype to vimwiki
let g:vimwiki_listsyms = ' ○◐●✗'

""" Remaps
" Compile documents from multiple formats
map <C-c> :w! \| !compiler <c-r>%<CR>
" Show output from given file
map <C-o> :!opout <c-r>%<CR><CR>

" coc.nvim ->
" Use <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" Use <Tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Normal Mode
nmap <Leader>l :CocAction<CR>

" move among buffers with Shift
nmap <S-n> :vnew<CR>
nmap <S-d> :bdelete<CR>
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>

" Better window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
   
nmap <C-n> :tabnew<CR>
nmap <C-Left> :tabn<CR>
nmap <C-Right> :tabp<CR>
