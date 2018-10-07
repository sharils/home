let mapleader = ' '

map Y y$

imap <C-R>, <C-O>m`<C-O>:s/[,;]*$/,/\|nohlsearch<CR><C-O>``
imap <C-R>; <C-O>m`<C-O>:s/[,;]*$/;/\|nohlsearch<CR><C-O>``
nmap <C-R>, m`:s/[,;]*$/,/\|nohlsearch<ESC>``
nmap <C-R>; m`:s/[,;]*$/;/\|nohlsearch<ESC>``

cnoremap <C-L><C-P> <C-R>+
inoremap <C-L><C-P> <C-R>+
nnoremap <LEADER>y :%y+<CR>
nnoremap <LEADER>p "+gP
vnoremap <LEADER>y "+y
vnoremap <LEADER>p c<C-R>+<C-C>

cnoremap <C-G>  <C-c>
cnoremap <M-d>  <S-Right><Delete>

" Moving the cursor:

"   Ctrl + a   Go to the beginning of the line (Home)
cnoremap <C-A>  <Home>

"   Ctrl + e   Go to the End of the line (End)
cnoremap <C-E>  <End>

"   Ctrl + p   Previous command (Up arrow)
"   Native

"   Ctrl + n   Next command (Down arrow)
"   Native

"    Alt + b   Back (left) one word
cnoremap <ESC>b  <S-Left>

"    Alt + f   Forward (right) one word
cnoremap <ESC>f  <S-Right>

"   Ctrl + f   Forward one character
cnoremap <C-F>  <Right>

"   Ctrl + b   Backward one character
cnoremap <C-B>  <Left>

"   Ctrl + xx  Toggle between the start of line and current cursor position
"   N/A

" Editing:

"  Ctrl + L   Clear the Screen, similar to the clear command
"  Native

"   Alt + Del Delete the Word before the cursor.

"   Alt + d   Delete the Word after the cursor.

"  Ctrl + d   Delete character under the cursor
cnoremap <C-D>  <Delete>

"  Ctrl + h   Delete character before the cursor (Backspace)
"  Native

"  Ctrl + w   Cut the Word before the cursor to the clipboard.
"  Native

"  Ctrl + k   Cut the Line after the cursor to the clipboard.

"  Ctrl + u   Cut/delete the Line before the cursor to the clipboard.
"  Native

"   Alt + t   Swap current word with previous
"   N/A

"  Ctrl + t   Swap the last two characters before the cursor (typo).
"  N/A

"  Esc  + t   Swap the last two words before the cursor.
"  N/A

"  ctrl + y   Paste the last thing to be cut (yank)
"  N/A

"   Alt + u   UPPER capitalize every character from the cursor to the end of the current word.
"   N/A

"   Alt + l   Lower the case of every character from the cursor to the end of the current word.
"   N/A

"   Alt + c   Capitalize the character under the cursor and move to the end of the word.
"   N/A

"   Alt + r   Cancel the changes and put back the line as it was in the history (revert).
"   N/A

"  ctrl + _   Undo
"  N/A

" https://ss64.com/bash/syntax-keyboard.html
inoremap <C-A> <C-O>I
inoremap <C-B> <ESC>i
inoremap <C-E> <C-O>A
inoremap <C-F> <C-O>l
inoremap <C-_><C-H> <ESC>mm$x<ESC>`mli
inoremap <C-_>p <ESC>mmyyp`mja
inoremap <C-_>, <ESC>mm$a,<ESC>`mli
inoremap <C-_>; <ESC>mm$a;<ESC>`mli
nmap <LEADER><LEADER>cw :cclose<CR>
nmap <LEADER><LEADER>lw :lclose<CR>
nmap <LEADER><LEADER>w= <C-W><C-_><C-W><BAR>
nmap <LEADER><LEADER>wh <C-W><C-H><C-W><C-_>80<C-W><BAR>
nmap <LEADER><LEADER>wj <C-W><C-J><C-W><C-_>80<C-W><BAR>
nmap <LEADER><LEADER>wk <C-W><C-K><C-W><C-_>80<C-W><BAR>
nmap <LEADER><LEADER>wl <C-W><C-L><C-W><C-_>80<C-W><BAR>
nmap <LEADER>E :edit!<CR>
nmap <LEADER>bd :bdelete<CR>
nmap <LEADER>bn :bnext<CR>
nmap <LEADER>bp :bprevious<CR>
nmap <LEADER>cc :cc<CR>
nmap <LEADER>cn :cnext<CR>
nmap <LEADER>cp :cprevious<CR>
nmap <LEADER>cr :crewind<CR>
" nmap <LEADER>cw :cwindow<CR>
nmap <LEADER>eh :Hexplore<CR>
nmap <LEADER>et :Texplore<CR>
nmap <LEADER>ev :Vexplore<CR>
nmap <LEADER>ex :Explore<CR>
nmap <LEADER>g< :silent lgrep --fixed-strings '<<<<<<<' %<CR>zt<C-L>zt
nmap <LEADER>gC :silent lgrep --fixed-strings 'class <C-R><C-W> ' *<CR><C-L>zt
nmap <LEADER>gF :silent lgrep --fixed-strings 'function <C-R><C-W>(' *<CR><C-L>zt
nmap <LEADER>gW :silent lgrep --fixed-strings <C-R><C-W> *<CR><C-L>zt
nmap <LEADER>itr i<C-R>=expand("%:t:r")<CR><ESC>
nmap <LEADER>ll :ll<CR>
nmap <LEADER>ln :lnext<CR>
nmap <LEADER>lp :lprevious<CR>
nmap <LEADER>lr :lrewind<CR>
nmap <LEADER>lw :lwindow<CR>
nmap <LEADER><CR> :nohlsearch<CR>
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
nmap <LEADER>w8 80<C-W><BAR>
nmap <LEADER>w10 100<C-W><BAR>
nnoremap <C-_>, mm$a,<ESC>`m
nnoremap <C-_>; mm$a;<ESC>`m
nnoremap <LEADER>, mm$a,<ESC>`m
nnoremap <LEADER>; mm$a;<ESC>`m
