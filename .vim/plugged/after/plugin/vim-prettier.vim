let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'

nmap <LEADER><LEADER>= :PrettierAsync<CR>
" let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
