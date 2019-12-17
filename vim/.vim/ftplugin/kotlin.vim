setlocal makeprg=./gradlew
<<<<<<< HEAD
compiler gradlew
=======
compiler gradle
>>>>>>> 97d67b61f281d099f7b60f7cd9a453da7ec9d139

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
<<<<<<< HEAD
=======
nnoremap <buffer><silent> gjj :up<CR>:Dispatch -compiler=gradle make run<CR>
>>>>>>> 97d67b61f281d099f7b60f7cd9a453da7ec9d139
nnoremap <buffer><silent> gjj :up<CR>:echo "Type Checking..."<CR>:Dispatch -compiler=gradle ./gradlew build<CR>

" Arrows
inoremap <buffer><silent> ;; <space>-><space>
inoremap <buffer><silent> ;: <space>=><space>
inoremap <buffer><silent> :; <space><-<space>
"}}}

" vim:fdm=marker
