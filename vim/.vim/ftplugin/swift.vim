"{{{ Mappings
" General
nnoremap <buffer><silent> g= :call SwiftFormat()<CR>

" Arrows
inoremap <buffer><silent> ;; <space>-><space>
inoremap <buffer><silent> ;: <space>=><space>
inoremap <buffer><silent> :; <space><-<space>
"}}}

"{{{ Functions
function! SwiftFormat()
    let l:winview = winsaveview()
    silent! exe "keepjumps call CleanTypeAnnotations()"
    silent! exe "keepjumps call RemoveTrailingSpaces()"
    exe "%! swiftformat"
    call winrestview(l:winview)
endfunction
"}}}

" vim:fdm=marker
