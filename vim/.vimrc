" Unfuck indentation (usually html)
" Make this a function or something
" :%s/^\s*/&&/g

"{{{ Plugins
call plug#begin('~/.vim/plugged')
Plug '~/lab/vim-tmux-navigator'
Plug '~/lab/vinfo'
Plug '~/lab/vim-hindent'
Plug '~/lab/vim-stylishask'
Plug '~/lab/vim-rustfmt'
Plug '~/lab/vim-yesod'
Plug '~/lab/ghc.vim'
Plug '~/lab/vim-nativescript'
Plug '~/lab/spec.vim'
Plug '~/lab/haskellcomplete.vim'
Plug '~/lab/stack.vim'
Plug '~/lab/vim-ghcid'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'w0rp/ale'
Plug 'vim-scripts/matchit.zip'
Plug 'ggVGc/vim-fuzzysearch'
Plug 'hail2u/vim-css3-syntax'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'othree/html5.vim'
Plug 'rking/ag.vim'
Plug 'thanthese/Tortoise-Typing'
Plug 'kana/vim-vspec'
Plug 'rhysd/vim-vspec-matchers'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'wellle/targets.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'xolox/vim-misc'
Plug 'Konfekt/FastFold'
Plug 'ntpeters/vim-better-whitespace'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/loremipsum'
Plug 'milkypostman/vim-togglelist'
Plug 'vim-scripts/OmniCppComplete'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'asciidoc/vim-asciidoc'
Plug 'rust-lang/rust.vim'
Plug 'LnL7/vim-nix'
Plug 'cespare/vim-toml'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'racer-rust/vim-racer'
Plug 'veegee/vim-pic'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Twinside/vim-hoogle'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'benmills/vimux'
Plug 'skywind3000/asyncrun.vim'
Plug 'edkolev/curry.vim'
Plug 'tpope/vim-abolish'
Plug 'simeji/winresizer'
Plug 'ron89/thesaurus_query.vim'
Plug 'rhysd/vim-grammarous'
Plug 'nixon/vim-vmath'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'triglav/vim-visual-increment'
Plug 'fidian/hexmode'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'mustache/vim-mustache-handlebars'
Plug 'wavded/vim-stylus'
Plug 'jvirtanen/vim-octave'
Plug 'dart-lang/dart-vim-plugin'
Plug 'calviken/vim-gdscript3'
" Plug 'aiya000/vim-ghcid-quickfix'
Plug '~/lab/vim-ghcid-quickfix'
Plug 'jremmen/vim-ripgrep'
Plug 'KabbAmine/zeavim.vim'

let g:ghcid_quickfix_show_only_error_occured = v:true

