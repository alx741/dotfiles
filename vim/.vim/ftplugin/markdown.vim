setlocal spell
setlocal spelllang=en
setlocal commentstring=<!--%s-->
nnoremap <buffer><silent> gh :call Md_create_header(1)<CR>
nnoremap <buffer><silent> gH :call Md_create_header(0)<CR>
nnoremap <buffer><silent> gD :call Md_create_spanish_date_header()<CR>
nnoremap <buffer><silent> gJ :call Md_create_journal_template()<CR>
nnoremap <buffer><silent> ]] :call Next_header(0)<CR>
nnoremap <buffer><silent> [[ :call Next_header(1)<CR>
nnoremap <buffer><silent> gO :call PDF_open()<CR>

function! PDF_open()
    let s:md_file = expand('%:p:r')
    exe "silent !zathura " . s:md_file . ".pdf"
    exe "silent redraw!"
endfunction

function! Next_header(invert)
    if a:invert == 0
        exe "norm! /\\v^[#-]+\<cr>\<esc>"
    else
        exe "norm! ?\\v^[#-]+\<cr>\<esc>"
    endif
    exe "norm! ztkj"
endfunction

function! Md_create_header(header)
    if a:header
        exe "norm! 0"
        if (getline(".")[col(".")-1] ==? "#")
            exe "norm! I#\<esc>"
        else
            exe "norm! I# \<esc>"
        endif
    else
        exe "norm! 0"
        if (getline(".")[col(".")] ==? " ")
            exe "norm! 2x"
        elseif (getline(".")[col(".")-1] ==? "#")
            exe "norm! x"
        endif
    endif
endfunction

function! Md_create_date_header()
    exe 'r!date "+\%A, \%B \%d"'
    exe "norm! I# \<esc>$"
endfunction

function! Md_create_spanish_date_header()
    exe 'r!LANG=es_EC.UTF8 date "+\%A, \%B \%d"'
    exe "norm! I# \<esc>W~W~$"
endfunction

function! Md_create_journal_template()
    exe "norm! o"
    call Md_create_spanish_date_header()
    exe "norm! o"
    exe "r $HOME/.sec/journal_template_1"
    exe "norm! $"
endfunction
