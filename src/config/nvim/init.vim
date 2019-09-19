" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------

set nocompatible               " Don't make Vim vi-compatibile.

syntax on                      " Enable syntax highlighting.

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection.
    "           │     └───────── Enable loading of indent file.
    "           └─────────────── Enable loading of plugin files.
endif

set autoindent                 " Copy indent to the new line.

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode.

set backupdir=~/.cache/vim/backups  " Set directory for backup files.

set backupskip=/tmp/*          " ┐ Don't create backups
set backupskip+=/private/tmp/* " ┘ for certain files.

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register.
    set clipboard+=unnamedplus " │
endif                          " ┘

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text.

set colorcolumn=73             " Highlight certain column(s).
set cursorline                 " Highlight the current line.
set directory=~/.cache/vim/swaps    " Set directory for swap files.
set encoding=utf-8 nobomb      " Use UTF-8 without BOM.
set fillchars+=vert:│          " Set vertical separator.
set history=5000               " Increase command line history.
set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set laststatus=2               " Always show the status line.

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

set listchars=eol:↵            " ┐
set listchars+=extends:→       " │
set listchars+=nbsp:§          " │ Use custom symbols to
set listchars+=precedes:←      " │ represent invisible characters.
set listchars+=space:·         " │
set listchars+=tab:>-          " │
set listchars+=trail:◦         " ┘

set magic                      " Enable extended regexp.
set mouse=a                    " Enable mouse.
set mousehide                  " Hide mouse pointer while typing.
set noerrorbells               " Disable error bells.

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`.

set nostartofline              " Kept the cursor on the same column.
set number                     " Show line number.

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`.

set relativenumber             " Set relative line number
set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position.

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen.

set shortmess=aAItW            " Avoid all the hit-enter prompts.
set showcmd                    " Show the command being typed.
set showmode                   " Show current mode.
set spelllang=en_us            " Set the spellchecking language.

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines).

set textwidth=72               " Wrap text at column 72

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings.
set shiftwidth=4               " │
set expandtab                  " ┘

set t_ut=                      " Disable Background Color Erase (BCE)
set ttyfast                    " Enable fast terminal connection.
set undodir=~/.cache/vim/undos      " Set directory for undo files.
set undofile                   " Automatically save undo history.

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).

set winminheight=0             " Allow windows to be squashed.



" ----------------------------------------------------------------------
" | Helper Functions                                                   |
" ----------------------------------------------------------------------

function! ChangeTheme(themeId)

    if ( a:themeId == 1 )

        " PaperColor theme

        set background=light           " Use colors that look good
        silent! colorscheme PaperColor " Use custom color scheme.

        highlight ColorColumn
            \ term=NONE
            \ cterm=NONE  ctermbg=254    ctermfg=NONE
            \ gui=NONE    guibg=#e4e4e4  guifg=NONE

        " Set comment color to grey
        highlight Comment
            \ term=NONE
            \ cterm=italic  ctermbg=NONE   ctermfg=246
            \ gui=italic    guibg=NONE     guifg=#949494

        " Highlight current word (vim_current_word)
        highlight CurrentWord
            \ term=NONE
            \ cterm=underline  ctermbg=220    ctermfg=NONE
            \ gui=underline    guibg=#ffd700  guifg=NONE

         " Highlight twin word (vim_current_word)
        highlight CurrentWordTwins
            \ term=NONE
            \ cterm=underline  ctermbg=253    ctermfg=NONE
            \ gui=underline    guibg=#dadada  guifg=NONE

        highlight CursorLine
            \ term=NONE
            \ cterm=NONE  ctermbg=252    ctermfg=NONE
            \ gui=NONE    guibg=#d0d0d0  guifg=NONE

        highlight CursorLineNr
            \ term=NONE
            \ cterm=bold  ctermbg=NONE   ctermfg=130
            \ gui=bold    guibg=#073642  guifg=#af5f00

        highlight LineNr
            \ term=NONE
            \ cterm=NONE  ctermbg=NONE   ctermfg=249
            \ gui=NONE    guibg=#073642  guifg=#839497

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Statusline highlighting

        highlight SLBuffer
            \ term=NONE
            \ cterm=NONE  ctermbg=178    ctermfg=232
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLFilePath
            \ term=NONE
            \ cterm=bold  ctermbg=240    ctermfg=211
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLSeparator
            \ term=NONE
            \ cterm=NONE  ctermbg=237    ctermfg=250
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLFileType
            \ term=NONE
            \ cterm=NONE  ctermbg=238    ctermfg=250
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLRowColumns
            \ term=NONE
            \ cterm=NONE  ctermbg=240    ctermfg=251
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLRulerPercent
            \ term=NONE
            \ cterm=NONE  ctermbg=241    ctermfg=251
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

    else

        " Neodark theme

        silent! colorscheme neodark    " Use custom color scheme.

        let g:neodark#use_256color = 1
        let g:neodark#background = '#202020'
        let g:neodark#solid_vertsplit = 1

        highlight ColorColumn
            \ term=NONE
            \ cterm=NONE  ctermbg=237    ctermfg=NONE
            \ gui=NONE    guibg=#3a3a3a  guifg=NONE

        " Set comment color to grey
        highlight Comment
            \ term=NONE
            \ cterm=italic  ctermbg=NONE   ctermfg=242
            \ gui=italic    guibg=NONE     guifg=#585858

        " Highlight current word (vim_current_word)
        highlight CurrentWord
            \ term=NONE
            \ cterm=underline  ctermbg=53     ctermfg=NONE
            \ gui=underline    guibg=#5f005f  guifg=NONE

         " Highlight twin word (vim_current_word)
        highlight CurrentWordTwins
            \ term=NONE
            \ cterm=underline  ctermbg=238    ctermfg=NONE
            \ gui=underline    guibg=#444444  guifg=NONE

        highlight CursorLine
            \ term=NONE
            \ cterm=NONE  ctermbg=239    ctermfg=NONE
            \ gui=NONE    guibg=#4e4e4e  guifg=NONE

        highlight CursorLineNr
            \ term=NONE
            \ cterm=bold  ctermbg=NONE   ctermfg=130
            \ gui=bold    guibg=NONE     guifg=#af5f00

        highlight LineNr
            \ term=NONE
            \ cterm=NONE  ctermbg=NONE   ctermfg=241
            \ gui=NONE    guibg=NONE     guifg=#b2b2b2

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Statusline highlighting

        highlight SLBuffer
            \ term=NONE
            \ cterm=NONE  ctermbg=178    ctermfg=232
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLFilePath
            \ term=NONE
            \ cterm=bold  ctermbg=244    ctermfg=52
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLSeparator
            \ term=NONE
            \ cterm=NONE  ctermbg=248    ctermfg=237
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLFileType
            \ term=NONE
            \ cterm=NONE  ctermbg=247    ctermfg=235
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLRowColumns
            \ term=NONE
            \ cterm=NONE  ctermbg=246    ctermfg=232
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

        highlight SLRulerPercent
            \ term=NONE
            \ cterm=NONE  ctermbg=245    ctermfg=232
            \ gui=NONE    guibg=#c6c6c6  guifg=NONE

    endif

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! GetGitBranchName()

    let branchName = ""
    let l:fugitiveHead = fugitive#head()

    if ( l:fugitiveHead != "" )
        let branchName = "[" . fugitive#head() . "]\ "
    endif

    return branchName

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! StripTrailingWhitespaces()

    " Save last search and cursor position.

    let searchHistory = @/
    let cursorLine = line(".")
    let cursorColumn = col(".")

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Strip trailing whitespaces.

    %s/\s\+$//e

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Restore previous search history and cursor position.

    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)


endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! ToggleLimits()

    " [51,73]
    "
    "   * Git commit message
    "     http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    "
    " [81]
    "
    "   * general use

    if ( &colorcolumn == "73" )
        set colorcolumn+=51,81
    else
        set colorcolumn-=51,81
    endif

endfunction



" ----------------------------------------------------------------------
" | Automatic Commands                                                 |
" ----------------------------------------------------------------------

if has("autocmd")

    " Autocommand Groups.
    " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically reload the configurations from the $MYVIMRC file
    " whenever they are changed

    augroup auto_reload_vim_configs

        autocmd!

        autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded " . $MYVIMRC | redraw
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC | echom "Reloaded " . $MYGVIMRC | endif | redraw

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Fast escape from insert mode
    " https://github.com/vim/vim/issues/1498

    augroup FastEscape

        autocmd!

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Set timeoutlen to 0 ms when entering insert mode

        autocmd InsertEnter * set timeoutlen=0

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Set timeoutlen to 1000 ms when leaving insert mode

        autocmd InsertLeave * set timeoutlen=1000

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Use relative line numbers.
    " http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

    augroup relative_line_numbers

        autocmd!

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to absolute
        " line numbers when Vim loses focus.

        autocmd FocusLost * :set norelativenumber

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to relative
        " line numbers when Vim gains focus.

        autocmd FocusGained * :set relativenumber

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to absolute
        " line numbers when Vim is in insert mode.

        autocmd InsertEnter * :set norelativenumber

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to relative
        " line numbers when Vim is in normal mode.

        autocmd InsertLeave * :set relativenumber

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Reset cursor as block on entering vim

    augroup reset_cursor

        autocmd!

        autocmd VimEnter * silent !echo -ne "\e[2 q"

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically strip the trailing
    " whitespaces when files are saved.

    augroup strip_trailing_whitespaces

        " List of file types for which the trailing whitespaces
        " should not be removed:

        let excludedFileTypes = []

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Only strip the trailing whitespaces if
        " the file type is not in the excluded list.

        autocmd!
        autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

    augroup END

endif



" ----------------------------------------------------------------------
" | Key Mappings                                                       |
" ----------------------------------------------------------------------

" Use SPACE as mapleader (default is "\").

let mapleader = " "

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<C-m>] Open fzf buffer finder using 'Enter'

nmap <C-m> :Buffers <CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<C-p>] Open fzf file finder

nmap <C-p> :Files <CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>a] Search the current word under cursor using ag

nmap <leader>a :Ack! "\b<cword>\b" <CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>bd] Delete buffer without closing window mapping.

nmap <leader>bd :Kwbd<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>bh] Launch Startify homescreen.

nmap <leader>bh :Startify<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>cs] Clear search.

nmap <leader>cs <Esc>:noh<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>ev] Make the opening of the $MYVIMRC file easier.

nmap <leader>ev :vsp $MYVIMRC<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>fd] Open GFiles in file find mode.

nmap <leader>fd :GFiles <CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>fg] Open GFiles in file grep mode.

if executable('rg')
    nmap <leader>fg :Rg <CR>
else
    nmap <leader>fg :Ag <CR>
endif

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>sh] Show hex dump.

nmap <leader>sh :%!xxd<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>sr] Strip carriage returns.

nmap <leader>sr :%s/\r//g<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>td] Toggle display of hidden characters.

nmap <leader>td :set list!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>tg] Toggle Git differences.

nmap <leader>tg :GitGutterToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>ti] Toggle indent.

nmap <leader>ti :IndentLinesToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>tn] Toggle display relativenumber.

nmap <leader>tn :set relativenumber!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>tl] Toggle show limits.

nmap <leader>tl :call ToggleLimits()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>tw] Toggle word wrap.

nmap <leader>tw :set wrap!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>w2] Create new vertically split window.

nmap <leader>w2 :vs<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>wz] Toggle window zoom.

nmap <leader>wz :MaximizerToggle!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>W] Sudo write.

nmap <leader>W :w !sudo tee %<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<SPC>x] Close QuickFix window

nmap <leader>x :cclose<CR>



" ----------------------------------------------------------------------
" | Plugins                                                            |
" ----------------------------------------------------------------------

" Install vim-plug

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins

call plug#begin('~/.cache/vim/plugged')

  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dominikduda/vim_current_word'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'farmergreg/vim-lastplace'
  Plug 'google/vim-searchindex'
  Plug 'jeetsukumaran/vim-filebeagle'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'mileszs/ack.vim'
  Plug 'mhinz/vim-startify'
  Plug 'musq/vim-autobackup'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'raimondi/delimitmate'
  Plug 'rgarver/Kwbd.vim'
  Plug 'roman/golden-ratio'
  Plug 'sheerun/vim-polyglot'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'szw/vim-maximizer'
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'wellle/targets.vim'
  Plug 'whiteinge/diffconflicts'
  Plug 'vim-scripts/ShowTrailingWhitespace'
  Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()



" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

call ChangeTheme(2)            " Change theme
                               " 1 = PaperColor
                               " 2 = Neodark


" ----------------------------------------------------------------------
" | Plugins - ack                                                      |
" ----------------------------------------------------------------------

" Use silversearcher (ag) as file searcher

let g:ackprg = 'ag --vimgrep'


" ----------------------------------------------------------------------
" | Plugins - Deoplete                                                 |
" ----------------------------------------------------------------------

" Enable at startup

let g:deoplete#enable_at_startup = 1


" ----------------------------------------------------------------------
" | Plugins - Gitgutter                                                |
" ----------------------------------------------------------------------

" Disable Gitgutter by default.
" https://github.com/airblade/vim-gitgutter

let g:gitgutter_enabled = 0


" ----------------------------------------------------------------------
" | Plugins - indentLine                                               |
" ----------------------------------------------------------------------

" Set the indent character guide
let g:indentLine_char = '▏'


" ----------------------------------------------------------------------
" | Plugins - Rainbow parentheses                                      |
" ----------------------------------------------------------------------

" Set custom color of parentheses

highlight rainbowParensShell1   ctermfg=177  guifg=#d787ff
highlight rainbowParensShell2   ctermfg=36   guifg=#00af87
highlight rainbowParensShell3   ctermfg=167  guifg=#d75f5f
highlight rainbowParensShell4   ctermfg=169  guifg=#d75faf
highlight rainbowParensShell5   ctermfg=111  guifg=#87afff
highlight rainbowParensShell6   ctermfg=208  guifg=#ff8700
highlight rainbowParensShell7   ctermfg=207  guifg=#ff5fff
highlight rainbowParensShell8   ctermfg=148  guifg=#afd700
highlight rainbowParensShell9   ctermfg=45   guifg=#00d7ff
highlight rainbowParensShell10  ctermfg=197  guifg=#ff005f
highlight rainbowParensShell11  ctermfg=222  guifg=#ffd787
highlight rainbowParensShell12  ctermfg=43   guifg=#00d7af
highlight rainbowParensShell13  ctermfg=213  guifg=#ff87ff
highlight rainbowParensShell14  ctermfg=179  guifg=#d7af5f
highlight rainbowParensShell15  ctermfg=74   guifg=#5fafd7
highlight rainbowParensShell16  ctermfg=168  guifg=#d75f87

" Enable rainbow parentheses on startup

try
    call rainbow_parentheses#activate()
catch
endtry


" ----------------------------------------------------------------------
" | Plugins - ShowTrailingWhitespace                                   |
" ----------------------------------------------------------------------

" Set highlight color to red.
" https://www.vim.org/scripts/script.php?script_id=3966

highlight ShowTrailingWhitespace ctermbg=Red guibg=Red



" ----------------------------------------------------------------------
" | Status Line                                                        |
" ----------------------------------------------------------------------

" Terminal types:
"
"   1) term  (normal terminals, e.g.: vt100, xterm)
"   2) cterm (color terminals, e.g.: MS-DOS console, color-xterm)
"   3) gui   (GUIs)

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set statusline=
set statusline+=%#SLBuffer#    " Buffer highlight
set statusline+=\ (%n          " Buffer number
set statusline+=/
" Total number of buffers
" http://vim.1045645.n5.nabble.com/listing-total-number-of-buffers-in-the-statusline-td1189645.html
set statusline+=%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))})
set statusline+=\              "
set statusline+=%m             " Modified flag
set statusline+=%r             " Readonly flag
set statusline+=%h             " Help file flag
set statusline+=%w\            " Preview window flag
set statusline+=%#SLFilePath#  " Filepath highlight
set statusline+=\ %f\            " File path
set statusline+=%#SLSeparator# " Separator highlight
set statusline+=%=             " Left/Right separator
set statusline+=%#SLFileType#  " Filetype highlight
set statusline+=\ %y           " File type
set statusline+=\ %{&ff}       " File format
set statusline+=:
set statusline+=%{strlen(&fenc)?&fenc:'none'}  " File encoding
set statusline+=\              " Separator
set statusline+=%#SLRowColumns#  " Row-columns highlight
set statusline+=\ %l           " Current line number
set statusline+=/
set statusline+=%L             " Total number of lines
set statusline+=:
set statusline+=%c\            " Current column number
set statusline+=%#SLRulerPercent#  " Percent highlight
set statusline+=\ %P\          " Percent through file


" Example result:
"
" (1/3) [+] ~/.config/vim/vimrc         [vim] unix:utf-8 238/381:17 69%



" ----------------------------------------------------------------------
" | Cursor settings                                                    |
" ----------------------------------------------------------------------

" Display a block cursor in insert mode
" https://stackoverflow.com/a/42118416

let &t_EI = "\e[2 q"           " Steady block in normal mode
let &t_SI = "\e[6 q"           " Steady bar in insert mode



" ----------------------------------------------------------------------
" | Local Settings                                                     |
" ----------------------------------------------------------------------

" Load local settings if they exist.
"
" [!] The following needs to remain at the end of this file in
"     order to allow any of the above settings to be overwritten
"     by the local ones.

if filereadable(glob("$HOME/.config/vim/vimrc.local"))
    source $HOME/.config/vim/vimrc.local
endif
