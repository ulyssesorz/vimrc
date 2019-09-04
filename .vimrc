set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
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
autocmd BufNewFile,BufRead * :TagbarOpen
nmap <F4> :TagbarToggle<CR>

" better_whitespace
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" YouComleteMe let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menu,menuone
map <c-]> :YcmCompleter GoToDefinition<CR>
"compatible with supertab
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" other
map <C-N> :bn<CR>
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
