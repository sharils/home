nmap <LEADER>af :ALEFix<CR>

let g:ale_fix_on_save       = 1
let g:ale_fixers            = {}
let g:ale_fixers.c          = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.elixir     = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.erlang     = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.html       = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.java       = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.javascript = ['remove_trailing_lines', 'trim_whitespace', 'eslint']
let g:ale_fixers.lua        = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.markdown   = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.php        = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.python     = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.ruby       = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.rust       = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.sh         = ['remove_trailing_lines', 'trim_whitespace', 'shfmt']
let g:ale_fixers.sql        = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_set_quickfix      = 1
