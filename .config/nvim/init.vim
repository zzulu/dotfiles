" vim-plug
call plug#begin()

" Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prisma/vim-prisma'

call plug#end()

" General
set number
set relativenumber
set undofile

set nowrap
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set splitright

" Turn backup off
set noswapfile
set nobackup
set nowritebackup

" Netrw
let g:netrw_banner = 0

" ctrlp.vim
let g:ctrlp_user_command = [
  \   '.git',
  \   'cd %s && git ls-files -co --exclude-standard',
  \   'find %s -type f',
  \ ]
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
