let mapleader = "\<space>"
call vimrc#before()

set gfn=Menlo:h15

match ErrorMsg /\%>80v.\+/

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'michaeljsmith/vim-indent-object' " ii / ai

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock' " var, vir

NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'

NeoBundle 'AndrewRadev/splitjoin.vim' " sj and sk

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'

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

NeoBundle 'mikewest/vimroom'

let g:vroom_use_vimux = 1
let g:VimuxHeight = "40"

NeoBundle 'benmills/vimux'
NeoBundle 'skalnik/vim-vroom'
nnoremap <silent> <Leader>o <Plug>VimroomToggle

NeoBundle 'rking/pry-de', {'rtp': 'vim/'}

" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

nnoremap <silent> = V`]=

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap - :Switch<cr>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit `ctrl-p`)
map <Leader>o :CtrlP<CR>
map <Leader>O :CtrlP %%<CR>

" Jump to a method
map <Leader>/ :CloseSingleConque<CR>:CtrlPBufTag<CR>

vmap <Leader>y "+y
nmap <Leader>p "+p`[v`]=
nmap <Leader>P "+P`[v`]=
vmap <Leader>p "+p`[v`]=
vmap <Leader>P "+P`[v`]=

nmap <Leader><Leader> V
nmap <Leader>j Vj
nmap <Leader>k Vk

nmap J Vj
nmap K Vk
nmap L vl
nmap H vh
vmap J j
vmap K k
vmap H h
vmap L l


nnoremap <CR> :YcmCompleter GoToDefinitionElseDeclaration<CR>

call vimrc#after()
