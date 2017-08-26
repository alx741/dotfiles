setlocal makeprg=pulp
compiler ghc
setlocal omnifunc=necoghc#omnifunc
let g:fzf_tags_command = 'hasktags -c -x -R .'

" General
onoremap <buffer><silent> ia :<c-u>silent execute "normal! ?->\r:nohlsearch\rwvf-ge"<CR>
onoremap <buffer><silent> aa :<c-u>silent execute "normal! ?->\r:nohlsearch\rhvEf-ge"<CR>
nnoremap <buffer><silent> ]] :call JumpHaskellFunction(0)<CR>
nnoremap <buffer><silent> [[ :call JumpHaskellFunction(1)<CR>
nnoremap <buffer><silent> gjj :up<CR> :echo "Building..."<CR> :exec "AsyncRun " . &makeprg . " build"<CR>
nnoremap <buffer><silent> gjk :up<CR> :echo "Testing..."<CR> :exec "AsyncRun " . &makeprg . " test"<CR>
nnoremap <buffer><silent> gI :silent exec "keepjumps normal! gg /import \rh"<CR><ESC>:noh<CR>
nnoremap <buffer><silent> ght :!hasktags -c -x -R .<CR>
nmap     <buffer><silent> g<space> :call Sort_imports()<CR>
nmap     <buffer><silent> <leader>gg :call RunPsci(1)<CR>
nmap     <buffer><silent> <leader>gs :call RunPsci(0)<CR>

" Arrows
inoremap <buffer><silent> ;; <C-]><ESC>:call Make_arrow(1)<CR>
inoremap <buffer><silent> ;: <C-]><ESC>:call Make_arrow(0)<CR>

function! RunPsci(type)
    call VimuxRunCommand(" pulp psci && exit")
    if a:type
        call VimuxSendText(":l " . bufname("%"))
        call VimuxSendKeys("Enter")
    endif
endfunction
