let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

Plug 'vim-scripts/BufOnly.vim'
" Plug 'coot/CRDispatcher'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
" Plug 'coot/EnchantedVim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer' }
Plug 'jnurmine/Zenburn'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/devdocs.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'vito-c/jq.vim', { 'for': 'jq' }
Plug 'alunny/pegjs-vim', { 'for': 'pegjs' }
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'PeterRincker/vim-argumentative'
Plug 'bling/vim-bufferline'
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascript,jsx', 'xhtml'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'moll/vim-node', { 'for': 'jsx' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-sleuth'
Plug 'honza/vim-snippets'
Plug 'alampros/vim-styled-jsx', { 'for': 'jsx' }
Plug 'tpope/vim-surround'
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }

Plug '~/.vim/plugged/after'
call plug#end()
