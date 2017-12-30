filetype indent plugin on
syntax on

map Y y$
nnoremap <C-L> :nohlsearch\|redraw!<CR><C-L>

cnoremap <C-L><C-P> <C-R>+
inoremap <C-L><C-P> <C-R>+
nnoremap <LEADER>y :%y+<CR>
nnoremap <LEADER>p "+gP
vnoremap <LEADER>y "+y
vnoremap <LEADER>p c<C-R>+<C-C>

let mapleader = ' '

" fzf needs to be before pathogen
exec 'source ' . expand('<sfile>:h') . '/.vim/bundle-available/~config/plugin/fzf.vim.vim'

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" colorscheme needs to be after pathogen
set t_Co=256
highlight ColorColumn ctermbg=darkblue
autocmd Syntax,WinEnter * match ColorColumn /\v\s+$| +\ze\t|%(^\n+|\n@<=)%$/
colorscheme zenburn
