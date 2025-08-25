set encoding=utf-8
set nocompatible " Use Vim defaults instead of 100% vi compatibility

" vim-plug
call plug#begin()

Plug 'github/copilot.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'prisma/vim-prisma'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on
syntax enable

" General
set autoread " Set to auto read when a file is changed from the outside
set regexpengine=0 " Automatic detection of the regexp engine to use

" Theme
colorscheme unokai

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
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_custom_ignore = {
"   \   'dir':  '\v[\/](\.git|node_modules)$',
"   \ }

" vim-gitgutter
set signcolumn=yes
set updatetime=300
highlight SignColumn      guibg=NONE    ctermbg=NONE
highlight GitGutterAdd    guifg=#37b24d ctermfg=2
highlight GitGutterChange guifg=#f59f00 ctermfg=3
highlight GitGutterDelete guifg=#f03e3e ctermfg=1

" Key mappings
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Do not yank with x
nnoremap x "_x

" coc.nvim
highlight CocSearch guifg=#5fd7d7 ctermfg=81
highlight CocHintFloat guifg=#5fd7d7 ctermfg=81

" Key mappings for completion
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" fzf.vim
let g:fzf_vim = {}

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<Space>
