let b:current_syntax = 1

syntax match vimFunction "function[!]*\s\zs[^(]*\ze("
syntax match vimComment "\".*$" contains=@Spell,hsNote
" syntax match vimString '["'].*["']' contains=@Spell
hi! vimFunction ctermfg=3
" hi! vimString ctermfg=0
hi! vimComment ctermfg=gray
