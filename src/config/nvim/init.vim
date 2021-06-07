set nocompatible               " Don't make Vim vi-compatibile

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Actual plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/tagbar'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'whiteinge/diffconflicts'

" Python
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }
Plug 'nvie/vim-flake8'

" Meta plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'farmergreg/vim-lastplace'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'musq/vim-autobackup'
Plug 'rgarver/Kwbd.vim'
Plug 'roman/golden-ratio'
Plug 'szw/vim-maximizer'

" Syntax highlighting
Plug 'dominikduda/vim_current_word'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'Yggdroot/indentLine'

call plug#end()

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Show hidden files in filebeagle
let g:filebeagle_show_hidden=1

" Set the indent character guide
let g:indentLine_char = '▏'

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

filetype plugin indent on
"           │     │    └──── Enable file type detection
"           │     └───────── Enable loading of indent file
"           └─────────────── Enable loading of plugin files

set autoread

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace` in insert mode
set backspace+=start           " ┘

set backupdir=~/.local/share/nvim/backups  " Set directory for backup files
set directory=~/.local/share/nvim/swaps    " Set directory for swap files
set undodir=~/.local/share/nvim/undos      " Set directory for undo files
set undofile                   " Automatically save undo history

set backupskip=/tmp/*          " ┐ Don't create backups for certain files
set backupskip+=/private/tmp/* " ┘

set clipboard=unnamed          " ┐
                               " │
if has("unnamedplus")          " │ Use system clipboard as the default register
    set clipboard+=unnamedplus " │
endif                          " ┘

set cursorline                 " Highlight the current line
set encoding=utf-8 nobomb      " Use UTF-8 without BOM
set fileencoding=utf-8 nobomb  " Use UTF-8 encoding to write to file
set fillchars+=vert:│          " Set vertical separator
set history=5000               " Increase command line history

set hlsearch                   " Enable search highlighting
set incsearch                  " Highlight search pattern as it is being typed

set laststatus=2               " Always show the status line

set lazyredraw                 " Do not redraw the screen while executing
                               " macros, registers and other commands that
                               " have not been typed

set listchars=eol:↵            " ┐
set listchars+=extends:→       " │
set listchars+=nbsp:§          " │ Use custom symbols to represent
set listchars+=precedes:←      " │ invisible characters
set listchars+=space:·         " │
set listchars+=tab:>-          " ┘

set magic                      " Unbreak vim's regex implementation
set mouse=a                    " Enable mouse
set mousehide                  " Hide mouse pointer while typing

set nofoldenable               " Unfold
set nojoinspaces               " When using the join command, only insert a
                               " single space after a ., ?, or !
set nostartofline              " Kept the cursor on the same column
set notimeout                  " Disable timeouts
set nowrap                     " Disable wraps

set number                     " Show line number
set numberwidth=4              " Increase the minimal number of columns
                               " reserved for the `line number`
set relativenumber             " Set relative line number

set report=0                   " Report the number of lines changed
set ruler                      " Show cursor position

set scrolloff=5                " On vertical scroll, keep the cursor 5 lines
                               " away from top/bottom screen boundary
set sidescroll=5               " On horizontal scroll, keep the cursor 5 columns
                               " away from the left/right screen boundary

set shortmess=aAItW            " Avoid all the hit-enter prompts
set showcmd                    " Show the command being typed
set showmode                   " Show current mode
set spelllang=en_us            " Set the spellchecking language

set ignorecase                 " Ignore case in search patterns
set smartcase                  " Override `ignorecase` option if the search
                               " pattern contains uppercase characters

set splitbelow                 " On splitting, create the new window below

set synmaxcol=250              " Limit syntax highlighting (this avoids very
                               " slow redrawing when files contain long lines)

set colorcolumn=73             " Highlight 73rd column to visualise 72 char limit
set textwidth=72               " Automatically wrap text at column 72

set autoindent                 " Copy indent to the new line
set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings
set shiftwidth=4               " │
set expandtab                  " ┘

" set t_Co=256                   " Enable full-color support.
set t_ut=                      " Disable Background Color Erase (BCE)
set ttyfast                    " Enable fast terminal connection

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line completion
                               " (On hitting <TAB> in command mode, Vim will
                               " show the possible matches just above the
                               " command line with the first match highlighted)

set winminheight=0             " Allow windows to be squashed

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Use + and _ to increment and decrement numbers
nnoremap + <C-A>
nnoremap _ <C-X>

" Open fzf buffer switcher
nnoremap <TAB> :Buffers<CR>
" HACK!!
" We mapped TAB to :Buffers, now we need to map <C-I> to jump forward.
" But <C-I> is interpreted as <TAB> by shells. We achieve this by adding
" a key modifier in Alacritty to emulate <C-N>i on pressing <C-I>. Then
" we map <C-N>i to <C-I>.
" https://vi.stackexchange.com/a/25015
nnoremap <C-N>i <C-I>
" Pressing Y should copy to end of line
nnoremap Y y$
" Ignore Q press, because Ex mode is dumb
nnoremap Q <Nop>
" Open fzf file browser
nnoremap <C-P> :Files<CR>

" Better indentation
" https://youtu.be/YhqsjUUHj6g?t=968
vnoremap < <gv
vnoremap > >gv

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Use SPACE as mapleader
let mapleader = " "

" Close buffer without closing window
nnoremap <leader>bd :Kwbd<CR>
" Create an empty buffer
nnoremap <leader>bn :enew<CR>
" Open $MYVIMRC file easily
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" Open fzf Git file browser
nnoremap <leader>fd :GFiles<CR>
" Toggle absolute/relative line numbering
nnoremap <leader>tn :set relativenumber!<CR>
" Toggle page boundary
nnoremap <leader>tl :call TogglePageBoundaries()<CR>
" Toggle word wrap
nnoremap <leader>tw :set wrap!<CR>
" Create new vertically split window
nnoremap <leader>v :vs<CR>
" Toggle window zoom
nnoremap <leader>wz :MaximizerToggle!<CR>
" Sudo write
nnoremap <leader>W :w !sudo tee %<CR>
" Close QuickFix window
nnoremap <leader>x :cclose<CR>
" Clear highlighting
nnoremap <leader>z :noh<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

syntax enable
colorscheme neodark

let g:neodark#background = '#202020'
let g:neodark#solid_vertsplit = 1

highlight ColorColumn   cterm=NONE      ctermbg=237     ctermfg=NONE
highlight Comment       cterm=italic    ctermbg=NONE    ctermfg=242
highlight CursorLine    cterm=NONE      ctermbg=239     ctermfg=NONE
highlight CursorLineNr  cterm=bold      ctermbg=NONE    ctermfg=130
highlight LineNr        cterm=NONE      ctermbg=NONE    ctermfg=241

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

highlight CurrentWord       cterm=underline ctermbg=53  ctermfg=NONE
highlight CurrentWordTwins  cterm=underline ctermbg=238 ctermfg=NONE

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Set custom color of rainbow parentheses
highlight rainbowParensShell1   ctermfg=177
highlight rainbowParensShell2   ctermfg=36
highlight rainbowParensShell3   ctermfg=167
highlight rainbowParensShell4   ctermfg=169
highlight rainbowParensShell5   ctermfg=111
highlight rainbowParensShell6   ctermfg=208
highlight rainbowParensShell7   ctermfg=207
highlight rainbowParensShell8   ctermfg=148
highlight rainbowParensShell9   ctermfg=45
highlight rainbowParensShell10  ctermfg=197
highlight rainbowParensShell11  ctermfg=222
highlight rainbowParensShell12  ctermfg=43
highlight rainbowParensShell13  ctermfg=213
highlight rainbowParensShell14  ctermfg=179
highlight rainbowParensShell15  ctermfg=74
highlight rainbowParensShell16  ctermfg=168

" Enable rainbow parentheses on startup
call rainbow_parentheses#activate()

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Color trailing whitespace to Red
highlight ShowTrailingWhitespace ctermbg=Red

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Statusline highlighting
highlight SLBuffer          cterm=NONE  ctermbg=178     ctermfg=232
highlight SLFilePath        cterm=bold  ctermbg=245     ctermfg=52
highlight SLSeparator       cterm=NONE  ctermbg=248     ctermfg=237
highlight SLFileType        cterm=NONE  ctermbg=247     ctermfg=235
highlight SLRowColumns      cterm=NONE  ctermbg=246     ctermfg=232
highlight SLRulerPercent    cterm=NONE  ctermbg=245     ctermfg=232

set statusline=
set statusline+=%#SLBuffer#    " Buffer highlight
set statusline+=\ (%n          " Buffer number
set statusline+=/
" Total number of buffers
" http://vim.1045645.n5.nabble.com/listing-total-number-of-buffers-in-the-statusline-td1189645.html
set statusline+=%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))})
set statusline+=\              " Separator
set statusline+=%m             " Modified flag
set statusline+=%r             " Readonly flag
set statusline+=%h             " Help file flag
set statusline+=%w\            " Preview window flag
set statusline+=%#SLFilePath#  " Filepath highlight
set statusline+=\ %f\          " File path
set statusline+=%#SLSeparator# " Separator highlight
set statusline+=%=             " Left/Right separator
set statusline+=%#SLFileType#  " Filetype highlight
set statusline+=\ %y           " File type
set statusline+=\              " Separator
set statusline+=%#SLRowColumns#     " Row-columns highlight
set statusline+=\ (%L)         " Total number of lines
set statusline+=\ %l           " Current line number
set statusline+=:
set statusline+=%c\            " Current column number
set statusline+=%#SLRulerPercent#   " Percent highlight
set statusline+=\ %P\          " Percent through file

" Example result:
" (1/3) [+] ~/.config/vim/vimrc                 [vim] (381) 238:17 69%

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html

" Automatically reload the $MYVIMRC file whenever it's modified
augroup auto_reload_vim_config
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | redraw | echom "Reloaded" $MYVIMRC
augroup END

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function StripTrailingWhitespaces()
    " Save last search and cursor position
    let searchHistory = @/
    let cursorLine = line(".")
    let cursorColumn = col(".")
    " Strip trailing whitespaces from current buffer
    %s/\s\+$//e
    " Restore previous search history and cursor position
    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)
endfunction

" Automatically strip trailing whitespaces when files are saved
augroup strip_trailing_whitespaces
    autocmd!
    autocmd BufWritePre * call StripTrailingWhitespaces()
augroup END

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Run linters Black and Flake8 on python files
augroup run_black_and_flake8
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
    autocmd BufWritePost *.py call Flake8()
augroup END

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function TogglePageBoundaries()
    " Git commit message should be 50 characters
    " http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    if ( &colorcolumn == "73" )
        set colorcolumn+=51,81
    else
        set colorcolumn-=51,81
    endif
endfunction
