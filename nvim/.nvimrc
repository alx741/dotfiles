"{{{ VIM-PLUG
    call plug#begin('~/.nvim/plugged')
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-dispatch'
    Plug 'Valloric/YouCompleteMe'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'scrooloose/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-scripts/taglist.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'thanthese/Tortoise-Typing'
    Plug 'mbbill/undotree'
    Plug 'alx741/vinfo'
    Plug 'godlygeek/tabular'
    Plug 'bruno-/vim-man'
    Plug 'altercation/vim-colors-solarized'
    Plug 'junegunn/goyo.vim'
    Plug 'tommcdo/vim-exchange'
    Plug 'SirVer/ultisnips'
    Plug 'othree/html5.vim'
    Plug 'jaxbot/browserlink.vim'
    Plug 'alvan/vim-closetag'
    Plug 'edsono/vim-matchit'
    Plug 'mihaifm/bufstop'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'benekastah/neomake'
    Plug 'LucHermitte/vim-refactor'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
    Plug 'jiangmiao/auto-pairs'

    " On-demand loading
    Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
    Plug 'thanthese/Tortoise-Typing', { 'on': 'TortoiseTyping' }
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    Plug 'alx741/vinfo', { 'on': 'Vinfo' }
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    Plug 'bruno-/vim-man', { 'on': 'Man' }
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    call plug#end()
"}}}

"{{{ Auto Commands
    " Reset format options when filetypes are loaded
    autocmd FileType * set formatoptions=tcrql

    " Trigger StyleMarks
    autocmd VimEnter,BufWinEnter,BufWinLeave * call StyleMarks()

    " Trigger Neomake on save
    autocmd! BufWritePost * Neomake
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

    " Keep search matces in the middle of the window
    nnoremap n nzzzv
    nnoremap N Nzzzv

    " Make [s position in the last char of the misspelled word
    nnoremap [s [sh

    " Search for visual selected area
    vnoremap // y/<C-R>"<CR>

    " Y is y$
    nnoremap Y y$

    " Viasual select last pasted text
    nnoremap gp `[v`]

    " Terminal mode leaving
    tnoremap <esc> <C-\><C-n>

    " Toggle folds
    nnoremap <space> za

    " Ofuscate
    nnoremap <leader><cr> mzggg?G`z

    " Buffers [bufstop]
    nnoremap <c-\> :BufstopFast<cr>

    " Remove highlights using escape (this prevent using especial keys mappings!)
    nnoremap <silent><esc> :noh<CR><esc>

    "{{{ LEADER mappings
        " Remove trailing white spaces ( \w )
        nnoremap <silent><leader>w :call RemoveTrailingSpaces() <CR>
        " Format document
        nnoremap <silent><leader>f :call Format() <CR>
        " Toggle spelling ( \s )
        nnoremap <leader>s :call ToggleSpell() <cr>
        " Trigger TagList plugin ( \t )
        nnoremap <silent><leader>t :TlistToggle <cr>
        " Trigger UndoTree plugin ( \u )
        nnoremap <silent><leader>u :UndotreeToggle <cr>
        " Trigger NerdTree plugin ( \n )
        nnoremap <silent><leader>n :NERDTreeToggle <cr>
        " Toggle line number
        nnoremap <silent><leader>\ :call NumberToggle()<cr>
        " Trigger Ctags program for the current directory
        nnoremap <silent><leader>c :!ctags -R . <cr>
    "}}}
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
    set timeoutlen=1000
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
    set cindent
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
    set undodir=~/.nvim/tmp/undo/
    set backupdir=~/.nvim/tmp/backup/
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

    "{{{ YouCompleteMe
        let g:ycm_key_list_select_completion=[]
        let g:ycm_key_list_previous_completion=[]
    "}}}
"}}}

"{{{ Misc
    " Set SDCC paths
    set path+=/usr/share/sdcc/include/pic14,/usr/share/sdcc/include/pic16
    set path+=/usr/share/sdcc/non-free/include/pic14,/usr/share/sdcc/non-free/include/pic16

    " Sudo Write
    command! W w !sudo tee % >/dev/null
"}}}

"{{{ Personal functions
    " Help files tags jump
    " [g , ]g
    nmap [g <Plug>unimpairedHelpTagPrevious
    nmap ]g <Plug>unimpairedHelpTagNext

    nnoremap <silent> <Plug>unimpairedHelpTagPrevious :call <SID>HelpTag(1)<CR>
    nnoremap <silent> <Plug>unimpairedHelpTagNext     :call <SID>HelpTag(0)<CR>

    function! s:HelpTag(reverse)
      call search('|\S\+|', a:reverse ? 'bW' : 'W')
    endfunction


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


    " Remove trailing white spaces
    function! RemoveTrailingSpaces()
        silent! execute 'norm! mz'
        silent! execute '%s/\s\+$//ge'
        silent! execute 'g/\v^$\n*%$/norm! dd'
        silent! execute 'norm! `z'
    endfunction


    " Toggle { NOSPELL, EN, ES } spelling
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


    " Marks over-length lines and trailing white spaces as errors
    function! StyleMarks()
        highlight OverLength ctermbg=blue ctermfg=white
        call matchadd('OverLength', '\%81v.\+', 100)

        highlight Trailing ctermbg=blue ctermfg=white
        call matchadd('Trailing', '\s\+$', 100)

        highlight Debugme ctermbg=red ctermfg=white
        call matchadd('Debugme', 'debugme', 100)
        call matchadd('Debugme', 'DEBUGME', 100)
    endfunction


    " Toggle relative line numbers
    function! NumberToggle()
        if &relativenumber ==? 1
            set norelativenumber
        else
            set relativenumber
        endif
    endfunction
"}}}

" vim:fdm=marker
