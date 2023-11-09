let b:current_syntax = 1

syntax match header "\v[#]{1,}.*$" contains=@Spell,note
syntax match note "\v\c<(todo|fixme)>[:]*"
syntax match commentLine "\v\<!--.*--\>" contains=@Spell,note
syntax spell toplevel

hi! header cterm=bold
hi! note cterm=bold ctermfg=13
hi! commentLine ctermfg=gray
