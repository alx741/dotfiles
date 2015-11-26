"{{{ VIM-PLUG
    call plug#begin('~/.config/nvim/plugged')
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'LucHermitte/vim-refactor'
    Plug 'SirVer/ultisnips'
    Plug 'altercation/vim-colors-solarized'
    Plug 'alvan/vim-closetag'
    Plug 'alx741/vinfo'
    Plug 'benekastah/neomake'
    Plug 'bruno-/vim-man'
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
    Plug 'vim-scripts/filestyle'
    Plug 'vim-scripts/taglist.vim'
    Plug 'wellle/targets.vim'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
    Plug 'vimwiki/vimwiki'

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
        au BufWritePost * Neomake
    augroup END
"}}}

"{{{ Maps
    "{{{ All movements are inclusive
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
        nnoremap J gJ
        nnoremap 0 g0
        nnoremap ^ g^
        nnoremap $ g$
    "}}}

    "{{{ LEADER mappings
        " Remove trailing white spaces ( \w )
        nnoremap <silent><leader>w :call RemoveTrailingSpaces()<CR>
        " Format document
        nnoremap <silent><leader>f :call Format()<CR>
        " Toggle spelling ( \s )
        nnoremap <leader>s :call ToggleSpell()<CR>
        " Trigger TagList plugin ( \t )
        nnoremap <silent><leader>t :TlistToggle<CR>
        " Trigger UndoTree plugin ( \u )
        nnoremap <silent><leader>u :UndotreeToggle<CR>
        " Trigger NerdTree plugin ( \n )
        nnoremap <silent><leader>n :NERDTreeToggle<CR>
        " Toggle line number
        nnoremap <silent><leader>\ :call NumberToggle()<CR>
        " Trigger Ctags program for the current directory
        nnoremap <silent><leader>c :!ctags -R .<CR>

        "{{{ Dotfiles editing
            nnoremap <silent><leader>ev :e ~/.config/nvim/init.vim<CR>
            nnoremap <silent><leader>et :e ~/.tmux.conf<CR>
            nnoremap <silent><leader>er :e ~/.ratpoisonrc<CR>
            nnoremap <silent><leader>ez :e ~/.zshrc<CR>
        "}}}
    "}}}

    " Keep search matces in the middle of the window
    nnoremap n nzzzv
    nnoremap N Nzzzv

    " Search for visual selected area
    vnoremap // y/<C-R>"<CR>

    " Y is y$
    nnoremap Y y$

    " Visual select last pasted text
    nnoremap gp `[v`]

    " Terminal mode leaving
    tnoremap <esc> <C-\><C-n>

    " Toggle folds
    nnoremap <space> za

    " Ofuscate
    nnoremap <leader><CR> mzggg?G`z

    " Ctrl-p buffers
    nnoremap <cr> :CtrlPBuffer<CR>

    " Remove highlights using escape
    nnoremap <silent><esc> :noh<CR><esc>

    " Listify
    nnoremap <silent> gl :set opfunc=Listify<CR>g@
    vnoremap <silent> gl :<c-u>call Listify(visualmode(), 1)<CR>

    " Translate
    nnoremap <silent> zs :call Translate(expand("<cword>"), "es")<CR>
    nnoremap <silent> ze :call Translate(expand("<cword>"), "en")<CR>

    " Move trough splits
    nnoremap <c-k> <c-w>k
    nnoremap <c-j> <c-w>j
    nnoremap <c-l> <c-w>l
    nnoremap <BS> <C-W>h
    " Some day C-H vs <BS> will be fixed, i hope...
    " nnoremap <c-h> <c-w>h

    " Avoid SIGTSTP
    nnoremap <c-z> <c-x>

    " Use the first spell suggestion
    nnoremap 1<space> 1z=
"}}}

"{{{ Status line and Color
    " Status line
    set statusline=[%n]\ %t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]
    set statusline+=\ [ft=%Y]\ %r\ %m
    set statusline+=%=%c:%l/%L\ %P

    " Color scheme
    colors solarized
"}}}

"{{{ Options and Configurations
    "Runtimepath
    set runtimepath+=~/,

    " Filetype
    filetype plugin indent on

    " Set various options
    syntax on
    syntax spell toplevel
    set t_CO=16
    set encoding=utf-8
    set lazyredraw
    set textwidth=80
    set linebreak
    set timeout
    set timeoutlen=500
    set ttimeout
    set ttimeoutlen=0
    " set cursorline
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set showmode
    set showcmd
    set complete=.,w,b,u,t
    set completeopt-=preview
    set completeopt+=longest
    set number
    set relativenumber
    set showmatch
    set hlsearch
    set incsearch
    set ignorecase
    set gdefault
    set smartcase
    set backspace=2
    set autoindent
    set ruler
    set shiftround
    set autoread
    set nojoinspaces
    set background=light
    set wrapscan
    set laststatus=2
    set wildmenu
    set wildmode=longest,list,full
    set wildignore=*.o,*.class
    set hidden
    set foldenable
    set foldmethod=syntax
    set foldnestmax=1
    set foldlevel=2
    set foldlevelstart=1
    let c_no_comment_fold=1

    " Formatting options:
    "  * Auto wrap text using textwidth
    "  * Auto wrap comments using textwidth
    "  * Auto insert comment leader while inserting
    "  * Auto formatting of paragraphs
    "  * Don't auto brake lines
    set formatoptions=tcrql
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
        let g:ctrlp_cmd = 'CtrlP'
    "}}}

    "{{{ FileStyle
        let g:filestyle_ignore = ['man', 'info', 'help', 'gitcommit', 'po']
    "}}}

    "{{{ Easytags
        let g:easytags_async = 1
    "}}}

    "{{{ EasyAlign
        nmap ga <Plug>(EasyAlign)
        xmap ga <Plug>(EasyAlign)
    "}}}
"}}}

"{{{ Misc
    " Set SDCC paths
    set path+=/usr/share/sdcc/include/pic14,/usr/share/sdcc/include/pic16
    set path+=/usr/share/sdcc/non-free/include/pic14,/usr/share/sdcc/non-free/include/pic16

    " Sudo Write
    command! W w !sudo tee % >/dev/null
"}}}

"{{{ General Functions
    " Format document
    "
    " * Removes trailing white spaces
    " * Removes blank lines at the end of the file
    " * Replaces tabs with spaces
    " * Re-Indent
    "
    " * If: C, CPP, PHP or JAVA code: format using 'astyle'
    "
    " * Leaves 'formatprg' option clean so `gq` can be used with the default
    "   behavior
    function! Format()
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
        silent! execute 'norm! mz'
        silent! execute '%s/\s\+$//ge'
        silent! execute 'g/\v^$\n*%$/norm! dd'
        silent! execute 'norm! `z'
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
            exe "'<,'>norm! I- "
        else
            exe "norm! '[V']\<esc>"
            exe "'<,'>norm! ^i- "
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
"}}}

"{{{ File Specific
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
        augroup END
    "}}}
"}}}


" vim:fdm=marker
