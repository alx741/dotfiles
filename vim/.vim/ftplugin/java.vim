setlocal makeprg=gradle
setlocal foldlevel=2
setlocal foldlevelstart=1
setlocal foldnestmax=2
nnoremap <buffer><silent> g<space> :call Getter_and_setter()<CR>

function! Getter_and_setter()
    exe "norm! f="
    if (getline(".")[col(".")-1] ==? "=")
        exe "norm! 0ww\"tyiWW\"vyiW"
    else
        exe "norm! 0ww\"tyiWW\"vyt;"
    endif

    exe "norm! O\<esc>j"
    exe "norm! 0C\<tab>public \<esc>\"tpa get\<esc>\"vp"
    exe "norm! Blll~A()\<cr>{\<cr>return this.\<esc>\"vpa;\<esc>"
    exe "norm! o}\<cr>"

    exe "norm! o\<esc>"
    exe "norm! 0C\<tab>public void set\<esc>\"vpBlll~A(\<esc>\"tp"
    exe "norm! a \<esc>\"vpa)\<cr>{\<cr>this.\<esc>\"vpa = \<esc>"
    exe "norm! \"vpa;\<cr>}\<esc>j"
endfunction
