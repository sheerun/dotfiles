" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    silent !pip install --user https://github.com/Lokaltog/powerline/tarball/develop
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.dotfiles/lib/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

Bundle 'vim-scripts/wombat256.vim'
Bundle 'christoomey/vim-space'
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
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rsi'
Bundle 'astashov/vim-ruby-debugger'
Bundle 'tpope/vim-sleuth'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'skalnik/vim-vroom'
Bundle 'vim-scripts/vimwiki'
Bundle 'milkypostman/vim-togglelist'
Bundle 'vim-scripts/scratch.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'mutewinter/tomdoc.vim'
Bundle 'jc00ke/vim-tomdoc'
Bundle 'mutewinter/nginx.vim'
Bundle 'timcharper/textile.vim'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'acustodioo/vim-tmux'
Bundle 'groenewege/vim-less'
Bundle 'mutewinter/vim-markdown'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-cucumber'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-scripts/SmartCase'
Bundle 'tpope/vim-scriptease'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/AutoComplPop'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall!
    :BundleClean
    :quit 
endif

source ~/.dotfiles/lib/powerline/powerline/bindings/vim/source_plugin.vim

filetype plugin indent on

