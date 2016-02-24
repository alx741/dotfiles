"{{{ VIM-PLUG
    call plug#begin('~/.config/nvim/plugged')
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'LucHermitte/vim-refactor'
    Plug 'SirVer/ultisnips'
    Plug 'altercation/vim-colors-solarized'
    Plug 'alvan/vim-closetag'
    Plug 'alx741/vinfo'
    Plug 'benekastah/neomake'
    Plug 'edsono/vim-matchit'
    Plug 'ggVGc/vim-fuzzysearch'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'jaxbot/browserlink.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'kana/vim-textobj-user'
    Plug 'kennykaye/vim-relativity'
    Plug 'kien/ctrlp.vim'
    Plug 'mbbill/undotree'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'othree/html5.vim'
    Plug 'rking/ag.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
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
    Plug 'wellle/targets.vim'
    Plug 'xolox/vim-easytags'
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

    " On-demand loading
    Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
    Plug 'thanthese/Tortoise-Typing', { 'on': 'TortoiseTyping' }
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    call plug#end()
"}}}

"{{{ Global Auto Commands
    augroup global_au
        au!
        " Reset format options when filetypes are loaded
        au FileType * set formatoptions=tcrql
        " Trigger Neomake on save
        " au BufWritePost * Neomake
    augroup END
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
        nnoremap <silent><leader><space> :NERDTreeToggle<CR>
        nnoremap <silent><leader><leader> :UndotreeToggle<CR>

        "{{{ Dotfiles editing
            nnoremap <silent><leader>ev :e ~/.config/nvim/init.vim<CR>
            nnoremap <silent><leader>et :e ~/.tmux.conf<CR>
            nnoremap <silent><leader>er :e ~/.ratpoisonrc<CR>
            nnoremap <silent><leader>ez :e ~/.zshrc<CR>
            nnoremap <silent><leader>ex :e ~/.xinitrc<CR>
        "}}}
    "}}}

    nnoremap <c-k> <c-w>k
    nnoremap <c-j> <c-w>j
    nnoremap <c-l> <c-w>l
    nnoremap <BS> <C-W>h
    " Some day C-H vs <BS> will be fixed, i hope...
    " nnoremap <c-h> <c-w>h

    nnoremap } }zz
    nnoremap { {zz
    nnoremap <NUL> <c-^>
    nnoremap Q :CtrlP<CR>
    nnoremap gs :w<CR>
    nnoremap gS :wq<CR>
    nnoremap gbb :w<CR> :Neomake!<CR>
    nnoremap gbc :Make! clean<CR>
    nnoremap gbs :w<CR> :Neomake<CR>
    nnoremap <c-z> <c-x>
    nnoremap z<space> 1z=
    nnoremap <silent>g= :call Format()<CR>
    nnoremap Y y$
    nnoremap <space> za
    nnoremap <expr>S ':%s/' . @/ . '//<LEFT>'
    nnoremap <leader><CR> mzggg?G`z
    nnoremap <silent> J :call Join()<CR>
    nnoremap <silent><esc> :noh<CR> :call sneak#hl#removehl()<CR><esc>
    nnoremap <silent> gl :set opfunc=Listify<CR>g@
    vnoremap <silent> gl :<c-u>call Listify(visualmode(), 1)<CR>
    nnoremap <silent> zs :call Translate(expand("<cword>"), "es")<CR>
    nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>
    nnoremap <C-\> :call ToggleQuickfixList()<CR>
    nnoremap gp `[v`]
    vnoremap // y/<C-R>"<CR>
    inoremap <C-f> <C-x>


    " X Clipboard yanking/pasting
    nnoremap <C-c>p "+p
    nnoremap <C-c>y "+y
    nnoremap <C-c>Y "+Y
    vnoremap <C-c>y "+y
    inoremap <C-r>c <C-r>+

    " Terminal mode leaving
    if has('nvim')
        tnoremap <esc> <C-\><C-n>
    endif
"}}}

"{{{ Status line and Color
    set statusline=[%n]\ %t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]
    set statusline+=\ [ft=%Y]\ %r\ %m

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

"{{{ Options
    filetype plugin indent on
    let c_no_comment_fold=1
    set autoindent
    set autoread
    set background=light
    set backspace=2
    set complete=.,w,b,u,t
    set completeopt+=longest
    set completeopt-=noinsert
    set completeopt-=preview
    set encoding=utf-8
    set expandtab
    set foldenable
    set foldlevel=2
    set foldlevelstart=1
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
    set showmatch
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
    syntax on
    syntax spell toplevel

    if !has('nvim')
        set encoding=utf-8
    endif

    " Persistent undo
    set undolevels=5000
    set undofile
"}}}

"{{{ Backup System
    set backup
    set undofile
    set noswapfile
    set undodir=~/.config/nvim/tmp/undo/
    set backupdir=~/.config/nvim/tmp/backup/
    set backupskip=/tmp/*,/private/tmp/*
    set writebackup
"}}}

"{{{ Plugins configuration
    "{{{ Syntastic
        let $PYTHONPATH='/usr/lib/python3.4/site-packages'
        let g:syntastic_mode_map = {
            \ 'mode' : 'passive',
            \ 'active_filetypes' : [],
            \ 'passive_filetypes' : [] }
    "}}}

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

    "{{{ AutoPairs
        let g:AutoPairs = {'{': '}'}
    "}}}

    "{{{ CtrlP
        let g:ctrlp_cmd = 'CtrlPBuffer'
    "}}}

    "{{{ Better-whitespace
        let g:better_whitespace_filetypes_blacklist=['man', 'info', 'help']
        let g:better_whitespace_filetypes_blacklist+=['gitcommit', 'po', 'diff']
        let g:better_whitespace_filetypes_blacklist+=['unite', 'qf', 'neoman']
    "}}}

    "{{{ Lengthmatters
        let g:lengthmatters_excluded=['man', 'info', 'help', 'neoman']
    "}}}

    "{{{ Easytags
        let g:easytags_async = 1
    "}}}

    "{{{ EasyAlign
        nmap ga <Plug>(EasyAlign)
        xmap ga <Plug>(EasyAlign)
    "}}}

    "{{{ Sneak
        nmap fj <Plug>Sneak_s
        nmap Fj <Plug>Sneak_S
        xmap fj <Plug>Sneak_s
        xmap Fj <Plug>Sneak_S
        omap fj <Plug>Sneak_s
        omap Fj <Plug>Sneak_S
    "}}}
"}}}

"{{{ Path
    " SDCC
    set path+=/usr/share/sdcc/include/pic14,/usr/share/sdcc/include/pic16
    set path+=/usr/share/sdcc/non-free/include/pic14,/usr/share/sdcc/non-free/include/pic16
"}}}

"{{{ Global Commands
    command! W w !sudo tee % >/dev/null
"}}}

"{{{ Global Functions
    function! Format()
        " * Removes trailing white spaces
        " * Removes blank lines at the end of the file
        " * Replaces tabs with spaces
        " * Re-Indent
        "
        " * If: C, CPP, PHP or JAVA code: format using 'astyle'
        "
        " * Leaves 'formatprg' option clean so `gq` can be used with the default
        "   behavior
        silent! execute 'norm! mz'

        if &ft ==? 'c' || &ft ==? 'cpp' || &ft ==? 'php'
            set formatprg=astyle\ --mode=c
            silent! execute 'norm! gggqG'
        elseif &ft ==? 'java'
            set formatprg=astyle\ --mode=java
            silent! execute 'norm! gggqG'
        endif

        silent! call RemoveTrailingSpaces()
        silent! execute 'retab'
        silent! execute 'gg=G'
        silent! execute 'norm! `z'
        set formatprg=
    endfunction


    function! RemoveTrailingSpaces()
        silent! execute '%s/\s\+$//ge'
        silent! execute 'g/\v^$\n*%$/norm! dd'
    endfunction


    function! ToggleSpell()
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


    function! NumberToggle()
        if &relativenumber ==? 1
            set norelativenumber
        else
            set relativenumber
        endif
    endfunction


    function! Listify(type, ...)
        if a:0
            exe "'<,'>norm! I* "
        else
            exe "norm! '[V']\<esc>"
            exe "'<,'>norm! ^i* "
        endif
    endfunction


    " Needs https://github.com/soimort/translate-shell
    function! Translate(text, to_lang)
        if a:to_lang ==? "es"
            exe "!trans -b en:es \"" . a:text . "\""
        else
            exe "!trans -b es:en \"" . a:text . "\""
        endif
    endfunction

    function! Join()
        let next_line = getline(line('.')+1)
        if next_line =~? "^$"
            exec "silent norm! gJ"
        else
            exec "silent norm! J"
        endif
    endfunction
"}}}

"{{{ File Type Specific
    "{{{ VIM
        augroup ft_vim
            au!
            au FileType vim setlocal foldmethod=indent
        augroup END
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
            au FileType html nnoremap <buffer><silent>go :call Firefox_open()<CR>
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
            au FileType css nnoremap <buffer>gs :call Sort_properties()<CR>
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

    "{{{ MARKDOWN
        augroup ft_markdown
            au!
            au FileType markdown nnoremap <buffer><silent>gH :call Create_header("h1")<CR>
            au FileType markdown nnoremap <buffer><silent>gh :call Create_header("h2")<CR>
            au FileType markdown nnoremap <buffer><silent>]] :call Next_header(0)<CR>
            au FileType markdown nnoremap <buffer><silent>[[ :call Next_header(1)<CR>
            au FileType markdown setlocal spell
            au FileType markdown setlocal spelllang=en
            au FileType markdown nnoremap <buffer><space> 1z=
        augroup END

        function! Next_header(invert)
            if a:invert == 0
                exe "norm! /\\v^[=-]+$\<cr>\<esc>"
            else
                exe "norm! ?\\v^[=-]+$\<cr>\<esc>"
            endif
            exe "norm! ztkj"
        endfunction

        function! Create_header(header)
            if a:header ==? "h1"
                exe "norm! yypVr="
            elseif a:header ==? "h2"
                exe "norm! yypVr-"
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
                exe "norm! gvok\<esc>"
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
        augroup END
    "}}}

    "{{{ JAVA
        augroup ft_java
            au!
            au FileType java setlocal foldlevel=2
            au FileType java setlocal foldlevelstart=1
            au FileType java setlocal foldnestmax=2
        augroup END

        function! Getter_and_setter()
            exe "norm! 0ww\"tyiWw\"vyt;"

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
        augroup ft_sh
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
            au FileType man nnoremap <buffer>q :call Close_man()<CR>
        augroup END

        function! Close_man()
            let number_of_buffers=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

            if (number_of_buffers == 0)
                exec "q"
            else
                exec "tabclose"
            endif
        endfunction

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
"}}}


" vim:fdm=marker
