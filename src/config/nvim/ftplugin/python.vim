setlocal colorcolumn=89             " Highlight column after 88
setlocal textwidth=88               " Wrap text at column 88

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Run linters Black and Flake8
augroup run_black_and_flake8
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
    autocmd BufWritePost *.py call Flake8()
augroup END
