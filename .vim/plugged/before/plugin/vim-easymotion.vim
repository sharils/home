map <LEADER>e  <Plug>(easymotion-prefix)
map <LEADER>ea <Plug>(easymotion-jumptoanywhere)
map <LEADER>egn <Plug>(easymotion-next)
map <LEADER>egN <Plug>(easymotion-prev)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_verbose = 0

let g:EasyMotion_re_anywhere = '\v' .
    \       '(<.|^$)' . '|' .
    \       '(.>|^$)' . '|' .
    \       '(\l)\zs(\u)' . '|' .
    \       '(_\zs.)' . '|' .
    \       '(-\zs.)' . '|' .
    \       '(#\zs.)'
