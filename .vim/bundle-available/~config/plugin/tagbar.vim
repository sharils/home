nmap <LEADER>tb :TagbarOpenAutoClose<CR>

let g:tagbar_autoshowtag = 2
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0
let g:tagbar_type_php = {
    \ 'ctagsbin'  : tagbar_phpctags_bin,
    \ 'ctagsargs' : '--memory="' . tagbar_phpctags_memory_limit . '" -f -',
    \ 'kinds'     : [
        \ 'n:Namespaces:0',
        \ 'd:Constants:0:0',
        \ 'v:Variables:0:0',
        \ 'f:Functions:1',
        \ 'i:Interfaces:0',
        \ 'c:Classes:0',
        \ 'p:Properties:0:0',
        \ 'm:Methods:1',
        \ 't:Traits:0',
    \ ],
    \ 'sro'        : '::',
    \ 'kind2scope' : {
        \ 'c' : 'class',
        \ 'm' : 'method',
        \ 'f' : 'function',
        \ 'i' : 'interface',
        \ 'n' : 'namespace',
        \ 't' : 'trait',
    \ },
    \ 'scope2kind' : {
        \ 'class'     : 'c',
        \ 'method'    : 'm',
        \ 'function'  : 'f',
        \ 'interface' : 'i',
        \ 'namespace' : 'n',
        \ 'trait'     : 't',
    \ }
\ }
