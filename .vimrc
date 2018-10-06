let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

Plug 'vim-scripts/BufOnly.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer' }
Plug 'jnurmine/Zenburn'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'tpope/vim-obsession', { 'on':  'Obsession' }
Plug 'sheerun/vim-polyglot'
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-surround'

Plug '~/.vim/plugged/after'
call plug#end()
