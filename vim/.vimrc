"{{{ VUNDLE
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " The plugins that i use
    Plugin 'gmarik/vundle'
    Plugin 'wellle/targets.vim'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-repeat'
    Plugin 'michaeljsmith/vim-indent-object'
    Plugin 'scrooloose/syntastic'
    Plugin 'vim-scripts/taglist.vim'
    Plugin 'kien/ctrlp.vim'
    Plugin 'thanthese/Tortoise-Typing'
    Plugin 'mbbill/undotree'
    Plugin 'alx741/vinfo'
    Plugin 'godlygeek/tabular'
    Plugin 'bruno-/vim-man'
    Plugin 'altercation/vim-colors-solarized'

    call vundle#end()

    " Now we can turn our filetype functionality back on
    filetype plugin indent on

    " Re set format options when filetypes are loaded
    autocmd FileType * set formatoptions=crql
"}}}


"{{{ Maps
    " Get raid of vim 'exclusivity' madness
    " All movements are now inclusive
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

    " Move with visual lines
    nnoremap j gj
    nnoremap k gk
    nnoremap J gJ
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$

    " Toggle folds
    nnoremap <space> za

    " Remove highlights using escape (this prevent using especial keys mappings!)
    nnoremap <silent><esc> :noh<CR><esc>

    """"  LEADER mappings
    " Remove trailing white spaces ( \w )
    map <silent><leader>w :call DeleteTrailingWS() <CR>
    " Toggle spelling ( \s )
    nnoremap <leader>s :set spell! <cr>
    " Trigger TagList plugin ( \t )
    nnoremap <leader>t :TlistToggle <cr>
    " Trigger UndoTree plugin ( \u )
    nnoremap <leader>u :UndotreeToggle <cr>
    " Trigger NerdTree plugin ( \n )
    nnoremap <leader>n :NERDTreeToggle <cr>
    " Trigger Ctags program for the current directory
    nnoremap <silent><leader>c :!ctags -R . <cr>
    " Toggle semantic highlighting
    nnoremap <silent><leader>h :SemanticHighlightToggle<cr>
"}}}


"{{{ Options and Configurations
    " Status line
    set statusline=[%n]\ %t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]
    set statusline+=\ [ft=%Y]\ %r\ %m
    set statusline+=%=%c:%l/%L\ %P

    " Color column
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

    " Get this from http://www.github.com/alx741/badwolf (modified version)
    colors solarized

    " Check the documentation for this ones
    syntax on
    syntax spell toplevel
    set t_CO=16
    set lazyredraw
    set textwidth=80
    set timeoutlen=1000 ttimeoutlen=0
    set cursorline
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set showcmd
    set completeopt-=preview
    set completeopt+=longest
    set number
    set showmatch
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set backspace=2
    set autoindent
    set cindent
    set ruler
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
    set foldnestmax=3
    " set foldlevel=3
    let c_no_comment_fold=1

    " Formatting options:
    "  * Auto wrap comments using textwith
    "  * Auto insert comment leader while inserting
    "  * Allow 'gq' in comments * Don't auto brake lines
    set formatoptions=crql

    " Config the backup system
    set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set writebackup
"}}}


"{{{ Plugins configuration
    " Vim Airline tab bar enabled
    " let g:airline#extensions#tabline#enabled = 1

    " Syntastic
    let $PYTHONPATH='/usr/lib/python3.4/site-packages'
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

    " Targets
    let g:targets_aiAI = 'aIAi'

    "}}}


"{{{ Misc
    " Set SDCC paths
    set path+=/usr/share/sdcc/include/pic14,/usr/share/sdcc/include/pic16
    set path+=/usr/share/sdcc/non-free/include/pic14,/usr/share/sdcc/non-free/include/pic16

    " Mark trailing white spaces as errors
    match ErrorMsg '\s\+$'

    " Sudo Write
    command W w !sudo tee % >/dev/null
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

    " Function for removing trailing white spaces
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc
"}}}

" vim:fdm=marker