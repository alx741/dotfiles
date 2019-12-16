setlocal makeprg=./gradlew
compiler gradle

"{{{ Color
hi! haskellDecl ctermfg=27
hi! haskellDeclKeyword ctermfg=30
hi! haskellIdentifier ctermfg=129
hi! haskellOperators ctermfg=black
hi! haskellType ctermfg=32
hi! def link haskellPragma Comment
hi! haskellNumber ctermfg=166
hi! haskellImportKeywords ctermfg=136
"}}}

"{{{ Mappings
" General
nnoremap <buffer><silent> g= :%!ktlint -a -F --stdin 2> /dev/null<CR>
nnoremap <buffer><silent> gjj :up<CR>:Dispatch -compiler=gradle make run<CR>
nnoremap <buffer><silent> gjj :up<CR>:echo "Type Checking..."<CR>:Dispatch -compiler=gradle ./gradlew build<CR>

" Arrows
inoremap <buffer><silent> ;; <space>-><space>
inoremap <buffer><silent> ;: <space>=><space>
inoremap <buffer><silent> :; <space><-<space>
"}}}

" vim:fdm=marker
