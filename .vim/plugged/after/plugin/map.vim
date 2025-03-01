let mapleader = ' '
let maplocalleader = ' '

map Y y$

nmap <ScrollWheelUp> <C-Y>
nmap <ScrollWheelDown> <C-E>
imap <ScrollWheelUp> <C-O><C-Y>
imap <ScrollWheelDown> <C-O><C-E>

imap <C-X>, <C-O>m`<C-O>:s/[,;]*$/,/\|nohlsearch<CR><C-O>``
imap <C-X>; <C-O>m`<C-O>:s/[,;]*$/;/\|nohlsearch<CR><C-O>``
nmap <C-X>, m`:s/[,;]*$/,/\|nohlsearch<ESC>``
nmap <C-X>; m`:s/[,;]*$/;/\|nohlsearch<ESC>``

cnoremap <C-L><C-P> <C-R>+
inoremap <C-L><C-P> <C-R>+
nnoremap <LEADER>y<CR> :%y+<CR>
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
inoremap <expr> <C-B> mode() ==# 'R' ? '<C-O>h' : '<ESC>i'
inoremap <C-E> <C-O>A
inoremap <C-F> <C-O>l
inoremap <C-J> <C-O>j
inoremap <C-K> <C-O>k

inoremap <C-[>O <ESC>O
inoremap Ï <ESC>O

inoremap <C-[>* °
cnoremap <C-[>* °
inoremap ª °
cnoremap ª °

inoremap <C-[>- –
cnoremap <C-[>- –
inoremap ­ –
cnoremap ­ –

inoremap <C-[>_ —
cnoremap <C-[>_ —
inoremap ß —
cnoremap ß —

inoremap <C-[>} ’
cnoremap <C-[>} ’
inoremap ý ’
cnoremap ý ’

nmap <LEADER>0 :vertical resize 100<CR>
nmap <LEADER>E :edit!<CR>
nmap <LEADER>S :source ~/.vimrc<CR>
nmap <LEADER>sp :set paste!<CR>
nmap <LEADER>ss :set spell!<CR>
nmap <LEADER>sw :set wrap!<CR>
nmap <LEADER>sex :set filetype=elixir<CR>
nmap <LEADER>sf1 :set foldlevel=1<CR>
nmap <LEADER>sf2 :set foldlevel=2<CR>
nmap <LEADER>sf3 :set foldlevel=3<CR>
nmap <LEADER>sf4 :set foldlevel=4<CR>
nmap <LEADER>sf5 :set foldlevel=5<CR>
nmap <LEADER>sf6 :set foldlevel=6<CR>
nmap <LEADER>sfi :set foldmethod=indent<CR>
nmap <LEADER>sfm :set foldmethod=manual<CR>
nmap <LEADER>sfs :set foldmethod=syntax<CR>
nmap <LEADER>ssh :set filetype=sh<CR>
