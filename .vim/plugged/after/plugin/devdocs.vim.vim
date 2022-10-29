nmap <LEADER>K :DevDocs<SPACE><C-R><C-W>

augroup plugin-devdocs
  autocmd!
  autocmd FileType css,html,javascript,php nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END
