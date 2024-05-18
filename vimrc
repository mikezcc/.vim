" Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

call plug#end()

" Display
syntax on
set mouse=a
set number
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" Search
set hlsearch
set ignorecase
set smartcase

" Tab
set tabstop	    =4
set softtabstop =4
set shiftwidth	=4
set textwidth	=79

set showmatch

" Color
if !has('gui_running')
	set t_Co=256
endif
set termguicolors
colorscheme dejavu

" Backup
set autoread
set nobackup
set noswapfile
set encoding	=utf8
set belloff		=all
