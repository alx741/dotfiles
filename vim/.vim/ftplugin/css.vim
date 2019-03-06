setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal formatprg=prettier\ --parser\ css\ --tab-width\ 4
nnoremap <buffer><silent> gh :call CssSortProperties()<CR>
nnoremap <buffer> g= :call CSSFormat()<CR>

function! CssSortProperties()
    exe "norm! vi{\<ESC>"
    exe "'<,'>sort"
endfunction

function! CSSFormat()
    let l:winview = winsaveview()
    silent! execute 'norm! gggqG'
    call winrestview(l:winview)
endfunction
