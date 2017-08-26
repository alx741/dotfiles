setlocal tw=76
nnoremap <buffer><silent> gs :call Toggle_str()<CR>
nnoremap <buffer><silent> ]] :call Next_msgstr(0)<CR>
nnoremap <buffer><silent> [[ :call Next_msgstr(1)<CR>
nnoremap <buffer><silent> ]a :call Next_a_tag(0)<CR>
nnoremap <buffer><silent> [a :call Next_a_tag(1)<CR>
nnoremap <buffer><space> 1z=

function! Next_msgstr(invert)
    if a:invert == 0
        exe "norm! /\\v^msgstr\<cr>\<esc>"
    else
        exe "norm! ?\\v^msgstr\<cr>\<esc>"
    endif
    exe "norm! zz"
endfunction

function! Toggle_str()
    let save_fo = &fo
    set fo-=t

    exe "norm! ?\\v^msgstr.+$\\n[[:print:]]\<cr>jV}ko\<esc>^"

    let cur_char = getline(".")[col(".")-1]
    if cur_char ==? "\""
        exe "norm! gv\<esc>"
        exe "'<,'>norm! ^x$x"
        exe "'<,'>s/\\s\\+$//e"
    else
        exe "norm! gv\<esc>"
        exe "'<,'>norm! I\"\<esc>"
        exe "'<,'>norm! A \"\<esc>"
        exe "norm! jA\"\<esc>"
    endif

    let &fo = save_fo
endfunction

function! To_txt()
    exe "g/^\"/norm x"
    exe "g/\"$/norm $x"
    exe "call RemoveTrailingSpaces()"
    exe "g/^#/norm dd"
    exe "g/^msgid \"$/norm cc\r"
    exe "g/^msgstr \"$/norm cc\<esc>"
    exe "%s/^msgid \"/\r/"
    exe "%s/^msgstr \"/\r/"
    exe "norm ggO\<esc>72i-\<esc>"
    exe "norm Go\<esc>72i-\<esc>"
endfunction

function! Next_a_tag(invert)
    if a:invert == 0
        exe "norm! /\\v\\<a\<esc>v"
        exe "norm! /\\v\\</a\\>\<cr>f\>"
    else
        exe "norm! ?\\v\\<a\<esc>v"
        exe "norm! /\\v\\</a\\>\<cr>f\>o"
    endif
endfunction
