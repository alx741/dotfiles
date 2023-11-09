let b:current_syntax = 1

syntax match rsKeywords "\v\C<(mut|\&mut|pub|break|continue|as|where)>"
syntax match rsType "\v\H\zs\u\w+\ze"
syntax match rsFn "fn\s\zs[^(]*\ze"
syntax match rsString '".*"' contains=@Spell
syntax match rsNote "\v\c<(todo|fixme)>[:]*"
syntax match rsComment "//.*$" contains=@Spell,rsNote
syntax region rsCommentBlock start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=@Spell,rsNote
" hi! rsKeywords ctermfg=3

" hi! rsType cterm=bold
hi! rsFn cterm=bold
hi! rsSymbol cterm=bold
hi! rsNote cterm=bold ctermfg=13
" hi! rsString ctermfg=0
hi! rsComment ctermfg=gray
hi! link rsCommentBlock rsComment
