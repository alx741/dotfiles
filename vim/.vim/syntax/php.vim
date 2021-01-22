let b:current_syntax = 1

syntax match phpFunction "\v\cfunction +\zs[^(]*\ze\("
syntax match phpCommentLine "//.*$" contains=@Spell,phpNote
syntax match phpNote "\v\c<(todo|fixme)>[:]*"
syntax region phpCommentBlock start="/\*" end="\*/" contains=@Spell,javaNote
hi! phpFunction ctermfg=0
hi! phpNote cterm=bold ctermfg=13
" hi! swiftString ctermfg=0
hi! phpCommentLine ctermfg=gray
hi! link phpCommentBlock phpCommentLine
