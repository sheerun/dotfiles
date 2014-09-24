let mapleader = "\<Space>"

call vimrc#before()

set gfn=Menlo:h15

NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  \ }

NeoBundle 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

NeoBundle 'michaeljsmith/vim-indent-object' " ii / ai

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock' " var, vir

NeoBundle 'AndrewRadev/switch.vim'
nmap <Leader><Tab> :Switch<CR>

NeoBundle 'mileszs/ack.vim'

NeoBundle 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/SmartCase'
NeoBundle 'vim-scripts/gitignore'

NeoBundle 'airblade/vim-rooter'

NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh',
      \    },
      \ }

NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'Blackrush/vim-gocode'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mmozuras/vim-github-comment'
let g:github_user = 'sheerun'

NeoBundle 'benmills/vimux'
NeoBundle 'skalnik/vim-vroom'
let g:vroom_use_vimux = 1
let g:VimuxHeight = "40"

NeoBundle 'rking/pry-de', {'rtp': 'vim/'}

NeoBundle 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

NeoBundle 'tpope/vim-vinegar'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = '>'
let g:syntastic_warning_symbol = '>'
let g:syntastic_enable_balloons = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 2
let g:syntastic_enable_signs = 0

NeoBundle 'bitc/vim-hdevtools'
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

NeoBundle 'xuhdev/SingleCompile'
nmap <Leader>d :SCCompile<cr>
nmap <Leader>e :SCCompileRun<cr>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()


vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V

" I made that mistake too many times...
map q: :q

map <Leader>b :make<CR>

" Asesome 80-character limiter
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn guibg=#262626 ctermbg=235

set foldmethod=indent
set fillchars="fold: "

" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

call vimrc#after()

nnoremap <Leader>o :CtrlP<CR>
nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V

" Enable Spell Checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
