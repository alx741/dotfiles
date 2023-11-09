let b:current_syntax = 1

syntax match commentLine "//.*$" contains=@Spell,kotlinNote
hi! commentLine ctermfg=gray
