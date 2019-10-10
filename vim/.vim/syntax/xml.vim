let b:current_syntax = 1

syntax match xmlTag "\v\c<[\/\.[:alnum:]]*[ >\n]"
syntax match xmlString '".*"' contains=@Spell
syntax match xmlNote "\v\c<(todo|fixme)>[:]*"
syntax region xmlCommentBlock start="<!--" end="-->" contains=@Spell,xmlNote
hi! xmlTag ctermfg=3
hi! xmlNote cterm=bold ctermfg=13
hi! xmlString ctermfg=0
hi! xmlCommentBlock ctermfg=gray
