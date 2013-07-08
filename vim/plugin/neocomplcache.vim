let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list = 5
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_enable_auto_select = 1 

" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
  let g:neocomplcache_omni_patterns = {} 
endif 

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
