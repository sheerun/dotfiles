let mapleader = "\<Space>"
let maplocalleader = ","

let remote = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if has('nvim')
  let local = $HOME.'/.local/share/nvim/site/autoload/plug.vim'
else
  let local = $HOME.'/.vim/autoload/plug.vim'
endif

if !filereadable(local)
  :silent execute '!curl --create-dirs -sfLo '.local.' '.remote
end"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

Plug 'sjl/vitality.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
      \   'right': [ [ 'gitbranch' ], [ 'filetype' ]]
      \ },
      \ 'component': {
      \   'filetype': '%{&filetype}'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
Plug 'sheerun/lightline.vim'

Plug 'justinmk/vim-dirvish'
"
" " Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Lightning fast :Ag searcher
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'

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

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" ii / ai
Plug 'michaeljsmith/vim-indent-object'

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" Better search tools
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

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

nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

nnoremap H 0
nnoremap L $

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" inoremap <silent><expr> <CR>
"   \ pumvisible() ? coc#_select_confirm() :
"   \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
