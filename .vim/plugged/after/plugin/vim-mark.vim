let g:mwAutoLoadMarks = 1
let g:mwDefaultHighlightingPalette = 'extended'
let g:mw_no_mappings = 1

nmap <Leader>mM <Plug>MarkToggle
nmap <Leader>mN <Plug>MarkAllClear
xmap <Leader>m* <Plug>MarkIWhiteSet
nmap <Leader>mm <Plug>MarkSet
nmap <Leader>mr <Plug>MarkRegex
nmap <Leader>mn <Plug>MarkClear
nmap <Leader>m* <Plug>MarkSearchCurrentNext
nmap <Leader>m# <Plug>MarkSearchCurrentPrev
nmap <Leader>m/ <Plug>MarkSearchAnyNext
nmap <Leader>m? <Plug>MarkSearchAnyPrev
