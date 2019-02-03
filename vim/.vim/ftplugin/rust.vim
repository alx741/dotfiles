setlocal makeprg=cargo
compiler cargo

"{{{ Mappings
nnoremap <buffer><silent> g= :call RustFormat()<CR>
nnoremap <buffer><silent> gjj :up<CR>:echo "Type Checking..."<CR>:Dispatch -compiler=cargo cargo check<CR>
nnoremap <buffer><silent> gjJ :up<CR>:echo "Building..."<CR>:Dispatch -compiler=cargo cargo build<CR>
inoremap <buffer><silent> ;: <ESC>:call Make_arrow(0)<CR>
inoremap <buffer><silent> ;; <ESC>:call Make_arrow(1)<CR>
"}}}

function! RustFormat()
    let l:winview = winsaveview()
    silent! exe "keepjumps call RemoveTrailingSpaces()"
    exe "Rustfmt"
    call winrestview(l:winview)
endfunction

