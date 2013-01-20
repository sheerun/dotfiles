set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.dotfiles/libs/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

Bundle 'vim-scripts/wombat256.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'vim-scripts/ZoomWin'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'briandoll/change-inside-surroundings.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdtree.git'
Bundle 'honza/snipmate-snippets'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'kchmck/vim-coffee-script'
Bundle 'flazz/vim-colorschemes'
Bundle 'nathanaelkane/vim-command-w.git'
Bundle 'tpope/vim-commentary'
Bundle 'ap/vim-css-color'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-haml'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rsi'
Bundle 'astashov/vim-ruby-debugger'
Bundle 'tpope/vim-sleuth'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'skalnik/vim-vroom'
Bundle 'vim-scripts/vimwiki'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall!
    :BundleClean
    :quit 
endif

filetype plugin indent on

" Use wombat256 as default color scheme.
colorscheme wombat256mod

set nowrap            " Do not wrap lines.
set hlsearch          " Highlight all matches on search.
set ignorecase        " Ignore case when searching.
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
set hidden
set noerrorbells
set visualbell
set nomodeline
set ttyfast

let mapleader = ","

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

let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This enables iterm cursor changes from vim. In .tmux.conf you'll need:
" set-option -g terminal-overrides '*88col*:colors=88,*256col*:colors=256,xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007:Cc=\E]12;%p1%s\007:Cr=\E]112\007:Cs=\E]50;CursorShape=%?%p1%{3}%<%t%{0}%e%p1%{2}%-%;%d\007'
"
" Source: https://github.com/Casecommons/casecommons_workstation/blob/master/templates/default/dot_tmux.conf.erb
"         https://github.com/Casecommons/vim-config/blob/master/init/tmux.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This fixes pasting from iterm (and some other terminals, but you'll need to
" adjust the condition) by using "bracketed paste mode"
" I modified it to work in tmux and not wait for esc (by using f28/f29)
"
" See: http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux wrapping borrowed from vitality.vim: https://github.com/sjl/vitality.vim
function WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
