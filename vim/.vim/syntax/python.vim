let b:current_syntax = 1

syntax match pythonFunction "\v\cdef +\zs[^(]*\ze\("
syntax match pythonCommentLine "#.*$" contains=@Spell,pythonNote
syntax match pythonNote "\v\c<(todo|fixme)>[:]*"
hi! pythonFunction cterm=bold
hi! pythonNote cterm=bold ctermfg=13
" hi! rsString ctermfg=0
hi! pythonCommentLine ctermfg=gray
