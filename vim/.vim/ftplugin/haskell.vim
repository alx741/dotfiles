setlocal makeprg=stack
compiler ghc
setlocal omnifunc=necoghc#omnifunc
let g:fzf_tags_command = 'hasktags -c -x -R . && codex update'

"{{{ Color
hi! haskellDecl ctermfg=27
hi! haskellDeclKeyword ctermfg=30
hi! haskellIdentifier ctermfg=129
hi! haskellOperators ctermfg=black
hi! haskellType ctermfg=32
hi! def link haskellPragma Comment
hi! haskellNumber ctermfg=166
hi! haskellImportKeywords ctermfg=136
"}}}

"{{{ Mappings
" General
onoremap <buffer><silent> ia :<c-u>silent call HaskellSelectArgument(1)<CR>
onoremap <buffer><silent> aa :<c-u>silent call HaskellSelectArgument(0)<CR>
onoremap <buffer><silent> ic :<c-u>silent call HaskellSelectCase()<CR>
nnoremap <buffer><silent> ]] :call JumpHaskellFunction(0)<CR>
nnoremap <buffer><silent> [[ :call JumpHaskellFunction(1)<CR>
nnoremap <buffer><silent> gjj :up<CR>:echo "Type Checking..."<CR>:Dispatch -compiler=ghc hdevtools check %<CR>
nnoremap <buffer><silent> gjJ :up<CR>:echo "Building..."<CR>:Make build<CR>
nnoremap <buffer><silent> gjk :up<CR>:echo "Testing..."<CR>:Make test<CR>
nnoremap <buffer><silent> gK :SpecRunAll<CR>
nnoremap <buffer><silent> gI :silent exec "keepjumps normal! gg /import \rh"<CR><ESC>:noh<CR>
nnoremap <buffer><silent> ght :exec "!" . g:fzf_tags_command<CR>:redraw!<CR>
nnoremap <buffer><silent> gC :e *.cabal<CR>
nmap     <buffer><silent> g<space> :call Sort_imports()<CR>
nmap     <buffer><silent> <leader>gg :call RunGhci(1)<CR>
nmap     <buffer><silent> <leader>gs :call RunGhci(0)<CR>
nnoremap <buffer><silent> K :HoogleInfo<CR>
nnoremap <buffer><silent> gk :HoogleClose<CR>

" Hdevtools
nnoremap <buffer><silent>gt :HdevtoolsType<CR>

" Arrows
inoremap <buffer><silent> ;; <C-]><ESC>:call Make_arrow(1)<CR>
inoremap <buffer><silent> ;: <C-]><ESC>:call Make_arrow(2)<CR>
inoremap <buffer><silent> :; <C-]><ESC>:call Make_arrow(3)<CR>
"}}}

"{{{ Types Abbreviations
inoreab <buffer> und undefined
inoreab <buffer> int Int
inoreab <buffer> integer Integer
inoreab <buffer> string String
inoreab <buffer> double Double
inoreab <buffer> float Float
inoreab <buffer> bool Bool
inoreab <buffer> true True
inoreab <buffer> false False
inoreab <buffer> maybe Maybe
inoreab <buffer> just Just
inoreab <buffer> nothing Nothing
inoreab <buffer> io IO ()
"}}}

"{{{ Functions
function! RunGhci(type)
    call VimuxRunCommand(" stack ghci && exit")
    if a:type
        call VimuxSendText(":l " . bufname("%"))
        call VimuxSendKeys("Enter")
    endif
endfunction

function! JumpHaskellFunction(reverse)
    call search('\C^[[:alnum:]]*\s*::', a:reverse ? 'bW' : 'W')
endfunction

function! Sort_imports()
    let l:line = getline('.')
    if matchstr(l:line, '\Cimport') ==? 'import'
        exe "norm! vip\<ESC>"
        exe "'<,'>sort"
    endif
    " Haskell type declarations
    if matchstr(l:line, '\C::') ==? '::'
        call SingleSpace()
    endif
endfunction

function! HaskellSelectArgument(inner)
    if a:inner
        exe "norm! ?\\v::\|->\<CR>"
        exe "norm! Wv/\\v->\|$\<CR>"
        exe "norm! ge"
    else
        exe "norm! ?\\v::\|->\<CR>"
        exe "norm! Wv/\\v->\|$\<CR>"
        exe "norm! Wge"
        let car = matchstr(getline('.'), '\%' . col('.') . 'c.')
        if (car ==? ">")
            exe "norm! wh"
        else
            exe "norm! \<esc>F-hvg_"
        endif
    endif
endfunction

function! HaskellSelectCase()
    exe "norm! $?case\<CR>"
    exe "norm! Wv/of\<CR>"
    exe "norm! B"
endfunction
"}}}

" vim:fdm=marker
