function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

nmap <LEADER>gd :GitGutterDiffOrig<CR>
nmap <LEADER>ha :GitGutterAll<CR>
nmap <LEADER>hq :GitGutterQuickFix<BAR>copen<CR>