" On-demand loading
Plug 'thanthese/Tortoise-Typing', { 'on': 'TortoiseTyping' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
call plug#end()

"{{{ Plugins configuration
    "{{{ Targets
        " let g:targets_aiAI = 'aIAi'
    "}}}

    "{{{ UltiSnips
        let g:UltiSnipsEditSplit="horizontal"
    "}}}

    "{{{ Multiple-cursors
        let g:multi_cursor_exit_from_visual_mode=0
        let g:multi_cursor_exit_from_insert_mode=0
    "}}}

    "{{{ Better-whitespace
        let g:better_whitespace_filetypes_blacklist=['man', 'info', 'help']
        let g:better_whitespace_filetypes_blacklist+=['gitcommit', 'po', 'diff']
        let g:better_whitespace_filetypes_blacklist+=['unite', 'qf', 'neoman']
        let g:better_whitespace_filetypes_blacklist+=['mail', 'pager', 'taskedit']
    "}}}

    "{{{ Lengthmatters
        let g:lengthmatters_excluded=['man', 'info', 'help', 'neoman']
        let g:lengthmatters_excluded+=['html', 'mail', 'pager', 'qf']
        let g:lengthmatters_excluded+=['taskedit', 'vim', 'xml', 'hamlet']
        let g:lengthmatters_highlight_one_column = 1
    "}}}

    "{{{ Gutentags
        let g:gutentags_cache_dir = "/home/alx/.tags"
    "}}}

    "{{{ EasyAlign
        nmap ga <Plug>(EasyAlign)
        xmap ga <Plug>(EasyAlign)

        let g:easy_align_delimiters = {
            \ '/': {
            \     'pattern':         '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment'] }
            \ }
    "}}}

    "{{{ Togglelist
        let g:toggle_list_no_mappings=1
    "}}}

    "{{{ Closetag
        let g:closetag_filenames="*.html,*.xhtml,*.xml,*.xds,*.phtml,*.php,*.mustache"
    "}}}

    "{{{ Emmet

        " I will forget this yet again: To expand an emmet expression like
        "       html:    'div#someid.someclass'
        "       css:     'bacol'
        " Just type the expression and then type <C-]>, that's it.

        let g:user_emmet_install_global = 0
        let g:user_emmet_leader_key='\'
        let g:user_emmet_expandabbr_key = '<C-]>'
        augroup emmet_au
            au!
            autocmd FileType html,xml,css,scss,sass,php,blade,hamlet,cassius,html.mustache EmmetInstall
        augroup END
    "}}}

    "{{{ Netrw
        let g:netrw_banner=0
    "}}}

    "{{{ Vim-racer
        let g:racer_cmd = "racer"
        let g:racer_no_default_keymappings = 1
        let $RUST_SRC_PATH = "/home/alx/lab/rust/rust/src"
    "}}}

    "{{{ Vim-tmux-navigator
        let g:tmux_navigator_no_mappings = 1
        let g:tmux_navigator_save_on_switch = 0
    "}}}

    "{{{ Fzf
        let g:fzf_layout = { 'down': '~20%' }
        let g:fzf_buffers_jump = 1
    "}}}

    "{{{ Hindent
        let g:hindent_on_save = 0
        let g:hindent_line_length = 77
        let g:hindent_indent_size = 4
    "}}}

    "{{{ Stylishask
        let g:stylishask_on_save = 0
    "}}}

    "{{{ Rustfmt
        let g:rustfmt_on_save = 0
    "}}}

    "{{{ Haskell-vim
        let g:haskell_classic_highlighting = 1
        let g:haskell_disable_TH = 1
        let g:haskell_indent_disable = 1

        let g:haskell_indent_if = 4
        let g:haskell_indent_case = 4
        let g:haskell_indent_let = 4
        let g:haskell_indent_where = 2
        let g:haskell_indent_do = 4
        let g:haskell_indent_let = 0
        let g:haskell_indent_guard = 4
    "}}}

    "{{{ Polyglot
        let g:polyglot_disabled = ['haskell']
    "}}}

    "{{{ Goyo
        let g:goyo_width = 90
        let g:goyo_height = '95%'

        function! s:goyo_enter()
            exe "Relativity!"
            set nonumber
            set norelativenumber
            silent !tmux set -g status
        endfunction

        function! s:goyo_leave()
            exe "Relativity"
            set number
            set relativenumber
            silent !tmux set -g status
        endfunction

        augroup goyo_au
            au!
            autocmd! User GoyoEnter nested call <SID>goyo_enter()
            autocmd! User GoyoLeave nested call <SID>goyo_leave()
        augroup END
    "}}}

    "{{{ Winresizer
        let g:winresizer_start_key = '<C-w><space>'
    "}}}

    "{{{ spec.vim
        let g:spec_haskell = {
            \   'spec_dir': 'test',
            \   'src_dir': 'src',
            \   'spec_extension': '.hs',
            \   'src_extension': '.hs',
            \   'keep_src_tree': 1,
            \   'spec_prefix': '',
            \   'spec_suffix': 'Spec',
            \   'runner': '!',
            \   'run_individual_cmd': 'stack runhaskell {spec}',
            \   'run_all_cmd': 'stack test',
            \   'hook_before': 'tddlight yellow',
            \   'hook_pass': 'tddlight green',
            \   'hook_fail': 'tddlight red'
            \ }
    "}}}

    "{{{ Grammarous
        let g:grammarous#use_vim_spelllang = 1
    "}}}

    "{{{ ALE
        let g:ale_lint_on_filetype_changed = 0
        let g:ale_lint_on_insert_leave = 0
        let g:ale_lint_on_enter = 0
        let g:ale_lint_on_save = 0
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_set_highlights = 0
        let g:grammarous#use_vim_spelllang = 1
        nnoremap <silent>gjl :up<CR>:echo "Linting..."<CR>:ALELint<CR>
        nnoremap <silent> gl<space> :call ToggleLocationList()<CR>
        nnoremap <silent> glc :sign unplace *<CR>

        let g:ale_linters = {
        \   'haskell': ['hlint'],
        \}
    "}}}

    "{{{ Vmath
        vmap <expr>  ++  VMATH_YankAndAnalyse()
        nmap         ++  vip++
    "}}}

    "{{{ Togglelist
        let g:toggle_list_copen_command="botright copen"
    "}}}

    "{{{ Syntastic
        " set statusline+=%#warningmsg#
        " set statusline+=%{SyntasticStatuslineFlag()}
        " set statusline+=%*

        " let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_auto_loc_list = 1
        " let g:syntastic_check_on_open = 1
        " let g:syntastic_check_on_wq = 0
    "}}}

    "{{{ vim-ghcid
        let g:ghcid_args = '--command "cabal v2-repl -f O0"'
    "}}}

    "{{{ zeavim
        let g:zv_file_types = {
                    \   'java': 'android',
                    \   'kotlin'  : 'android',
                    \   'tex' : 'latex'
                    \ }

        nnoremap <buffer><silent> K :Zeavim<CR>
    "}}}
