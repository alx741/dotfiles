let b:current_syntax = 1

syntax match swiftMethod "\v\cfunc +\zs[[:alnum:]]*\ze\("
syntax match swiftString '".*"' contains=@Spell
syntax match swiftCommentLine "//.*$" contains=@Spell,swiftNote
syntax match swiftNote "\v\c<(todo|fixme)>[:]*"
syntax region swiftCommentBlock start="/\*" end="\*/" contains=@Spell,javaNote
hi! swiftMethod ctermfg=0
hi! swiftNote cterm=bold ctermfg=13
" hi! swiftString ctermfg=0
hi! swiftCommentLine ctermfg=gray
hi! link swiftCommentBlock swiftCommentLine
