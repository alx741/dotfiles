let b:current_syntax = 1

syntax match function "\v\c\W\zs[[:alnum:]]*\ze\("
syntax match commentLine "//.*$" contains=@Spell,kotlinNote
syntax match note "\v\c<(todo|fixme)>[:]*"
hi! function ctermfg=0
hi! note cterm=bold ctermfg=13
hi! commentLine ctermfg=gray
