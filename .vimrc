let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/BufOnly.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer' }
Plug 'jnurmine/Zenburn'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'tpope/vim-obsession', { 'on':  'Obsession' }
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-surround'
Plug '~/.vim/plugged/vim-sharils'
call plug#end()
