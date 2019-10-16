setlocal spell
setlocal spelllang=en
setlocal fo+=tcql
setlocal comments+=n:>

nnoremap <buffer><space> 1z=
nnoremap <buffer><silent> <TAB> :call Next_field(0)<CR>
nnoremap <buffer><silent> [Z  :call Next_field(1)<CR>

let s:field = 0
function! Next_field(reverse)
    if a:reverse == 0
        if s:field < 5
            let s:field = s:field + 1
        else
            let s:field = 0
        endif
    else
        if s:field > 0
            let s:field = s:field - 1
        else
            let s:field = 5
        endif
    endif

    if s:field == 0
        silent exe "keepjumps /^To:/ | :noh | :norm $"
    elseif s:field == 1
        silent exe "keepjumps /^Cc:/ | :noh | :norm $"
    elseif s:field == 2
        silent exe "keepjumps /^Bcc:/ | :noh | :norm $"
    elseif s:field == 3
        silent exe "keepjumps /^Subject:/ | :noh | :norm $"
    elseif s:field == 4
        silent exe "keepjumps /^Reply-To:/ | :noh | :norm $"
    elseif s:field == 5
        silent exe "keepjumps /^Reply-To:/ | :noh | :norm j"
    endif

endfunction
