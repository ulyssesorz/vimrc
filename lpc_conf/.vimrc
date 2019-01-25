set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'taglist.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()            " required
filetype plugin indent on    " required

" aireline
let g:airline_theme='simple'
set t_Co=256
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" taglist
set ut=1000 
let g:Tlist_Show_One_File=1 
let g:Tlist_Auto_Open=1
let g:Tlist_Auto_Update=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Use_SingleClick=1
let g:Tlist_Compact_Format=1
let g:Tlist_Ctags_Cmd = "/usr/local/bin/exctags" 
let g:Tlist_WinWidth = 35
set tags=./tags,../tags,./**/tags  
set tags+=~/.vim/systags
set tags=tags;
nmap <silent> <F4>  :TlistToggle<CR> 

" lpc
set autowrite
nmap <F5> <ESC>:!lpc_compile %<CR>
nmap <F6> <ESC>:!lpc_update %<CR>
nmap <F10> <ESC>:!lpc_test %  


" other
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-N> :bn<CR>
map <C-P> :bp<CR>
map <C-D> :bd<CR>
set shiftwidth=4 
set tabstop=4
set expandtab
set number
set hlsearch
set incsearch
set ignorecase
nmap <F2> :set nu!<CR>
set so=3
set hidden
set fileencodings=utf8,gbk
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>
noremap <c-p> :edit <c-z>

