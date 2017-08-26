setlocal foldmethod=indent
setlocal keywordprg=:h
setlocal makeprg=rake
nnoremap <buffer><silent> gk :up<CR> :! rake test<CR>
" Avoid CR mappings in .vim files
nnoremap <buffer> <CR> <CR>
