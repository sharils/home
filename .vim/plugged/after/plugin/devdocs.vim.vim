nmap <LEADER>K :DevDocs<SPACE>

augroup plugin-devdocs
  autocmd!
  autocmd FileType css,html,javascript,php nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END
