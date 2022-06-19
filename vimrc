call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()   }   }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'fatih/vim-go'
Plug 'ntpeters/vim-better-whitespace'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'voldikss/vim-floaterm'
Plug 'bfrg/vim-cpp-modern'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:coc_global_extensions = ['coc-snippets', 'coc-pyright', 'coc-go', 'coc-json', 'coc-lists', 'coc-cmake', 'coc-sh', 'coc-markdownlint', 'coc-pairs', 'coc-clangd', 'coc-git', 'coc-tsserver', 'coc-markdown-preview-enhanced', 'coc-webview']

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> go <C-o>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" mappings
nnoremap <silent><nowait> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent><nowait> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent><nowait> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent><nowait> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent><nowait> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent><nowait> <space>s       :<C-u>CocCommand clangd.switchSourceHeader<CR>
nnoremap <silent><nowait> <space>j       :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k       :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p       :<C-u>CocFzfListResume<CR>

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" fzf
let g:fzf_command_prefix = 'Fzf'
command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, '--word-regexp', fzf#vim#with_preview(), <bang>0)
nnoremap <silent> <space>f :FzfFiles<CR>
nnoremap <silent> <space>a :exe 'FzfAg '.expand('<cword>') <CR>
nnoremap <silent> <space>b :FzfBuffers <CR>

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

" vim-better-whitespace
let g:better_whitespace_enabled=1

" asynctasks
let g:asynctasks_term_pos = 'floaterm_reuse'
let g:asynctasks_term_rows = 10
let g:asynctasks_term_reuse = 1
let g:asynctasks_term_hidden = 1
noremap <silent><F4> :AsyncTask tmake<cr>
noremap <silent><F5> :AsyncTask tcc<cr>
noremap <silent><F9> :AsyncTask tcc_transfer<cr>
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']

let g:floaterm_keymap_toggle = '<F6>'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_opener = 'edit'
hi Floaterm guibg=black
hi FloatermBorder guibg=orange guifg=cyan
autocmd TermOpen * setlocal nonumber norelativenumber

" vim-cpp-modern
let g:cpp_attributes_highlight = 1
let g:cpp_simple_highlight = 1

" clang-format
autocmd FileType bzl command! -nargs=0 Format :silent !buildifier %

" rainbow_parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END
" List of colors that you do not want. ANSI code or #RRGGBB
" let g:rainbow#blacklist = [233, 234]

" colorscheme
let g:codedark_term256=1
set t_ut=
colorscheme codedark
let g:airline_theme = 'codedark'

inoremap jj <Esc>`^
nnoremap gn :bnext<CR>
nnoremap gp :bprev<CR>
set number
set mouse=a
set smartindent
set autowrite
set shiftwidth=4
set tabstop=4
set expandtab
set incsearch
set hlsearch
set fileencodings=utf8,gbk
set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-Z>
set backspace=indent,eol,start
set clipboard+=unnamedplus
set foldmethod=syntax
set foldlevelstart=99
