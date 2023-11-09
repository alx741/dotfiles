let b:current_syntax = 1

syntax match cFunction "\v\c\zs^[^ ][[:alnum:] <>,_]*\ze\("
syntax match string '".*"' contains=@Spell
syntax match commentLine "//.*$" contains=@Spell,note
syntax match note "\v\c<(todo|fixme)>[:]*"
syntax region commentBlock start="/\*" end="\*/" contains=@Spell,note
hi! cFunction ctermfg=0
" hi! javaAccess ctermfg=3
hi! note cterm=bold ctermfg=13
" hi! rsString ctermfg=0
hi! commentLine ctermfg=gray
hi! link commentBlock commentLine
