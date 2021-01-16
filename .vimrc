set encoding=utf-8

syntax on

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

filetype plugin on
