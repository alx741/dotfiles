" Mappings
nnoremap <buffer><silent> g= :call Format()<CR>:%!dartfmt<CR>
nnoremap <buffer><silent> gjj :up<CR>:FlutterHotRestart<CR>
" nnoremap <buffer><silent> gjb :up<CR>:Dispatch -compiler=gradle make run-device<CR>

" Arrows
inoremap <buffer><silent> ;; <space>-><space>
inoremap <buffer><silent> ;: <space>=><space>
inoremap <buffer><silent> :; <space><-<space>

nnoremap <buffer><silent> <c-]> :LSClientGoToDefinition<CR>
nnoremap <buffer><silent> zi :LSClientShowHover<CR>
