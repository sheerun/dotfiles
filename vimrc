let g:CoolTotalMatches = 1
let g:lightline = { 'colorscheme': 'ayu_dark' }

let remote = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if has('nvim')
  let local = $HOME.'/.local/share/nvim/site/autoload/plug.vim'
else
  let local = $HOME.'/.vim/autoload/plug.vim'
endif

if !filereadable(local)
  :silent execute '!curl --create-dirs -sfLo '.local.' '.remote
end


let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 40
let g:vimspector_bottombar_height = 5

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

Plug 'eliba2/vim-node-inspect'
Plug '~/.vim/plugged/vim-inspect'

" iTerm2 and tmux integration
Plug 'sjl/vitality.vim'
"Plug 'camspiers/lens.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ayu-theme/ayu-vim'

"Nice bottom panel
Plug 'itchyny/lightline.vim'

" File manager that open on '-'
Plug 'justinmk/vim-dirvish'

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Toggle comments with gcc
let g:tcomment_mapleader1 = '<C-c>'
Plug 'tomtom/tcomment_vim'

" Readline shortcuts (C-e etc.)
Plug 'tpope/vim-rsi'

" Automatically adds 'end' block to code
Plug 'cohama/lexima.vim'

" Integration with git
Plug 'tpope/vim-fugitive'

" Supports repeating plugin commands with . 
Plug 'tpope/vim-repeat'

" Various shortcuts like ]z for next quick list item
" Plug 'tpope/vim-unimpaired'

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

Plug 'tpope/vim-scriptease'

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" Better search tools
" Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_quickfix_open_command = 'cfirst'

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

Plug 'kristijanhusak/vim-js-file-import'

Plug 'rakr/vim-one'


Plug 'puremourning/vimspector'

call plug#end()

colorscheme ayu

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

func! s:CustomiseUI()
  " Remove winbar for code window
  call win_gotoid( g:vimspector_session_windows.code )
  nunmenu WinBar
  nnoremenu WinBar.x :call vimspector#Reset( { 'interactive': v:false } )<CR>
  nnoremenu WinBar.F4\ ⟲ :call vimspector#Restart()<CR>
  nnoremenu WinBar.F5\ ▶ :call vimspector#Continue()<CR>
  nnoremenu WinBar.F9\ ● :call vimspector#ToggleBreakpoint()<CR>
  nnoremenu WinBar.F10\ ↓  :call vimspector#StepOver()<CR>
  nnoremenu WinBar.F11\ → :call vimspector#StepInto()<CR>
  nnoremenu WinBar.F12\ ← :call vimspector#StepOut()<CR>

  " Create winbar for variables window
  call win_gotoid( g:vimspector_session_windows.variables )
  nunmenu WinBar

endfunction
augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call <SID>CustomiseUI()
augroup END

sign define vimspectorBP text=\ ●           texthl=WarningMsg
sign define vimspectorBPCond text=\ •       texthl=WarningMsg
sign define vimspectorBPDisabled text=\ ○   texthl=LineNr
sign define vimspectorPC text=\ »           texthl=String
sign define vimspectorPCBP text=\ »         texthl=String
sign define vimspectorCurrentThread text=>  texthl=String
sign define vimspectorCurrentFrame text=>   texthl=String

vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap <Leader>b :make<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <silent> <Leader><CR> :CocAction<CR>


" vnoremap <silent> i i`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`e
"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>
nnoremap <Leader>q :qa<CR>

nnoremap <C-a> 0
nnoremap <C-e> $

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction
nnoremap <silent><nowait><CR> :<C-u>call <SID>GoToDefinition()<CR>

nmap <silent> <F2> <Plug>(coc-rename)
nmap <silent> <Leader>f <Plug>(coc-fix-current)
nmap <silent><nowait>§  <Plug>(coc-codeaction-selected)<CR>
vmap <silent><nowait>§  <Plug>(coc-codeaction-selected)<CR>
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <silent> <Leader>= :call CocAction('format')<CR>:silent call CocAction('runCommand', 'editor.action.organizeImport')<CR>

map <silent> <C-j> :cnext<CR>
map <silent> <C-k> :cprev<CR>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd QuickfixCmdPost grep cfirst

au BufNewFile,BufRead *.x set ft=vlang
au BufWritePre *.go call CocAction('format')

" Show git commit that changed given line
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" Show map output in editable window
cnorea <expr> map getcmdtype() == ':' && getcmdline() ==# 'map'
    \ ? "new <bar> put=execute('map') <bar> set buftype=nofile bufhidden=delete"
    \ : 'map'

set shortmess+=F
