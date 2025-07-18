set encoding=utf-8
set nocompatible " Use Vim defaults instead of 100% vi compatibility

" vim-plug
call plug#begin()

Plug 'github/copilot.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'prisma/vim-prisma'

call plug#end()

filetype plugin indent on
syntax enable

" General
set autoread " Set to auto read when a file is changed from the outside
set regexpengine=0 " Automatic detection of the regexp engine to use

" Editor
set backspace=indent,eol,start " Make backspace behave like every other editor

set autoindent
set smartindent
set smarttab
set expandtab " Use spaces instead of tabs

set shiftwidth=2
set softtabstop=2
set tabstop=2

" Interface
set number " Show line numbers
set relativenumber " Show relative line numbers
set nowrap " Do not wrap lines

set ruler " Show current position (row, column)
set showcmd " Show commands right below
set showmode " Show current mode (Default. The opposite is 'noshowmode')
set laststatus=2 " Always display the status line
set splitright " Open vertical splits to the right

" Search
set hlsearch " Highlight serach results
set incsearch " Incremental search (Makes search act like search in modern browsers)

" History, Undo, Swap, Backup
set history=1000
set undofile
set undodir=~/.vim/undo/ " The directory is required
set directory=~/.vim/swap/ " The directory is required
set backupdir=~/.vim/backup/ " The directory is required

" Netrw
let g:netrw_banner = 0 " Disable banner (Can be toggled with 'I' key)

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \   'dir':  '\v[\/](\.git|node_modules)$',
  \ }

" vim-gitgutter
set signcolumn=yes
set updatetime=100
highlight SignColumn      guibg=NONE    ctermbg=NONE
highlight GitGutterAdd    guifg=#37b24d ctermfg=2
highlight GitGutterChange guifg=#f59f00 ctermfg=3
highlight GitGutterDelete guifg=#f03e3e ctermfg=1

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ }

" Key mappings
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Do not yank with x
nnoremap x "_x
