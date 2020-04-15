" Mappings
nnoremap <buffer><silent> g= :call Format()<CR>:%!dartfmt<CR>
" nnoremap <buffer><silent> gjj :up<CR>:Dispatch -compiler=gradle make run<CR>
" nnoremap <buffer><silent> gjb :up<CR>:Dispatch -compiler=gradle make run-device<CR>

" Arrows
inoremap <buffer><silent> ;; <space>-><space>
inoremap <buffer><silent> ;: <space>=><space>
inoremap <buffer><silent> :; <space><-<space>
