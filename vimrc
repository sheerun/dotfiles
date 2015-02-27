let mapleader = "\<Space>"
let maplocalleader = ","

source ~/.plugrc

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/vitality.vim'
Plug 'kien/ctrlp.vim'

" Really nice prompt
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

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

" Ruby extensions
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }
" var, vir
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

Plug 'tpope/vim-commentary'
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

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>


" Plug 'JuliaLang/julia-vim', { 'for': 'julia' }
Plug 'jnwhiteh/vim-golang', { 'for': 'go' }
Plug 'Blackrush/vim-gocode', { 'for': 'go' }
Plug 'moll/vim-node', { 'for': 'node' }

Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

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

" I need to revisit those plugins before enabling:
" Plug 'tpope/vim-projectionist'
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<C-j>"
" let g:UltiSnipsJumpForwardTrigger="<C-j>"
" let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" Plug 'honza/vim-snippets'
" Plug 'xuhdev/SingleCompile'
" nmap <Leader>d :SCCompile<cr>
" nmap <Leader>e :SCCompileRun<cr>
" Vim flow caused some issues with parsing last time
" Plug 'facebook/vim-flow'
" Plug 'vim-scripts/SyntaxRange'
" Plug 'rking/pry-de', { 'rtp': 'vim' }
" Plug 'AndrewRadev/switch.vim'
" nmap <Leader><Tab> :Switch<CR>

Plug 'michaeljsmith/vim-indent-object' " ii / ai

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

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPBuffer<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


nnoremap <Leader>o :CtrlP<CR>
nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" Remove trailing whitespaces
nnoremap <silent> <Leader><BS> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

nnoremap H 0
nnoremap L $

" Enable Spell Checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
