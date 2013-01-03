" Make vim more useful.
set nocompatible

" Use pathogen package manager.
call pathogen#infect()

" Enable indentation autodetection.
filetype plugin indent on

syntax on          
colorscheme wombat256
set t_Co=256          " ensure we have full colors
set nowrap            " don't wrap lines
set hlsearch          " highlight search
set tabstop=2         " indent using two spaces
set backspace=2
set shiftwidth=2 
set ai                " autoindent
set ruler             " information about line numbers
set number            " display line numbers
set expandtab         " expand tab to two spaces
set ignorecase
set smartcase
set incsearch
set history=1000
set undolevels=1000
set title
set nobackup
set noswapfile

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

cmap w!! w !sudo tee % >/dev/null
