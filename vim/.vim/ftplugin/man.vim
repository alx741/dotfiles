" This is getting sources everywhere!!
" nnoremap <buffer><silent> [s :call Man_section(1)<CR>
" nnoremap <buffer><silent> ]s :call Man_section(0)<CR>
" nnoremap <buffer><silent> [[ :call Man_reference(1)<CR>
" nnoremap <buffer><silent> ]] :call Man_reference(0)<CR>
" nnoremap <buffer><nowait> d <C-d>
" nnoremap <buffer><nowait> u <C-u>
" nnoremap <buffer><nowait> f <C-f>
" nnoremap <buffer><nowait> b <C-b>
" nnoremap <buffer><nowait> e <C-e>
" nnoremap <buffer><nowait> y <C-y>
" nnoremap <buffer> q :q<CR>

function! Man_section(reverse)
    call search('\v\n\u+', a:reverse ? 'bW' : 'W')
    exe "norm! zt"
endfunction

function! Man_reference(reverse)
    call search('\C[a-z0-9]\+(\d)', a:reverse ? 'bW' : 'W')
endfunction
