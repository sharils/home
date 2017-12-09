nmap <LEADER>af :ALEFix<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_set_quickfix = 1
