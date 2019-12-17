set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/solarized.vim
let g:colors_name="minimal"

hi! Normal     ctermbg=NONE ctermfg=11
hi! Comment    ctermbg=NONE ctermfg=gray
hi! Error      ctermbg=NONE ctermfg=1
hi! Todo       ctermbg=NONE ctermfg=13 cterm=bold

hi Visual   cterm=NONE ctermbg=7  ctermfg=11

hi StatusLine   cterm=bold ctermbg=7  ctermfg=11
hi StatusLineNC cterm=NONE ctermbg=7  ctermfg=14
hi VertSplit    cterm=NONE ctermbg=15 ctermfg=7
hi MatchParen   cterm=NONE ctermbg=7 ctermfg=5
hi SpellBad     cterm=underline

hi! clear Constant
hi! clear Identifier
hi! clear Ignore
hi! clear PreProc
hi! clear Special
hi! clear Statement
hi! clear Type
hi! clear Underline
