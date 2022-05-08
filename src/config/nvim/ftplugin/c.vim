setlocal colorcolumn=81             " Highlight column after 80
setlocal textwidth=80               " Wrap text at column 80

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Use Ale to fix linting issues
let b:ale_fixers = ['astyle']
