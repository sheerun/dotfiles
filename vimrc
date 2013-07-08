set nocompatible
let mapleader = ","

set runtimepath+=~/.modules/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))


" Unobstructive plugins
NeoBundle 'sheerun/vimrc'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'christoomey/vim-space' " Maybe change to tab?
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'briandoll/change-inside-surroundings.vim' " <Leader>ci
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'AndrewRadev/splitjoin.vim' " sj and sk
NeoBundle 'scrooloose/syntastic' " ??
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'michaeljsmith/vim-indent-object' " ii / ai
NeoBundle 'edsono/vim-matchit'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'milkypostman/vim-togglelist' " <leader>q
NeoBundle 'AndrewRadev/switch.vim' " -
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/SmartCase'
NeoBundle 'vim-scripts/gitignore'
NeoBundle 'vim-scripts/UnconditionalPaste' " glp

NeoBundle 'benmills/vimux'
NeoBundle 'skalnik/vim-vroom'

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock' " var, vir

NeoBundle 'christoomey/vim-tmux-navigator'

" Possibly obstructive plugins
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/AutoTag' " can case problems
NeoBundle 'spolu/dwm.vim' " conflicting with multiline cursor
NeoBundle 'terryma/vim-multiple-cursors'

" Language packs
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'mutewinter/tomdoc.vim'
NeoBundle 'jc00ke/vim-tomdoc'
NeoBundle 'mutewinter/nginx.vim'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'mutewinter/vim-css3-syntax'
NeoBundle 'acustodioo/vim-tmux'
NeoBundle 'groenewege/vim-less'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'jrk/vim-ocaml'
NeoBundle 'wlangstroth/vim-haskell'
NeoBundle 'eagletmt/ghcmod-vim', { 'autoload' : { 'filetypes' : 'haskell' }}
NeoBundleLazy 'ujihisa/neco-ghc', { 'autoload' : { 'filetypes' : 'haskell' }}
NeoBundle 'slim-template/vim-slim'

filetype plugin indent on
NeoBundleCheck

" On OSX
vmap <D-c> "+y<CR>
nmap <D-v> "+p<CR>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nnoremap - :Switch<cr>

runtime! plugin/vimrc.vim
