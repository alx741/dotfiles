let b:current_syntax = 1

syntax match kotlinMethod "\v\cfun +\zs[.[:alnum:]]*\ze\("
syntax match kotlinString '".*"' contains=@Spell
syntax match kotlinCommentLine "//.*$" contains=@Spell,kotlinNote
syntax match kotlinNote "\v\c<(todo|fixme)>[:]*"
syntax region kotlinCommentBlock start="/\*" end="\*/" contains=@Spell,javaNote
hi! kotlinMethod cterm=bold
hi! kotlinNote cterm=bold ctermfg=13
" hi! kotlinString ctermfg=0
hi! kotlinCommentLine ctermfg=gray
hi! link kotlinCommentBlock kotlinCommentLine
