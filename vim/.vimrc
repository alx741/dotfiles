"{{{ Plugins
    call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'LucHermitte/vim-refactor'
    Plug 'SirVer/ultisnips'
    Plug 'altercation/vim-colors-solarized'
    Plug 'alvan/vim-closetag'
    Plug 'alx741/vinfo'
    Plug 'benekastah/neomake'
    Plug 'vim-scripts/matchit.zip'
    Plug 'ggVGc/vim-fuzzysearch'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'junegunn/vim-easy-align'
    Plug 'kana/vim-textobj-user'
    Plug 'kennykaye/vim-relativity'
    Plug 'mbbill/undotree'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'othree/html5.vim'
    Plug 'rking/ag.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'thanthese/Tortoise-Typing'
    Plug 'tommcdo/vim-exchange'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-scripts/taglist.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'wellle/targets.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'xolox/vim-misc'
    Plug 'vimwiki/vimwiki'
    Plug 'tfnico/vim-gradle'
    Plug 'Konfekt/FastFold'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'whatyouhide/vim-lengthmatters'
    Plug 'fidian/hexmode'
    Plug 'justinmk/vim-sneak'
    Plug 'vim-scripts/a.vim'
    Plug 'milkypostman/vim-togglelist'
    Plug 'vim-scripts/OmniCppComplete'
    Plug 'shawncplus/phpcomplete.vim'
    Plug 'StanAngeloff/php.vim'
    Plug 'captbaritone/better-indent-support-for-php-with-html'
    Plug 'jwalton512/vim-blade'
    Plug 'vim-scripts/Word-Fuzzy-Completion'
    Plug 'mattn/emmet-vim'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'asciidoc/vim-asciidoc'
    Plug 'rust-lang/rust.vim'
    Plug 'LnL7/vim-nix'
    Plug 'cespare/vim-toml'
    Plug 'joukevandermaas/vim-ember-hbs'
    Plug 'racer-rust/vim-racer'
    Plug 'alx741/vim-tmux-navigator', { 'branch': 'vim-tmux-wm-monitor' }
    Plug 'veegee/vim-pic'
    Plug 'hsanson/vim-android'
    Plug 'sheerun/vim-polyglot'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'eagletmt/ghcmod-vim'
    Plug 'eagletmt/neco-ghc'
    Plug 'Twinside/vim-hoogle'
    Plug '~/lab/vim-hindent'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'pbrisbin/vim-syntax-shakespeare'
    Plug 'benmills/vimux'
    Plug '~/lab/vim-yesod'
    Plug '~/lab/ghc.vim'
    Plug 'skywind3000/asyncrun.vim'

    " On-demand loading
    Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
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
            let g:lengthmatters_excluded+=['taskedit, vim']
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

        "{{{ Sneak
            nmap fj <Plug>Sneak_s
            nmap Fj <Plug>Sneak_S
            xmap fj <Plug>Sneak_s
            xmap Fj <Plug>Sneak_S
            omap fj <Plug>Sneak_s
            omap Fj <Plug>Sneak_S
        "}}}

        "{{{ Togglelist
            let g:toggle_list_no_mappings=1
        "}}}

        "{{{ Closetag
            let g:closetag_filenames="*.html,*.xhtml,*.phtml,*.php"
        "}}}

        "{{{ Emmet
            let g:user_emmet_install_global = 0
            autocmd FileType html,css,php,blade EmmetInstall
            let g:user_emmet_leader_key='<C-j>'
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
            let g:tmux_navigator_save_on_switch = 1
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
                set nonumber
                set norelativenumber
                silent !tmux set -g status
            endfunction

            function! s:goyo_leave()
                set number
                set relativenumber
                silent !tmux set -g status
            endfunction

            autocmd! User GoyoEnter nested call <SID>goyo_enter()
            autocmd! User GoyoLeave nested call <SID>goyo_leave()
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
        set statusline=[%n]\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]
        set statusline+=\ [ft=%Y]\ %f\ %r\ %m

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
                if search('\s\+$', 'nw') != 0
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
                if tabs
                    let b:statusline_tab_warning =  '[Mixed Indenting]'
                else
                    let b:statusline_tab_warning = ''
                endif
            endif
            return b:statusline_tab_warning
        endfunction

        colors solarized
    "}}}

    "{{{ Global Auto Commands
        augroup global_au
            au!
            " Reset format options when filetypes are loaded
            au FileType * set formatoptions=tcrql
            au FileType html,php,css,javascript,blade nnoremap gr :call Refresh_firefox()<CR>
            autocmd BufWritePost init.vim,.vimrc source %
        augroup END
    "}}}

    "{{{ Global Commands, abbreviations and sourcing
        command! W w !sudo tee % >/dev/null
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
        set completeopt-=longest
        set completeopt-=preview
        set completeopt-=noinsert
        set complete=.,w,b,u,t,i,kspell
        set expandtab
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
        set laststatus=2
        set lazyredraw
        set linebreak
        set noesckeys
        set nojoinspaces
        set number
        set relativenumber
        set ruler
        set shiftround
        set shiftwidth=4
        set showcmd
        set showmode
        set smartcase
        set smarttab
        set softtabstop=4
        set t_CO=16
        set tabstop=4
        set textwidth=80
        set timeout
        set timeoutlen=400
        set ttimeout
        set ttimeoutlen=0
        set wildignore=*.o,*.class
        set wildmenu
        set wildmode=longest,list,full
        set wrapscan
        set exrc
        set secure
        set shortmess+=I
        set undolevels=5000
        set undofile

        filetype plugin indent on
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
        nnoremap ^ g^
        nnoremap $ g$
    "}}}

    "{{{ LEADER mappings
        nnoremap <leader>s :call ToggleSpell()<CR>
        nnoremap <silent><leader>t :TlistToggle<CR>
        nnoremap <silent><leader><leader> :UndotreeToggle<CR>

        "{{{ Dotfiles editing
            nnoremap <silent><leader>ev :e ~/.vimrc<CR>
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
        nnoremap } }zz
        nnoremap { {zz
        nnoremap <NUL> <c-^>
        nnoremap Q :Files<CR>
        nnoremap gs :w<CR>
        nnoremap gS :wq<CR>
        nnoremap gbb :w<CR> :Make!<CR>
        nnoremap gbc :Make! clean<CR>
        nnoremap gj :w<CR> :Make!<CR>
        nnoremap gb<space> :w<CR> :NeomakeSh exit 0<CR>
        nnoremap <c-z> <c-x>
        nnoremap z<space> 1z=
        nnoremap <silent>g= :call Format()<CR>
        nnoremap Y y$
        nnoremap <space> za
        nnoremap <expr>S ':%s/' . @/ . '//<LEFT>'
        nnoremap <leader><CR> mzggg?G`z
        nnoremap <silent> J :call Join()<CR>
        nnoremap <silent><esc> :noh<CR>:call sneak#hl#removehl()<CR><esc>
        nnoremap <silent> gl :set opfunc=Listify<CR>g@
        vnoremap <silent> gl :<c-u>call Listify(visualmode(), 1)<CR>
        nnoremap <silent> zs :call Translate(expand("<cword>"), "es")<CR>
        nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
        nnoremap <silent><C-\> :call ToggleQuickfixList()<CR>
        nnoremap gp `[v`]
        nnoremap <C-p> :Buffers<CR>
        nnoremap <C-m> :Tags<CR>
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
        inoremap {{ {<cr>}<esc>O
        vnoremap {{ <esc>mz'<O{<esc>'>o}<esc>`z
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
        silent! execute 'norm! mz'

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
        silent! execute 'norm! `z'
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
            exe "'<,'>norm! I* "
        else
            exe "norm! '[V']\<esc>"
            exe "'<,'>norm! ^i* "
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
            silent exe "! ~/.scripts/refresh_firefox.sh focus"
            silent exe "redraw!"
        else
            silent exe "! ~/.scripts/refresh_firefox.sh"
            silent exe "redraw!"
        endif
    endfunction
    "}}}

    function! Make_arrow(type) "{{{
        if a:type
            if (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ' ')
                exe "norm! a->  "
            else
                exe "norm! a ->  "
            endif
            exe "startreplace"
        else
            if (matchstr(getline('.'), '\%' . col('.') . 'c.') ==? ' ')
                exe "norm! a=>  "
            else
                exe "norm! a =>  "
            endif
            exe "startreplace"
        endif
    endfunction
    "}}}
"}}}

"{{{ File Type Specific
    "{{{ VIM
        augroup ft_vim
            au!
            au FileType vim setlocal foldmethod=indent
            au FileType vim nnoremap <buffer> <CR> <CR>
        augroup END
    "}}}

    "{{{ C/C++
        augroup ft_c_cpp
            au!
            au FileType c,cpp nnoremap <buffer><silent>gh :A<CR>
            au FileType c,cpp nnoremap <buffer><silent>gH :AS<CR>
            au FileType c inoremap ,< <ESC>:call Avr_set_bit(0)<CR>
            au FileType c inoremap << <ESC>:call Avr_set_bit(1)<CR>
            au FileType c nnoremap <buffer> gb :Make burn<CR>
        augroup END

        function! Avr_set_bit(value)
            exe "norm! bi(" . a:value ." << \<esc>wgUiWEa) \<esc>"
            exe "startinsert!"
        endfunction
    "}}}

    "{{{ SH
        augroup ft_sh
            au!
            au FileType sh setlocal foldmethod=marker
            au FileType sh setlocal foldmarker={,}
        augroup END
    "}}}

    "{{{ HELP
        augroup ft_help
            au!
            au FileType help nnoremap <buffer><silent>[[ :call Help_tag(1)<CR>
            au FileType help nnoremap <buffer><silent>]] :call Help_tag(0)<CR>
        augroup END

        function! Help_tag(reverse)
            call search('|\S\+|', a:reverse ? 'bW' : 'W')
        endfunction
    "}}}

    "{{{ HTML
        augroup ft_html
            au!
            au FileType html nnoremap <buffer><silent>gO :call Firefox_open()<CR>
            " Emmet
            au FileType html imap hh <c-j>,
        augroup END

        function! Firefox_open()
            let s:html_file = expand('%:p')
            exe "silent !firefox " . s:html_file
            exe "silent redraw!"
        endfunction
    "}}}

    "{{{ CSS
        augroup ft_css
            au!
            au FileType css setlocal foldmethod=marker
            au FileType css setlocal foldmarker={,}
            au FileType css nnoremap <buffer>g<space> :call Sort_properties()<CR>
        augroup END

        function! Sort_properties()
            exe "norm! vi{\<ESC>"
            exe "'<,'>sort"
        endfunction
    "}}}

    "{{{ JS
        augroup ft_js
            au!
            au FileType javascript setlocal foldmethod=marker
            au FileType javascript setlocal foldmarker={,}
        augroup END
    "}}}

    "{{{ ASCIIDOC
        augroup ft_asciidoc
            au!
            au FileType asciidoc nnoremap <buffer><silent>gh :call Adoc_create_header(1)<CR>
            au FileType asciidoc nnoremap <buffer><silent>gH :call Adoc_create_header(0)<CR>
            au FileType asciidoc nnoremap <buffer><silent>]] :call Next_header(0)<CR>
            au FileType asciidoc nnoremap <buffer><silent>[[ :call Next_header(1)<CR>
            au FileType asciidoc setlocal spell
            au FileType asciidoc setlocal spelllang=en
            au FileType asciidoc nnoremap <buffer><space> 1z=
        augroup END

        function! Next_header(invert)
            if a:invert == 0
                exe "norm! /\\v^[=-]+\<cr>\<esc>"
            else
                exe "norm! ?\\v^[=-]+\<cr>\<esc>"
            endif
            exe "norm! ztkj"
        endfunction

        function! Adoc_create_header(header)
            if a:header
                exe "norm! 0"
                if (getline(".")[col(".")-1] ==? "=")
                    exe "norm! I=\<esc>"
                else
                    exe "norm! I= \<esc>"
                endif
            else
                exe "norm! 0"
                if (getline(".")[col(".")] ==? " ")
                    exe "norm! 2x"
                elseif (getline(".")[col(".")-1] ==? "=")
                    exe "norm! x"
                endif
            endif
        endfunction
    "}}}

    "{{{ MARKDOWN
        augroup ft_markdown
            au!
            au FileType markdown nnoremap <buffer><silent>gh :call Md_create_header(1)<CR>
            au FileType markdown nnoremap <buffer><silent>gH :call Md_create_header(0)<CR>
            au FileType markdown nnoremap <buffer><silent>]] :call Next_header(0)<CR>
            au FileType markdown nnoremap <buffer><silent>[[ :call Next_header(1)<CR>
            au FileType markdown setlocal spell
            au FileType markdown setlocal spelllang=en
            au FileType markdown nnoremap <buffer><space> 1z=
        augroup END

        function! Next_header(invert)
            if a:invert == 0
                exe "norm! /\\v^[#-]+\<cr>\<esc>"
            else
                exe "norm! ?\\v^[#-]+\<cr>\<esc>"
            endif
            exe "norm! ztkj"
        endfunction

        function! Md_create_header(header)
            if a:header
                exe "norm! 0"
                if (getline(".")[col(".")-1] ==? "#")
                    exe "norm! I#\<esc>"
                else
                    exe "norm! I# \<esc>"
                endif
            else
                exe "norm! 0"
                if (getline(".")[col(".")] ==? " ")
                    exe "norm! 2x"
                elseif (getline(".")[col(".")-1] ==? "#")
                    exe "norm! x"
                endif
            endif
        endfunction
    "}}}

    "{{{ PO
        augroup ft_po
            au!
            au FileType po setlocal tw=76
            au FileType po nnoremap <buffer><silent>gs :call Toggle_str()<CR>
            au FileType po nnoremap <buffer><silent>]] :call Next_msgstr(0)<CR>
            au FileType po nnoremap <buffer><silent>[[ :call Next_msgstr(1)<CR>
            au FileType po nnoremap <buffer><silent>]a :call Next_a_tag(0)<CR>
            au FileType po nnoremap <buffer><silent>[a :call Next_a_tag(1)<CR>
            au FileType po nnoremap <buffer><space> 1z=
        augroup END

        function! Next_msgstr(invert)
            if a:invert == 0
                exe "norm! /\\v^msgstr\<cr>\<esc>"
            else
                exe "norm! ?\\v^msgstr\<cr>\<esc>"
            endif
            exe "norm! zz"
        endfunction

        function! Toggle_str()
            let save_fo = &fo
            set fo-=t

            exe "norm! ?\\v^msgstr.+$\\n[[:print:]]\<cr>jV}ko\<esc>^"

            let cur_char = getline(".")[col(".")-1]
            if cur_char ==? "\""
                exe "norm! gv\<esc>"
                exe "'<,'>norm! ^x$x"
                exe "'<,'>s/\\s\\+$//e"
            else
                exe "norm! gv\<esc>"
                exe "'<,'>norm! I\"\<esc>"
                exe "'<,'>norm! A \"\<esc>"
                exe "norm! jA\"\<esc>"
            endif

            let &fo = save_fo
        endfunction

        function! To_txt()
            exe "g/^\"/norm x"
            exe "g/\"$/norm $x"
            exe "call RemoveTrailingSpaces()"
            exe "g/^#/norm dd"
            exe "g/^msgid \"$/norm cc\r"
            exe "g/^msgstr \"$/norm cc\<esc>"
            exe "%s/^msgid \"/\r/"
            exe "%s/^msgstr \"/\r/"
            exe "norm ggO\<esc>72i-\<esc>"
            exe "norm Go\<esc>72i-\<esc>"
        endfunction

        function! Next_a_tag(invert)
            if a:invert == 0
                exe "norm! /\\v\\<a\<esc>v"
                exe "norm! /\\v\\</a\\>\<cr>f\>"
            else
                exe "norm! ?\\v\\<a\<esc>v"
                exe "norm! /\\v\\</a\\>\<cr>f\>o"
            endif
        endfunction
    "}}}

    "{{{ GITCOMMIT
        augroup ft_gitcommit
            au!
            au FileType gitcommit setlocal spell
            au FileType gitcommit setlocal spelllang=en
            au FileType gitcommit nnoremap <buffer><space> 1z=
            au FileType gitcommit exec "norm! gg"
        augroup END
    "}}}

    "{{{ JAVA
        augroup ft_java
            au!
            au FileType java setlocal makeprg=gradle
            au FileType java setlocal foldlevel=2
            au FileType java setlocal foldlevelstart=1
            au FileType java setlocal foldnestmax=2
            au FileType java nnoremap <buffer> <silent> g<space> :call Getter_and_setter()<CR>
        augroup END

        function! Getter_and_setter()
            exe "norm! f="
            if (getline(".")[col(".")-1] ==? "=")
                exe "norm! 0ww\"tyiWW\"vyiW"
            else
                exe "norm! 0ww\"tyiWW\"vyt;"
            endif

            exe "norm! O\<esc>j"
            exe "norm! 0C\<tab>public \<esc>\"tpa get\<esc>\"vp"
            exe "norm! Blll~A()\<cr>{\<cr>return this.\<esc>\"vpa;\<esc>"
            exe "norm! o}\<cr>"

            exe "norm! o\<esc>"
            exe "norm! 0C\<tab>public void set\<esc>\"vpBlll~A(\<esc>\"tp"
            exe "norm! a \<esc>\"vpa)\<cr>{\<cr>this.\<esc>\"vpa = \<esc>"
            exe "norm! \"vpa;\<cr>}\<esc>j"
        endfunction
    "}}}

    "{{{ MAN
        augroup ft_man
            au!
            au FileType man nnoremap <buffer><silent>[s :call Man_section(1)<CR>
            au FileType man nnoremap <buffer><silent>]s :call Man_section(0)<CR>
            au FileType man nnoremap <buffer><silent>[[ :call Man_reference(1)<CR>
            au FileType man nnoremap <buffer><silent>]] :call Man_reference(0)<CR>
            au FileType man nnoremap <buffer><nowait>d <C-d>
            au FileType man nnoremap <buffer><nowait>u <C-u>
            au FileType man nnoremap <buffer><nowait>f <C-f>
            au FileType man nnoremap <buffer><nowait>b <C-b>
            au FileType man nnoremap <buffer><nowait>e <C-e>
            au FileType man nnoremap <buffer><nowait>y <C-y>
            au FileType man nnoremap <buffer>q :q<CR>
        augroup END

        function! Man_section(reverse)
            call search('\v\n\u+', a:reverse ? 'bW' : 'W')
            exe "norm! zt"
        endfunction

        function! Man_reference(reverse)
            call search('\C[a-z0-9]\+(\d)', a:reverse ? 'bW' : 'W')
        endfunction
    "}}}

    "{{{ QUICKFIX
        augroup quickfix
            au!
            au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
        augroup END
    "}}}

    "{{{ PHP
        augroup ft_php
            au!
            au FileType php setlocal foldmethod=marker
            au FileType php setlocal foldmarker={,}
            au FileType php inoremap :: <ESC>:call Php_make_var(1)<CR>
            au FileType php inoremap ;; <ESC>:call Php_make_var(0)<CR>

            " Laravel
            au FileType php cnoreabbrev gm !php artisan generate:model
            au FileType php cnoreabbrev gc !php artisan generate:controller
            au FileType php cnoreabbrev gt !php artisan generate:test
            au FileType php cnoreabbrev gmig !php artisan generate:migration

            " Emmet
            au FileType php imap hh <c-j>,
        augroup END

        function! Php_make_var(static)
            if a:static
                exe "norm! mzBi$\<esc>`zla:: "
                exe "startinsert!"
            else
                exe "norm! mzBi$\<esc>`zla-> "
                exe "startinsert!"
            endif
        endfunction
    "}}}

    "{{{ MAIL
        augroup ft_mail
            au!
            au FileType mail setlocal spell
            au FileType mail setlocal spelllang=en
            au FileType mail nnoremap <buffer><space> 1z=
        augroup END
    "}}}

    "{{{ PAGER
        augroup ft_pager
            au!
            au FileType pager setlocal noma
            au FileType pager setlocal nospell
            au FileType pager nnoremap <buffer><nowait>q :q<CR>
            au FileType pager nnoremap <buffer><nowait>d <C-d>
            au FileType pager nnoremap <buffer><nowait>u <C-u>
            au FileType pager nnoremap <buffer><nowait>f <C-f>
            au FileType pager nnoremap <buffer><nowait>b <C-b>
            au FileType pager nnoremap <buffer><nowait>e <C-e>
            au FileType pager nnoremap <buffer><nowait>y <C-y>
            au FileType pager nnoremap <buffer><nowait>j <C-e>
            au FileType pager nnoremap <buffer><nowait>k <C-y>
        augroup END
    "}}}

    "{{{ HASKELL

        function! RunGhci(type)
            call VimuxRunCommand(" stack ghci && exit")
            if a:type
                call VimuxSendText(":l " . bufname("%"))
                call VimuxSendKeys("Enter")
            endif
        endfunction

        function! JumpHaskellFunction(reverse)
            call search('\C[[:alnum:]]*\s*::', a:reverse ? 'bW' : 'W')
        endfunction

        augroup ft_haskell
            au!
            au FileType haskell setlocal makeprg=stack
            au FileType haskell compiler ghc
            au FileType haskell setlocal omnifunc=necoghc#omnifunc
            au FileType haskell let g:fzf_tags_command = 'hasktags -c -x -R .'

            "{{{ Color
                au FileType haskell hi! haskellDecl ctermfg=27
                au FileType haskell hi! haskellDeclKeyword ctermfg=30
                au FileType haskell hi! haskellIdentifier ctermfg=129
                au FileType haskell hi! haskellOperators ctermfg=black
                au FileType haskell hi! haskellType ctermfg=32
                au FileType haskell hi! def link haskellPragma Comment
                au FileType haskell hi! haskellNumber ctermfg=166
                au FileType haskell hi! haskellImportKeywords ctermfg=136
            "}}}

            "{{{ Mappings
                " General
                au FileType haskell onoremap <silent> ia :<c-u>silent execute "normal! ?->\r:nohlsearch\rwvf-ge"<CR>
                au FileType haskell onoremap <silent> aa :<c-u>silent execute "normal! ?->\r:nohlsearch\rhvEf-ge"<CR>
                au FileType haskell nnoremap <buffer><silent> ]] :call JumpHaskellFunction(0)<CR>
                au FileType haskell nnoremap <buffer><silent> [[ :call JumpHaskellFunction(1)<CR>
                au FileType haskell nnoremap <buffer><silent> gll :write<CR> :echo "Linting..."<CR> :silent! exec "Neomake"<CR>
                au FileType haskell nnoremap <buffer><silent> gl<space> :call ToggleLocationList()<CR>
                au FileType haskell nnoremap <buffer><silent> glc :sign unplace *<CR>
                au FileType haskell nnoremap <buffer><silent> gj :write<CR> :echo "Building..."<CR> :exec "AsyncRun " . &makeprg . " build"<CR>
                au FileType haskell nnoremap <buffer><silent> gk :write<CR> :echo "Testing..."<CR> :exec "AsyncRun " . &makeprg . " test"<CR>
                au FileType haskell nnoremap <buffer><silent> gI :silent exec "keepjumps normal! gg /import \rh"<CR><ESC>:noh<CR>
                au FileType haskell nnoremap <buffer> gC :e *.cabal<CR>
                au FileType haskell nmap <silent><buffer> g<space> vii<ESC>:silent!'<,'> EasyAlign /->/<CR>
                au FileType haskell nmap <silent><buffer> <leader>gg :call RunGhci(1)<CR>
                au FileType haskell nmap <silent><buffer> <leader>gs :call RunGhci(0)<CR>

                " ghc-mod
                au FileType haskell nnoremap <silent><buffer> git :GhcModTypeInsert<CR>
                au FileType haskell nnoremap <silent><buffer> gfs :GhcModSplitFunCase<CR>
                au FileType haskell nnoremap <silent><buffer> gtt :GhcModType<CR>

                " Arrows
                au FileType haskell inoremap <buffer> ;; <C-]><ESC>:call Make_arrow(1)<CR>
                au FileType haskell inoremap <buffer> ;: <C-]><ESC>:call Make_arrow(0)<CR>
            "}}}

            "{{{ Types Abbreviations
                au FileType haskell inoreab <buffer> int Int
                au FileType haskell inoreab <buffer> integer Integer
                au FileType haskell inoreab <buffer> string String
                au FileType haskell inoreab <buffer> double Double
                au FileType haskell inoreab <buffer> float Float
                au FileType haskell inoreab <buffer> bool Bool
                au FileType haskell inoreab <buffer> true True
                au FileType haskell inoreab <buffer> false False
                au FileType haskell inoreab <buffer> maybe Maybe
                au FileType haskell inoreab <buffer> just Just
                au FileType haskell inoreab <buffer> nothing Nothing
                au FileType haskell inoreab <buffer> io IO ()
            "}}}
        augroup END
    "}}}

    "{{{ RUST
        augroup ft_rust
            au!
            au FileType rust setlocal makeprg=cargo
            au FileType rust nnoremap <buffer> gj :w<CR> :Neomake<CR>
            au FileType rust nnoremap <buffer> gk :w<CR> :Dispatch test<CR>
            au FileType rust nnoremap <buffer> gs :w<CR>
            au FileType rust inoremap <buffer> ;: <ESC>:call Make_arrow(0)<CR>
            au FileType rust inoremap <buffer> ;; <ESC>:call Make_arrow(1)<CR>
        augroup END
    "}}}

    "{{{ ASM
        augroup ft_asm
            au!
            au FileType asm setlocal commentstring=;\ %s
            au FileType pic8 setlocal commentstring=;\ %s
        augroup END
    "}}}

    "{{{ TEX
        augroup ft_tex
            au!
            au FileType tex nnoremap <buffer><space> 1z=
        augroup END
    "}}}

    "{{{ PURESCRIPT
        function! RunPsci(type)
            call VimuxRunCommand(" pulp psci && exit")
            if a:type
                call VimuxSendText(":l " . bufname("%"))
                call VimuxSendKeys("Enter")
            endif
        endfunction

        augroup ft_purescript
            au!
            au FileType purescript setlocal makeprg=pulp
            au FileType purescript compiler ghc
            au FileType purescript setlocal omnifunc=necoghc#omnifunc
            au FileType purescript let g:fzf_tags_command = 'hasktags -c -x -R .'

            " General
            au FileType purescript onoremap <silent> ia :<c-u>silent execute "normal! ?->\r:nohlsearch\rwvf-ge"<CR>
            au FileType purescript onoremap <silent> aa :<c-u>silent execute "normal! ?->\r:nohlsearch\rhvEf-ge"<CR>
            au FileType purescript nnoremap <buffer><silent> ]] :call JumpHaskellFunction(0)<CR>
            au FileType purescript nnoremap <buffer><silent> [[ :call JumpHaskellFunction(1)<CR>
            au FileType purescript nnoremap <buffer><silent> gj :write<CR> :echo "Building..."<CR> :exec "AsyncRun " . &makeprg . " build"<CR>
            au FileType purescript nnoremap <buffer><silent> gk :write<CR> :echo "Testing..."<CR> :exec "AsyncRun " . &makeprg . " test"<CR>
            au FileType purescript nnoremap <buffer><silent> gI :silent exec "keepjumps normal! gg /import \rh"<CR><ESC>:noh<CR>
            au FileType purescript nnoremap <buffer><silent> ght :!hasktags -c -x -R .<CR>
            au FileType purescript nmap <silent><buffer> g<space> :call Sort_imports()<CR>
            au FileType purescript nmap <silent><buffer> <leader>gg :call RunPsci(1)<CR>
            au FileType purescript nmap <silent><buffer> <leader>gs :call RunPsci(0)<CR>

            " Arrows
            au FileType purescript inoremap <buffer> ;; <C-]><ESC>:call Make_arrow(1)<CR>
            au FileType purescript inoremap <buffer> ;: <C-]><ESC>:call Make_arrow(0)<CR>
        augroup END
    "}}}
"}}}


" vim:fdm=marker
