" Use vim and disable vi defaults.
set nocompatible

" Use pathogen as package manager.
call pathogen#infect()

" Turn on filetype plugins (:help filetype-plugin)
filetype plugin indent on

" Enable syntax highlighting.
syntax enable          

" Use wombat256 as default color scheme.
colorscheme wombat256

" Set default encoding to UTF-8.
set encoding=utf-8    

" Backspace through everything in insert mode.
set backspace=indent,eol,start

set t_Co=256          " Use 256 color palette.
set nowrap            " Do not wrap lines.
set hlsearch          " Highlight all matches on search.
set incsearch         " Enable incremential search.
set ignorecase        " Ignore case when searching.
set smartcase         " Unless search contain capital letter.
set tabstop=2         " Indent using two spaces.
set backspace=2
set shiftwidth=2 
set ai                " Autoindent.
set ruler             " Show line and column number.
set number            " Show line numbers.
set expandtab         " Expand tabs to two spaces. 
set history=1000
set undolevels=1000
set title
set nobackup
set noswapfile
set autowrite         " Automatically save before commands like :next and :make
set showcmd
set hidden

let mapleader = ","

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open NERDTree by default.
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode = 2
let NERDTreeHijackNetrw = 1
