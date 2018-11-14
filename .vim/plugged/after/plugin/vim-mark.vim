let g:mwDefaultHighlightingPalette = 'extended'

nmap <Leader>mM <Plug>MarkToggle
nmap <Leader>mN <Plug>MarkAllClear
xmap <Leader>m* <Plug>MarkIWhiteSet

" Remap original hotkeys
nunmap <Leader>m
xunmap <Leader>m
nunmap <Leader>r
xunmap <Leader>r
nunmap <Leader>n
nunmap <Leader>*
nunmap <Leader>#
nunmap <Leader>/
nunmap <Leader>?
nmap <Leader>mm <Plug>MarkSet
xmap <Leader>mm <Plug>MarkSet
nmap <Leader>mr <Plug>MarkRegex
xmap <Leader>mr <Plug>MarkRegex
nmap <Leader>mn <Plug>MarkClear
nmap <Leader>m* <Plug>MarkSearchCurrentNext
nmap <Leader>m# <Plug>MarkSearchCurrentPrev
nmap <Leader>m/ <Plug>MarkSearchAnyNext
nmap <Leader>m? <Plug>MarkSearchAnyPrev
