" for more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" expand selection with v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" comment with gcc
let g:tcomment_mapleader1 = '<C-c>'

" vim-rooter config
let g:rooter_disable_map = 1
let g:rooter_silent_chdir = 1

" expand or collapse code block
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

let g:cool_total_matches = 1

let $FZF_DEFAULT_COMMAND = 'git ls-files'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '25%' }
let g:fzf_preview_window = []

function! Ripgrep(query)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--multi', '--bind', 'enter:select-all+accept,change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, spec, 0)
endfunction

function! s:GetSelection()
  return getline('.')[col("'<")-1:col("'>")-1]
endfunction

nnoremap <Leader>o :FZF<CR>
vnoremap <Leader>/ :call Ripgrep(<SID>GetSelection())<CR>
nnoremap <Leader>/ :call Ripgrep("")<CR>
nnoremap <silent>Q :cclose<CR>

vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap <Leader>b :make<CR>
nnoremap <Leader><Tab> <C-^>


" vnoremap <silent> i i`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`e

nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>
nnoremap <Leader>q :qa<CR>

nnoremap <C-a> 0
nnoremap <C-e> $

map <silent> <C-j> :cnext<CR>
map <silent> <C-k> :cprev<CR>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd QuickfixCmdPost grep cfirst

" Show git commit that changed given line
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" Show map output in editable window
cnorea <expr> map getcmdtype() == ':' && getcmdline() ==# 'map'
    \ ? "new <bar> put=execute('map') <bar> set buftype=nofile bufhidden=delete"
    \ : 'map'

set shortmess+=F

if has("termguicolors") && &t_Co >= 256
  set background=dark
  colorscheme one
  au ColorScheme * hi! Normal ctermbg=DarkGray guibg=#222222
else
  hi! Visual cterm=reverse
  hi! VisualCursor cterm=reverse
endif

