let b:current_syntax = 1

syntax match javaMethod "\v\c(private|public|protected)\zs[[:alnum:] <>,]*\ze\("
" syntax match javaAccess "\v\c<(private|public|protected)>"
syntax match javaString '".*"' contains=@Spell
syntax match javaCommentLine "//.*$" contains=@Spell,javaNote
syntax match javaNote "\v\c<(todo|fixme)>[:]*"
syntax region javaCommentBlock start="/\*" end="\*/" contains=@Spell,javaNote
hi! javaMethod ctermfg=0
" hi! javaAccess ctermfg=3
hi! javaNote cterm=bold ctermfg=13
" hi! rsString ctermfg=0
hi! javaCommentLine ctermfg=gray
hi! link javaCommentBlock javaCommentLine
