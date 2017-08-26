nnoremap <buffer><silent> [[ :call Help_tag(1)<CR>
nnoremap <buffer><silent> ]] :call Help_tag(0)<CR>

function! Help_tag(reverse)
    call search('|\S\+|', a:reverse ? 'bW' : 'W')
endfunction
