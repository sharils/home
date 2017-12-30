" make test commands execute using dispatch.vim
let test#strategy = "asyncrun"

nmap <LEADER>tf :TestFile<CR>
nmap <LEADER>tl :TestLast<CR>
nmap <LEADER>tn :TestNearest<CR>
nmap <LEADER>ts :TestSuite<CR>
nmap <LEADER>tv :TestVisit<CR>
