setlocal foldmethod=marker
setlocal foldmarker={,}
inoremap :: <ESC>:call Php_make_var(1)<CR>
inoremap ;; <ESC>:call Php_make_var(0)<CR>

" Laravel
cnoreabbrev gm !php artisan generate:model
cnoreabbrev gc !php artisan generate:controller
cnoreabbrev gt !php artisan generate:test
cnoreabbrev gmig !php artisan generate:migration

" Emmet
imap hh <c-j>,

function! Php_make_var(static)
    if a:static
        exe "norm! mzBi$\<esc>`zla:: "
        exe "startinsert!"
    else
        exe "norm! mzBi$\<esc>`zla-> "
        exe "startinsert!"
    endif
endfunction
