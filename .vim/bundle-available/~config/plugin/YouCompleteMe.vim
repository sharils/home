let g:ycm_key_invoke_completion = '<C-L>'
let g:ycm_key_list_select_completion = []
let g:ycm_register_as_syntastic_checker = 0

nmap <leader>yc :YcmCompleter<SPACE>
nmap <leader>y] :YcmCompleter GoTo<CR>
nmap <leader>yd :YcmCompleter GetDoc<CR>
nmap <leader>yf :YcmCompleter GoToDefinition<CR>
nmap <leader>yr :YcmCompleter RefactorRename<SPACE>
nmap <leader>yt :YcmCompleter GetType<CR>
" nmap <leader>y :YcmCompleter GetDocImprecise<CR>
" nmap <leader>y :YcmCompleter GetTypeImprecise<CR>
" nmap <leader>y :YcmCompleter GoToDeclaration<CR>
" nmap <leader>y :YcmCompleter GoToImplementationElseDeclaration<CR>
" nmap <leader>y :YcmCompleter FixIt<CR>
" nmap <leader>y :YcmCompleter GoToImplementation<CR>
" nmap <leader>y :YcmCompleter GoToImprecise<CR>
" nmap <leader>y :YcmCompleter GoToInclude<CR>
" nmap <leader>y :YcmCompleter GetParent<CR>
" nmap <leader>y :YcmCompleter GoToReferences<CR>
