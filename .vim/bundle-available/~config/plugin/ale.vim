nmap <LEADER>af :ALEFix<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['remove_trailing_lines', 'trim_whitespace', 'eslint']
let g:ale_set_quickfix = 1
