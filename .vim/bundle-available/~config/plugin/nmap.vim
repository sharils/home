nmap <LEADER><LEADER>cw :cclose<CR>
nmap <LEADER><LEADER>lw :lclose<CR>
nmap <LEADER><LEADER>w= <C-W><C-_><C-W><BAR>
nmap <LEADER><LEADER>wh <C-W><C-H><C-W><C-_><C-W><BAR>
nmap <LEADER><LEADER>wj <C-W><C-J><C-W><C-_><C-W><BAR>
nmap <LEADER><LEADER>wk <C-W><C-K><C-W><C-_><C-W><BAR>
nmap <LEADER><LEADER>wl <C-W><C-L><C-W><C-_><C-W><BAR>
nmap <LEADER>E :edit!<CR>
nmap <LEADER>cc :cc<CR>
nmap <LEADER>cn :cnext<CR>
nmap <LEADER>cp :cprevious<CR>
nmap <LEADER>cr :crewind<CR>
nmap <LEADER>cw :cwindow<CR>
nmap <LEADER>eh :Hexplore<CR>
nmap <LEADER>et :Texplore<CR>
nmap <LEADER>ev :Vexplore<CR>
nmap <LEADER>ex :Explore<CR>
nmap <LEADER>g< :silent lgrep --fixed-strings '<<<<<<<' %<CR>zt<C-L>zt
nmap <LEADER>gC :silent lgrep --fixed-strings 'class <C-R><C-W> ' *<CR><C-L>zt
nmap <LEADER>gF :silent lgrep --fixed-strings 'function <C-R><C-W>(' *<CR><C-L>zt
nmap <LEADER>gW :silent lgrep --fixed-strings <C-R><C-W> *<CR><C-L>zt
nmap <LEADER>ll :ll<CR>
nmap <LEADER>ln :lnext<CR>
nmap <LEADER>lp :lprevious<CR>
nmap <LEADER>lr :lrewind<CR>
nmap <LEADER>lw :lwindow<CR>
nmap <LEADER>sf :set filetype=
nmap <LEADER>sfh :set filetype=html<CR>
nmap <LEADER>sfj :set filetype=javascript<CR>
nmap <LEADER>sfp :set filetype=php<CR>
nmap <LEADER>sn :execute &relativenumber ? "set number" : "set relativenumber"<CR>
nmap <LEADER>sp :set paste!<CR>
nmap <LEADER>ss :set spell!<CR>
nmap <LEADER>sw :set wrap!<CR>
nmap <LEADER>t% :tabedit<SPACE><C-R>=expand("%")<CR>
nmap <LEADER>t. :tabedit<SPACE><C-R>=expand("%:h")<CR>/
nmap <LEADER>tc :tabclose<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tm :tabmove
nmap <LEADER>to :tabonly<CR>
nmap <LEADER>tt :tabedit<SPACE><C-R>=expand("%")<CR><CR><C-O>
nmap <LEADER>vh :vertial help<SPACE>
nmap <LEADER>w= <C-W><C-=>
nmap <LEADER>wc <C-W><C-C>
nmap <LEADER>wh <C-W><C-H>
nmap <LEADER>wj <C-W><C-J>
nmap <LEADER>wk <C-W><C-K>
nmap <LEADER>wl <C-W><C-L>
nmap <LEADER>wo <C-W><C-O>
nmap <LEADER>wp <C-W><C-P>
nmap <LEADER>ws <C-W><C-S>
nmap <LEADER>wt <C-W><S-T>
nmap <LEADER>wv <C-W><C-V>
nmap <LEADER>ww <C-W><C-W>
nmap <LEADER>wx <C-W><C-X>
nmap <LEADER>wz <C-W><C-Z>
