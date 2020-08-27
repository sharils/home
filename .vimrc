let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

" Plug 'vim-scripts/BufOnly.vim'
" Plug 'coot/CRDispatcher'
" Plug 'coot/EnchantedVim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer' }
Plug 'jnurmine/Zenburn'
Plug 'w0rp/ale'
" Plug 'skywind3000/asyncrun.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/devdocs.vim'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Plug 'godlygeek/tabular'
" Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
" Plug 'freitass/todo.txt-vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'PeterRincker/vim-argumentative'
" Plug 'bling/vim-bufferline'
" Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-conflicted' |
  Plug 'tpope/vim-fugitive' |
    Plug 'tpope/vim-dispatch'|
      Plug 'skywind3000/asyncrun.vim' |
    Plug 'shumphrey/fugitive-gitlab.vim' |
    Plug 'tpope/vim-rhubarb'
Plug 'ludovicchabant/vim-gutentags'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'ericbn/vim-relativize'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-sleuth'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'

Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'vito-c/jq.vim', { 'for': 'jq' }
Plug 'alunny/pegjs-vim', { 'for': 'pegjs' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascriptreact', 'typescriptreact', 'xhtml'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'yardnsm/vim-import-cost', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'], 'do': 'npm install' }
Plug 'moll/vim-node', { 'for': ['javascriptreact', 'typescriptreact'] }
Plug 'alampros/vim-styled-jsx', { 'for': ['javascriptreact', 'typescriptreact'] }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }

Plug '~/.vim/plugged/after'
call plug#end()
