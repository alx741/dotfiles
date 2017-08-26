setlocal foldmethod=marker
setlocal foldmarker={,}
nnoremap <buffer><silent> g<space> :call CssSortProperties()<CR>

function! CssSortProperties()
    exe "norm! vi{\<ESC>"
    exe "'<,'>sort"
endfunction
