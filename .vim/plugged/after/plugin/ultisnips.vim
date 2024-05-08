nmap <LEADER>ue :UltiSnipsEdit<CR>

let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsEnableSnipMate = '0'
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/after/UltiSnips'

autocmd FileType snippets setlocal bufhidden=delete
