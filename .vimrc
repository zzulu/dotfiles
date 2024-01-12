set encoding=utf-8
set nocompatible " Use Vim defaults instead of 100% vi compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()

syntax on
filetype plugin on

set wrap
set linebreak
set number " Show line numbers
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

" About indentation
set autoindent
set smartindent
set smarttab
set expandtab " Use spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2

" About search
set hlsearch " Highlight serach results
set incsearch " Incremental search (Makes search act like search in modern browsers)

" About interface
set laststatus=2 " Always display the status line