"}}}
"}}}

"{{{ Options
"{{{ Path
    " SDCC
    set path+=/usr/share/sdcc/include/pic14,/usr/share/sdcc/include/pic16
    set path+=/usr/share/sdcc/non-free/include/pic14,/usr/share/sdcc/non-free/include/pic16

    " GPUTILS
    set path+=/usr/share/gputils/header

    " AVR
    set path+=/usr/avr/include

    " STM32
    set path+=/home/alx/lab/stm32f1-minimal-lib/include
"}}}

"{{{ Backup System
    set backup
    set undofile
    set noswapfile
    set undodir=~/.vim/tmp/undo/
    set backupdir=~/.vim/tmp/backup/
    set backupskip=/tmp/*,/private/tmp/*
    set writebackup
"}}}

"{{{ Status Line and Color
    set statusline+=\ %f\ %r\ %m

    set statusline+=\ \ \ \ %#error#
    set statusline+=%{StatuslineTabWarning()}
    set statusline+=%*

    set statusline+=\ \ \ \ %#error#
    set statusline+=%{StatuslineTrailingSpaceWarning()}
    set statusline+=%*

    set statusline+=%=%c:%l/%L\ %P

    augroup statusline
        au!
        au cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
        au cursorhold,bufwritepost * unlet! b:statusline_tab_warning
    augroup END

    function! StatuslineTrailingSpaceWarning()
        if !exists("b:statusline_trailing_space_warning")
            if search('\s\+$', 'nw') != 0 && &ft !~? 'help\|qf\|man'
                let b:statusline_trailing_space_warning='[Trailing Whitespaces]'
            else
                let b:statusline_trailing_space_warning=''
            endif
        endif
        return b:statusline_trailing_space_warning
    endfunction

    function! StatuslineTabWarning()
        if !exists("b:statusline_tab_warning")
            let tabs = search('^\t', 'nw') != 0
            if tabs && &ft !~? 'help\|qf\|man'
                let b:statusline_tab_warning =  '[Mixed Indenting]'
            else
                let b:statusline_tab_warning = ''
            endif
        endif
        return b:statusline_tab_warning
    endfunction
"}}}

"{{{ Global Auto Commands
    augroup global_au
        au!
        " Reset format options when filetypes are loaded
        au FileType * set formatoptions=tcrql
        au FileType html,php,css,javascript,blade nnoremap gr :up<CR>:call Refresh_firefox(1)<CR>
        au FileType haskell,yesod,hamlet,lucius,cassius,julius nnoremap gr :up<CR>:call Refresh_firefox(1)<CR>
        autocmd BufWritePost init.vim,.vimrc source %
    augroup END
"}}}

"{{{ Global Commands, abbreviations and sourcing
    command! W w !sudo tee % >/dev/null
    command! -bang Q :call QuitIgnoringE173("<bang>")
    cnoreabbrev q Q
    cnoreabbrev man Man
    runtime! ftplugin/man.vim
"}}}

" {{{ General Options
    set autoindent
    set autoread
    set autowrite
    set background=light
    set backspace=2
    set breakindent
    set complete=.,w,b,u,t,i,kspell
    set completeopt-=longest
    set completeopt-=noinsert
    set completeopt-=preview
    set expandtab
    set exrc
    set foldenable
    set foldlevel=3
    set foldlevelstart=99
    set foldmethod=syntax
    set foldnestmax=1
    set formatoptions=tcrql
    set gdefault
    set hidden
    set hlsearch
    set ignorecase
    set incsearch
    set iskeyword+=-
    set laststatus=2
    set lazyredraw
    set linebreak
    set noesckeys
    set nojoinspaces
    set ruler
    set secure
    set shiftround
    set shiftwidth=4
    set shortmess+=I
    set showcmd
    set showmode
    set smartcase
    set smarttab
    set softtabstop=4
    set synmaxcol=150
    set tabstop=4
    set tags=./tags,./TAGS,codex.tags,tags,TAGS
    set textwidth=80
    set timeout
    set timeoutlen=300
    set ttimeout
    set ttimeoutlen=-1
    set undofile
    set undolevels=5000
    set wildignore=*.o,*.class
    set wildmenu
    set wildmode=longest,list,full
    set wrapscan

    filetype plugin indent on
    colors minimal
    syntax on
    syntax spell toplevel
    let c_no_comment_fold=1
"}}}
"}}}

"{{{ Mappings
"{{{ Inclusive movements
    onoremap h vh
    onoremap l vl
    onoremap b vb
    onoremap B vB
    onoremap F vF
    onoremap T vT
    onoremap ^ v^
    onoremap g^ vg^
    onoremap + v+
    onoremap g+ vg+
    onoremap ( v(
    onoremap ` v`
"}}}

"{{{ Move with visual lines
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap g0 0
    nnoremap ^ g^
    nnoremap ^ g^
    nnoremap $ g$
    nnoremap g$ $
"}}}

"{{{ LEADER mappings
    nnoremap <leader>s :call ToggleSpell()<CR>
    nnoremap <silent><leader><leader> :UndotreeToggle<CR>

    "{{{ Dotfiles editing
        nnoremap <silent><leader>ev :e ~/.vimrc<CR>
        nnoremap <silent><leader>ef :e ~/.vim/ftplugin<CR>
        nnoremap <silent><leader>et :e ~/.tmux.conf<CR>
        nnoremap <silent><leader>er :e ~/.ratpoisonrc<CR>
        nnoremap <silent><leader>ez :e ~/.zshrc<CR>
        nnoremap <silent><leader>ex :e ~/.xinitrc<CR>
    "}}}
"}}}

"{{{ Window movement
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <Left>  <nop>
    nnoremap <silent> <Down>  <nop>
    nnoremap <silent> <Up>    <nop>
    nnoremap <silent> <Right> <nop>
"}}}

"{{{ X Clipboard yanking/pasting
    nnoremap <C-c>p o<esc>"+p
    nnoremap <C-c>P O<esc>"+p
    nnoremap <C-c>y "+y
    nnoremap <C-c>Y "+Y
    vnoremap <C-c>y "+y
    inoremap <C-r>c <C-r>+
    " Ctrl variations
    nnoremap <C-c><C-p> o<esc>"+p
    nnoremap <C-c><C-y> "+y
    vnoremap <C-c><C-y> "+y
"}}}

"{{{ General Mappings
    nnoremap <NUL> <c-^>
    nnoremap gs :up<CR>
    nnoremap gS :wa!<CR>:call QuitIgnoringE173("!")<CR>
    nnoremap gjc :Make! clean<CR>
    nnoremap gjj :w<CR>:Make<CR>
    nnoremap <c-z> <c-x>
    nnoremap z<space> 1z=
    nnoremap Y y$
    nnoremap <space> za
    nnoremap <expr>S ':%s/' . @/ . '//<LEFT>'
    nnoremap <leader><CR> mzggg?G`z
    nnoremap <silent> J :call Join()<CR>
    nnoremap <C-c> :noh<CR>
    nnoremap <silent> gl :set opfunc=Listify<CR>g@
    vnoremap <silent> gl :<c-u>call Listify(visualmode(), 1)<CR>
    nnoremap <silent> zs :call Translate(expand("<cword>"), "es")<CR>
    nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
    nnoremap <silent><C-\> :call ToggleQuickfixList()<CR>
    nnoremap gp `[v`]
    nnoremap Q :Buffers<CR>
    nnoremap <C-p> :Files<CR>
    nnoremap g\ :Explore<CR>
    nnoremap go gvo<esc>
    vnoremap // y/<C-R>"<CR>
    inoremap <C-f> <C-x>
    nnoremap q: <NOP>
    nnoremap vv ^<C-v>g_
    nnoremap 2O O<esc>O
    nnoremap 2o o<esc>o
    nnoremap c "_c
    nnoremap <silent> <c-_> :FuzzySearch<CR>
    inoremap {{ {<cr>}<esc>kA
    vnoremap {{ <esc>mz'<O{<esc>'>o}<esc>`z
    vnoremap t <esc>:'<,'>sort<CR>
    nnoremap <C-w>+ :resize +5<CR>
    nnoremap <C-w>- :resize -5<CR>
    nnoremap <C-w>> :vertical resize +5<CR>
    nnoremap <C-w>< :vertical resize -5<CR>
    nnoremap dtp yapgP
    nnoremap dtcp yapgPvip:Commentary<CR>
    nnoremap zn :setlocal number! relativenumber!<CR>
    nnoremap zl :setlocal cursorline!<CR>
    nnoremap g= :call Format()<CR>
"}}}
"}}}

"{{{ Functions
function! Format() "{{{
    " * Removes trailing white spaces
    " * Removes blank lines at the end of the file
    " * Replaces tabs with spaces
    " * Re-Indent
    "
    " * If: C, CPP, PHP or Java code: format using 'astyle'
    " * If: Rust code: format using 'rustfmt'
    "
    " * Clear 'formatprg' so `gq` can be used with the default
    "   behavior
    let l:winview = winsaveview()

    if &ft ==? 'c' || &ft ==? 'cpp' || &ft ==? 'php'
        setlocal formatprg=astyle\ --mode=c
        silent! execute 'norm! gggqG'
    elseif &ft ==? 'java'
        setlocal formatprg=astyle\ --mode=java
        silent! execute 'norm! gggqG'
    elseif &ft ==? 'rust'
        setlocal formatprg=rustfmt
        silent! execute 'norm! gggqG'
    endif

    silent! call RemoveTrailingSpaces()
    silent! execute 'retab'
    silent! execute 'gg=G'
    call winrestview(l:winview)
    setlocal formatprg=
endfunction
"}}}

function! RemoveTrailingSpaces() "{{{
    silent! execute '%s/\s\+$//ge'
    silent! execute 'g/\v^$\n*%$/norm! dd'
endfunction
"}}}

function! ToggleSpell() "{{{
    if &spell ==? 0
        set spelllang=en
        set spell
        echom "Spell [EN]"

    elseif &spell ==? 1
        if &spelllang ==? 'en'
            set spelllang=es
            echom "Spell [ES]"

        elseif &spelllang ==? 'es'
            set spelllang=en
            set nospell
            echom "NO Spell"
        endif
    endif
endfunction
"}}}

function! NumberToggle() "{{{
    if &relativenumber ==? 1
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
"}}}

function! Listify(type, ...) "{{{
    if a:0
        exe "'<,'>norm! I- "
    else
        exe "norm! '[V']\<esc>"
        exe "'<,'>norm! ^i- "
    endif
endfunction
"}}}

function! Translate(text, to_lang) "{{{
" Needs https://github.com/soimort/translate-shell
    if a:to_lang ==? "es"
        exe "!trans -b en:es \"" . a:text . "\""
    else
        exe "!trans -b es:en \"" . a:text . "\""
    endif
endfunction
"}}}

function! Join() "{{{
    let next_line = getline(line('.')+1)
    if next_line =~? "^$"
        exec "silent norm! gJ"
    else
        exec "silent norm! J"
    endif
endfunction
"}}}

function! Refresh_firefox(type) "{{{
    if a:type
        silent exe "AsyncRun ~/.scripts/refresh_firefox.sh focus"
    else
        silent exe "AsyncRun ~/.scripts/refresh_firefox.sh"
    endif

    silent exe "redraw!"
endfunction
"}}}

function! Make_arrow(type) "{{{
    if (a:type == 1)
        if (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ' ')
            exe "norm! a->  "
        else
            exe "norm! a ->  "
        endif
    elseif (a:type == 2)
        if (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ' ')
            exe "norm! a=>  "
        else
            exe "norm! a =>  "
        endif
    elseif (a:type == 3)
        if (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ' ')
            exe "norm! a<-  "
        else
            exe "norm! a <-  "
        endif
    endif
    exe "startinsert"
endfunction
"}}}

function! ClearQuickfixList() "{{{
    call setqflist([])
endfunction
"}}}

function! QuitIgnoringE173(bang) "{{{
    try
        if a:bang == ""
            quit
        else
            quit!
        endif
    catch /E173/
        if a:bang == ""
            quit
        else
            quit!
        endif
    endtry
endfunction
"}}}

" function! SingleSpace() "{{{
"     silent! :.s/\m\s\{2,\}/ /
" endfunction
"}}}
"}}}

" vim:fdm=marker
