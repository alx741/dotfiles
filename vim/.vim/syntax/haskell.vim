let b:current_syntax = 1

syntax match hsData "\v\C^<(data|type|newtype|class|instance)>"
syntax match hsKeywords "\v\C<(let|in|where|do|case|as|hiding)>"
syntax match hsTypeDecs "\v\zs\w+\ze\s*::"
syntax match hsType "\v\H\zs\u\w+\ze"
syntax match hsComment "--.*$" contains=@Spell
syntax match hsString '".*"' contains=@Spell
syntax match hsPragma "^{.*}$"
syntax match hsImport "\v\zsimport\s[A-Za-z0-9.]+\ze" contains=hsKeywords
hi! hsKeywords ctermfg=2
hi! hsTypeDecs ctermfg=3
hi! hsType ctermfg=13
hi! hsComment ctermfg=gray
hi! hsString ctermfg=6
hi! link hsData Normal
hi! link hsPragma Normal
hi! link hsImport Normal
