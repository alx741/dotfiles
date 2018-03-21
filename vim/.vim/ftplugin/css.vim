setlocal foldmethod=marker
setlocal foldmarker={,}
nnoremap <buffer><silent> gh :call CssSortProperties()<CR>

function! CssSortProperties()
    exe "norm! vi{\<ESC>"
    exe "'<,'>sort"
endfunction
