set nocompatible               " Don't make Vim vi-compatibile

syntax on                      " Enable syntax highlighting

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent file
    "           └─────────────── Enable loading of plugin files
endif

set autoindent                 " Copy indent to the new line

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace` in insert mode
set backspace+=start           " ┘

" NOTE: Ensure these directories exist
" ~/.local/state/vim/backups/
" ~/.local/state/vim/swaps/
" ~/.local/state/vim/undos/
set backupdir=~/.local/state/vim/backups  " Set directory for backup files
set directory=~/.local/state/vim/swaps    " Set directory for swap files
set undodir=~/.local/state/vim/undos      " Set directory for undo files

set backupskip=/tmp/*          " ┐ Don't create backups
set backupskip+=/private/tmp/* " ┘ for certain files

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register
    set clipboard+=unnamedplus " │
endif                          " ┘

set colorcolumn=73             " Highlight certain column(s)
set cursorline                 " Highlight the current line
set encoding=utf-8 nobomb      " Use UTF-8 without BOM
set fillchars+=vert:│          " Set vertical separator
set history=5000               " Increase command line history
set hlsearch                   " Enable search highlighting
set ignorecase                 " Ignore case in search patterns

set incsearch                  " Highlight search pattern
                               " as it is being typed

set laststatus=2               " Always show the status line

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed

set listchars=eol:↵            " ┐
set listchars+=extends:→       " │
set listchars+=nbsp:§          " │ Use custom symbols to
set listchars+=precedes:←      " │ represent invisible characters
set listchars+=space:·         " │
set listchars+=tab:>-          " │
set listchars+=trail:◦         " ┘

set magic                      " Enable extended regexp
set mouse=a                    " Enable mouse
set mousehide                  " Hide mouse pointer while typing
set noerrorbells               " Disable error bells

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`

set nostartofline              " Kept the cursor on the same column
set number                     " Show line number

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`

set norelativenumber           " Disable relative line number
set report=0                   " Report the number of lines changed
set ruler                      " Show cursor position

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen

set shortmess=aAItW            " Avoid all the hit-enter prompts
set showcmd                    " Show the command being typed
set showmode                   " Show current mode
set spelllang=en_us            " Set the spellchecking language

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines)

set textwidth=72               " Wrap text at column 72

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings
set shiftwidth=4               " │
set expandtab                  " ┘

set t_ut=                      " Disable Background Color Erase (BCE)
set ttyfast                    " Enable fast terminal connection
set undofile                   " Automatically save undo history

set viminfo+=n~/.local/state/vim/viminfo  " Path to viminfo file

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

let &t_EI = "\e[2 q"           " Use block cursor in normal mode
let &t_SI = "\e[5 q"           " Use thin vertical cursor in insert mode

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted)

set winminheight=0             " Allow windows to be squashed

" https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
highlight ColorColumn ctermbg=236  " Dark gray for dark mode
