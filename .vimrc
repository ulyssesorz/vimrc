set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rust-lang/rust.vim'
Plugin 'ervandew/supertab'
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
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_c = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" tarbar
autocmd Vimenter * :TagbarOpen
nmap <F4> :TagbarToggle<CR>

" other
map <C-N> :bn<CR>
map <C-P> :bp<CR>
map <C-D> :bd<CR>
set shiftwidth=4 
set tabstop=4
set expandtab
set number
set incsearch
set hlsearch
map <F2> :set nu!<CR>
set hidden
set fileencodings=utf8
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>
map <c-p> :edit <c-z>
