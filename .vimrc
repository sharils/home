let mapleader = ' '

" fzf needs to be before pathogen
exec 'source ' . expand('<sfile>:h') . '/.vim/bundle-available/~config/plugin/fzf.vim.vim'

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
