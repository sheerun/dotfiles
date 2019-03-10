let mapleader = "\<Space>"
let maplocalleader = ","

source ~/.plugrc

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/vitality.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Really nice prompt
let g:airline_extensions = []
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/vimproc.vim', { 'do' : 'make' }

Plug 'justinmk/vim-dirvish'
"
" " Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"
" Awesome autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --go-completer --js-completer', 'on': [] }
let g:YouCompleteMeLazyLoaded = 0
function! LazyLoadingYMC()
  if g:YouCompleteMeLazyLoaded == 0
    let g:YouCompleteMeLazyLoaded = 1
    call plug#load('YouCompleteMe') | call youcompleteme#Enable()
  endif
endfunction
autocmd BufWinEnter * call timer_start(1, {id->execute('call LazyLoadingYMC()')} )

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'

Plug 'fleischie/vim-styled-components'

" Allow to :Rename files
Plug 'danro/rename.vim'

"Plug 'flowtype/vim-flow'

" Automatically find root project directory
Plug 'airblade/vim-rooter'
let g:rooter_disable_map = 1
let g:rooter_silent_chdir = 1

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
" let g:go_fmt_command = "goimports"
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for': 'go' }

Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Nice column aligning with <Enter>
Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" ii / ai
Plug 'michaeljsmith/vim-indent-object'

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

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

nnoremap <Leader>o :FZF<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" Remove trailing whitespaces
nnoremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

nnoremap H 0
nnoremap L $

silent! colorscheme wombat256mod

set autoread 
au CursorHold * checktime

autocmd FileType java setlocal omnifunc=javacomplete#Complete
