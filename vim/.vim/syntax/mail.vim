let b:current_syntax = 1

syntax match mailTo "\C^To:.*$"
syntax match mailSubject "\C^Subject:.*$"
hi! mailTo cterm=bold
hi! mailSubject cterm=bold
