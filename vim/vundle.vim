set nocompatible
filetype off

function SetupBackupDirectories()
    if has("mac")
        silent !mkdir -p ~/Library/Vim/{swap,backup,undo}
    else
        silent !mkdir -p ~/.local/share/{swap,backup,undo}
    endif
endfunction

" Setting up Vundle - the vim plugin bundler
let vundle_just_installed = 0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    silent !pip install --user https://github.com/Lokaltog/powerline/tarball/develop
    call SetupBackupDirectories()
    let vundle_just_installed = 1
endif

set rtp+=~/.dotfiles/lib/vundle/
call vundle#rc()

" Plugin manager.
Bundle 'gmarik/vundle'

" Defaults everyone agrees on.
Bundle 'sheerun/vimrc'

" An awesome dark theme.
Bundle 'vim-scripts/wombat256.vim'

" Repeat motions using space key.
Bundle 'christoomey/vim-space'

" Edit only specific region of the file.
Bundle 'chrisbra/NrrwRgn'

" Zoom and restore window using `<Ctrl-w>o`.
Bundle 'vim-scripts/ZoomWin'

" Populate quicklist using ack search tool.
Bundle 'mileszs/ack.vim'

" `,ci` instead of `c{`, `c"`, etc.
Bundle 'briandoll/change-inside-surroundings.vim'

" Ctrl-p to go to any file. Enable index caching.
Bundle 'kien/ctrlp.vim'

" `,u` for undo tree.
Bundle 'sjl/gundo.vim'

" Better autocompletion system.
Bundle 'Shougo/neocomplcache'

Bundle 'scrooloose/nerdtree.git'
Bundle 'honza/snipmate-snippets'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
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
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-cucumber'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-scripts/SmartCase'
Bundle 'tpope/vim-scriptease'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/UnconditionalPaste'
Bundle 'vim-scripts/taglist.vim'
Bundle 'spolu/dwm.vim'
Bundle 'vim-scripts/gitignore'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'derekwyatt/vim-scala'
Bundle 'jrk/vim-ocaml'
Bundle 'Shougo/vimproc'
Bundle 'wlangstroth/vim-haskell'
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'slim-template/vim-slim'
Bundle 'skwp/vim-conque'
Bundle 'duff/vim-bufonly'
Bundle 'skwp/vim-ruby-conque'

if vundle_just_installed == 1
    echo "Installing Bundles, please ignore key map error messages"
    let g:vundle_default_git_proto = 'git'
    :BundleInstall
    :quit
endif
