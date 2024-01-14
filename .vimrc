set encoding=utf-8
set nocompatible " Use Vim defaults instead of 100% vi compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent on

syntax on

set wrap
set linebreak
set number " Show line numbers
set relativenumber " Show relative line numbers
set ruler " Show current position (row, column)

set history=1000

set undofile
set undodir=~/.vim/undo/ " The directory is required

set showcmd " Show commands right below 
set showmode " Show current mode (Default. The opposite is 'noshowmode')

set autoread " Set to auto read when a file is changed from the outside

" Turn backup off
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smarttab
set expandtab " Use spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Search
set hlsearch " Highlight serach results
set incsearch " Incremental search (Makes search act like search in modern browsers)

" Interface
set laststatus=2 " Always display the status line
set splitright " Open vertical splits to the right

" Netrw
let g:netrw_banner = 0 " Disable banner (Can be toggled with 'I' key)
let g:netrw_liststyle=3 " Tree style listing

" vim-polyglot
set re=0

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Remap keys
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
