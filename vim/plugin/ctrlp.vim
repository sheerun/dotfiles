" Use cache and don't clear it on exit
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Make index creating faster by using git ls-files command
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit `ctrl-p`)
map <Leader>f :CtrlP<CR>
map <Leader>F :CtrlP %%<CR>

" Additional mapping for buffer search
map <Leader>gb :CtrlPBuffer<CR>
map <Leader>gm :CtrlP app/models<CR>
map <Leader>gc :CtrlP app/controllers<CR>
map <Leader>gv :CtrlP app/views<CR>
map <Leader>gh :CtrlP app/helpers<CR>
map <Leader>gl :CtrlP lib<CR>
map <Leader>gp :CtrlP public<CR>
map <Leader>gs :CtrlP spec<CR>
map <Leader>gd :CtrlP db<CR>
map <Leader>gC :CtrlP config<CR>
map <Leader>gV :CtrlP vendor<CR>
map <Leader>gF :CtrlP factories<CR>
map <Leader>gT :CtrlP test<CR>

" <Leader>m - jump to a method (tag in current file)
map <Leader>m :CloseSingleConque<CR>:CtrlPBufTag<CR>
