setlocal spell
setlocal spelllang=en
setlocal commentstring=<!--%s-->
nnoremap <buffer><silent> gh :call Md_create_header(1)<CR>
nnoremap <buffer><silent> gH :call Md_create_header(0)<CR>
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
