let b:current_syntax = 1

syntax match hsData "\v\C^<(data|type|newtype|class|instance)>"
syntax match hsTypeDecs "\v\zs\w+\ze\s*::"
syntax match hsType "\v\H\zs\u\w+\ze"
syntax match hsNote "\v\c<(todo|fixme)>[:]*"
syntax match hsComment "--.*$" contains=@Spell,hsNote
syntax match hsPragma "^{.*}$"
syntax match hsImport "\v\zsimport\s[A-Za-z0-9.]+\ze"
syntax match hsUndefined "\Cundefined"
syntax match hsError "\Cerror "

hi! hsTypeDecs ctermfg=0
hi! link hsType Normal
hi! hsNote cterm=bold ctermfg=13
hi! hsComment ctermfg=gray
hi! hsUndefined ctermfg=1
hi! hsError ctermfg=1

hi! link hsString Normal
hi! link hsData Normal
hi! link hsPragma Normal
hi! link hsImport Normal
