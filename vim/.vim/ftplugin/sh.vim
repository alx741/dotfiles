setlocal foldmethod=marker
setlocal foldmarker={,}
nnoremap <buffer><silent> g= :call Format()<CR>:%!shfmt<CR>
