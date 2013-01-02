" Make vim more useful.
set nocompatible

" Use pathogen package manager.
call pathogen#infect()

" Enable indentation autodetection.
filetype plugin indent on

syntax on          
set t_Co=256          " ensure we have full colors
set nowrap            " don't wrap lines
set hlsearch          " highlight search
set backspace=2       " adam stankiewicz
set shiftwidth=2      " the same but for special indents
set ai                " autoindent
set ruler             " information about line numbers
set number            " display line numbers
set expandtab         " expand tab to two spaces
set tabstop=2         " indent using two spaces
set mouse=a
set ignorecase
set smartcase
set incsearch
set history=1000
set undolevels=1000
set title
set nobackup
set noswapfile
colorscheme wombat256

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
xnoremap <expr> p (v:register ==# '"' ? '"+' : '') . 'p'
xnoremap <expr> P (v:register ==# '"' ? '"+' : '') . 'P'
nnoremap <expr> p (v:register ==# '"' ? '"+' : '') . 'p'
nnoremap <expr> P (v:register ==# '"' ? '"+' : '') . 'P'
