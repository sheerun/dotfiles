let mapleader = "\<Space>"
let maplocalleader = ","
let g:CoolTotalMatches = 1
let ayucolor="dark"
"set termguicolors
let g:lightline = { 'colorscheme': 'ayu_dark' }

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

" iTerm2 and tmux integration
Plug 'sjl/vitality.vim'

Plug '~/.fzf'

Plug 'ayu-theme/ayu-vim'

" Nice bottom panel
Plug 'itchyny/lightline.vim'
"
" Plug 'sheerun/night-and-day'

" File manager that open on '-'
Plug 'justinmk/vim-dirvish'

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <Leader>/ :Rg<Space>
Plug 'jremmen/vim-ripgrep'

" Toggle comments with gcc
let g:tcomment_mapleader1 = '<C-c>'
Plug 'tomtom/tcomment_vim'

" Readline shortcuts (C-e etc.)
Plug 'tpope/vim-rsi'

" Automatically adds 'end' block to code
Plug 'tpope/vim-endwise'

" Integration with git
Plug 'tpope/vim-fugitive'

" Supports repeating plugin commands with . 
Plug 'tpope/vim-repeat'

" Various shortcuts like ]q for next quick list item
" Plug 'tpope/vim-unimpaired'

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

" Use ii / ai for indenting
Plug 'michaeljsmith/vim-indent-object'

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" Better search tools
" Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" Auto disable search highlighting
Plug 'romainl/vim-cool'

Plug 'sbdchd/neoformat'

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
nnoremap <silent> p p`e

nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V

nnoremap H 0
nnoremap L $

map <silent> <C-j> :cnext<CR>
map <silent> <C-k> :cprev<CR>

colorscheme ayu

"au BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <CR> <Plug>(coc-definition)
nmap <silent> <Leader>r <Plug>(coc-references)
nmap <silent> f <Plug>(coc-fix-current)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
