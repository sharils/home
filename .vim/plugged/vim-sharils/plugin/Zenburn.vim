set t_Co=256
colorscheme zenburn
autocmd Syntax,WinEnter * match ColorColumn /\v\s+$| +\ze\t|%(^\n+|\n@<=)%$/
