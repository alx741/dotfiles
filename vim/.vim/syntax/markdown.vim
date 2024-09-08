let b:current_syntax = 1

syntax match header "\v[#]{1,}.*$" contains=@Spell
syntax match commentLine "\v\<!--.*--\>" contains=@Spell
syntax match bold "\v\*\zs.*\ze\*" contains=@Spell
syntax match italic "\v_\zs.*\ze_" contains=@Spell
syntax match code "\v`\zs.*\ze`"
syntax spell toplevel

hi! header cterm=bold
hi! commentLine ctermfg=gray
hi! bold cterm=bold
hi! italic cterm=italic
hi! code cterm=italic
