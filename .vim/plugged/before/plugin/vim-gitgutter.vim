function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:gitgutter_use_location_list = 1
let g:gitgutter_sign_added = '⊕'
let g:gitgutter_sign_modified = 'Δ'
let g:gitgutter_sign_removed = '⊖'
let g:gitgutter_sign_removed_first_line = 'ˆ'
let g:gitgutter_sign_modified_removed   = '↯'

set signcolumn=yes
set statusline+=%{GitStatus()}
set updatetime=100
