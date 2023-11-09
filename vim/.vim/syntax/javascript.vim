let b:current_syntax = 1

syntax match function "\v\cfunction +\zs[._[:alnum:]]*\ze\("
syntax match javaString '".*"' contains=@Spell
syntax match commentLine "//.*$" contains=@Spell,note
syntax match note "\v\c<(todo|fixme)>[:]*"
syntax region commentBlock start="/\*" end="\*/" contains=@Spell,note
hi! function cterm=bold
hi! note cterm=bold ctermfg=13
" hi! rsString ctermfg=0
hi! commentLine ctermfg=gray
hi! link commentBlock commentLine
