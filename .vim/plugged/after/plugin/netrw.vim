let g:netrw_altv=1
let g:netrw_bufsettings = "nobuflisted nomodifiable nomodified number readonly nowrap"
let g:netrw_liststyle = 3

" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setlocal bufhidden=delete
