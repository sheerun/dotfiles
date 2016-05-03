let mapleader = "\<Space>"
let maplocalleader = ","

let g:python_host_skip_check=1
let g:loaded_python3_provider=1
let g:targets_aiAI = 'aIAi'

source ~/.plugrc

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/vitality.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'grassdog/tagman.vim'
" Really nice prompt
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Awesome autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

" Ruby extensions
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }
" var, vir
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'

" Allow to :Rename files
Plug 'danro/rename.vim'

" Automatically find root project directory
Plug 'airblade/vim-rooter'
let g:rooter_disable_map = 1
let g:rooter_silent_chdir = 1

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>


" Plug 'JuliaLang/julia-vim', { 'for': 'julia' }
Plug 'jnwhiteh/vim-golang', { 'for': 'go' }
Plug 'Blackrush/vim-gocode', { 'for': 'go' }
Plug 'moll/vim-node', { 'for': 'javascript' }

Plug 'derekelkins/agda-vim', { 'for': 'agda' }
imap <buffer> \forall ∀
imap <buffer> \to →
imap <buffer> \lambda λ
imap <buffer> \Sigma Σ
imap <buffer> \exists ∃
imap <buffer> \equiv ≡
imap <buffer> \then ⇒
imap <buffer> \N ℕ

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Run ruby tests with vimux
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-dispatch'
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_use_binstubs = 1
let g:vroom_use_colors = 0
let g:vroom_rspec_version = "3.x"
let g:VimuxHeight = "40"

" Nice column aligning with <Enter>
Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" ii / ai
Plug 'michaeljsmith/vim-indent-object'

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" Nice file browsing with -
Plug 'eiginn/netrw'
let g:netrw_altfile = 1
Plug 'tpope/vim-vinegar'

" Set nice 80-characters limiter
" execute "set colorcolumn=" . join(range(81,335), ',')
" hi ColorColumn guibg=#262626 ctermbg=235

" Allow for adding github comments
Plug 'mattn/webapi-vim'
Plug 'moznion/github-commit-comment.vim'
command! -nargs=* Comment call github_commit_comment#comment_line(<f-args>)

" Better search tools
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'
Plug 'vim-scripts/gitignore'

Plug 'junegunn/goyo.vim'

call plug#end()

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap <Leader>b :make<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>y :!annotate expand('%:p') " what?

nnoremap <Leader>o :FZF<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :Sayonara<CR>
nnoremap <Leader>c :Sayonara!<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" Remove trailing whitespaces
nnoremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

nnoremap H 0
nnoremap L $

silent! colorscheme wombat256mod

command! -bar Tags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ })
