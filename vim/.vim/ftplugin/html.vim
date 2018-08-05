nnoremap <buffer><silent> gO :call Firefox_open()<CR>
" Emmet
" imap hh <c-j>,

function! Firefox_open()
    let s:html_file = expand('%:p')
    exe "silent !firefox " . s:html_file
    exe "silent redraw!"
endfunction
