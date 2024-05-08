nmap <LEADER>ad :ALEDetail<CR>
nmap <LEADER>af :ALEFix<CR>

" avoid high cpu usage resulted from tsserver
let g:ale_linters = {}
let g:ale_linters.javascript        = ['eslint']
let g:ale_linters.javascriptreact   = ['eslint']
let g:ale_linters.typescript        = ['eslint', 'tsserver']
let g:ale_linters.typescriptreact   = ['eslint', 'tsserver']

" let g:ale_fix_on_save       = 1
let g:ale_fixers                 = {}
let g:ale_fixers['*']            = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.css             = ['prettier']
let g:ale_fixers.elixir          = ['mix_format']
let g:ale_fixers.graphql         = ['prettier']
let g:ale_fixers.html            = ['prettier']
let g:ale_fixers.javascript      = ['eslint', 'prettier']
let g:ale_fixers.javascriptreact = ['eslint', 'prettier']
let g:ale_fixers.json            = ['prettier']
let g:ale_fixers.markdown        = ['prettier']
let g:ale_fixers.python          = ['black']
let g:ale_fixers.rust            = ['rustfmt']
let g:ale_fixers.scss            = ['prettier']
let g:ale_fixers.sh              = ['shfmt']
let g:ale_fixers.typescript      = ['eslint', 'prettier']
let g:ale_fixers.typescriptreact = ['eslint', 'prettier']
let g:ale_fixers.yaml            = ['prettier']

let g:ale_python_auto_poetry = 1
let g:ale_python_pylint_use_msg_id = 1
