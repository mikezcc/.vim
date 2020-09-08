
syntax on
filetype plugin indent on

"Information on the following setting can be found with
":help set
"
" Indent Options
set tabstop=4
set expandtab
set autoindent
set smartindent
set smarttab
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set backspace=indent,eol,start

" Status Line
set number
set ruler
set statusline=2
set laststatus=2

" Color Scheme
colorscheme dejavu
set background=dark

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" Misc
set autoread
set nobackup
set noswapfile
set encoding=utf8
set belloff=all
set scrolloff=5
set hidden

" Plugin Manager

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

call plug#end()

" Key Bindings
inoremap ^[w <Esc>:w<CR>
" NERDTree
nnoremap <F4> :NERDTreeToggle<CR>
" Rainbow
let g:rainbow_active=1
if !has('gui_running')
    set t_Co=256
endif
" FZF
nnoremap ^[b :Buffers<CR>
nnoremap ^[e :Files<CR>
let g:fzf_layout = {'up' : '~40%'}
" Ale
let g:ale_linters = {
\   'python' : ['flake8'],
\   'cpp'    : [],
\}
let g:ale_fixers = {
\   '*'     : ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black']
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
nnoremap ^L :ALEToggleBuffer<CR>
" Ale LightLine
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = {
\   'right': [
\       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\       [ 'lineinfo' ],
\       [ 'percent'  ],
\       [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\}
" Fugitive
nnoremap ^[d :Gdiff<CR>
" Terminal
nnoremap ^[v :bo term<CR>
" Tag
nnoremap <F11> g<C-]>
nnoremap ^[8 <C-t>
" Uncomment below to make screen not flash on error
" set vb t_vb=""
