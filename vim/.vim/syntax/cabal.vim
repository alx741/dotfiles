let b:current_syntax = 1

syntax match cabalImportant "\C\(name:\|executable\|source-repository\|library\|test-suite\|common\)\s\+\zs[[:alnum:]-]*\ze"

hi! cabalImportant cterm=bold ctermfg=11
