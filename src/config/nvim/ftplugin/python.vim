setlocal colorcolumn=89             " Highlight column after 88
setlocal textwidth=88               " Wrap text at column 88

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Use Ale to lint
let b:ale_linters = ['flake8', 'mypy']

" Use Ale to fix linting issues
let b:ale_fixers = ['isort', 'black']
