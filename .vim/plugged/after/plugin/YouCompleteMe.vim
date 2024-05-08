let g:ycm_key_invoke_completion = '<C-L>'
let g:ycm_key_list_select_completion = []
let g:ycm_register_as_syntastic_checker = 0

nmap <leader>yc :YcmCompleter<SPACE>

" c, cpp, objc, objcpp, cuda
nmap <leader>ygi :YcmCompleter GoToInclude<CR>

" c, cpp, objc, objcpp, cuda, cs, go, java, javascript, python, rust, typescript
nmap <leader>ygd :YcmCompleter GoToDeclaration<CR>
nmap <leader>ygf :YcmCompleter GoToDefinition<CR>
nmap <leader>y] :YcmCompleter GoTo<CR>

" c, cpp, objc, objcpp, cuda
" nmap <leader>y :YcmCompleter GoToImprecise<CR>

" java, javascript, python, typescript
nmap <leader>ygr :YcmCompleter GoToReferences<CR>

" cs
" nmap <leader>y :YcmCompleter GoToImplementation<CR>
" nmap <leader>y :YcmCompleter GoToImplementationElseDeclaration<CR>

" javascript, typescript
nmap <leader>ygt :YcmCompleter GoToType<CR>

" c, cpp, objc, objcpp, cuda, java, javascript, typescript
nmap <leader>yGt :YcmCompleter GetType<CR>

" c, cpp, objc, objcpp, cuda
" nmap <leader>y :YcmCompleter GetTypeImprecise<CR>
" nmap <leader>y :YcmCompleter GetParent<CR>

" c, cpp, objc, objcpp, cuda, cs, java, javascript, python, typescript, rust
nmap <leader>yGd :YcmCompleter GetDoc<CR>

" c, cpp, objc, objcpp, cuda
" nmap <leader>y :YcmCompleter GetDocImprecise<CR>

" c, cpp, objc, objcpp, cuda, cs, java, javascript, typescript
nmap <leader>yfi :YcmCompleter FixIt<CR>

" java, javascript, typescript
nmap <leader>yr :YcmCompleter RefactorRename<SPACE><C-R><C-W>
nmap <leader>yfm :YcmCompleter Format<CR>
nmap <leader>yo :YcmCompleter OrganizeImports<CR>
