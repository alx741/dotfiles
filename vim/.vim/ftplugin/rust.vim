setlocal makeprg=cargo
nnoremap <buffer><silent> gj :w<CR>:Neomake<CR>
nnoremap <buffer><silent> gk :w<CR>:Dispatch test<CR>
nnoremap <buffer><silent> gs :w<CR>
inoremap <buffer><silent> ;: <ESC>:call Make_arrow(0)<CR>
inoremap <buffer><silent> ;; <ESC>:call Make_arrow(1)<CR>
