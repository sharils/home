let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

" colorscheme neverland-darker
Plug 'trapd00r/neverland-vim-theme'
" colorscheme framer_syntax_dark
Plug 'balanceiskey/vim-framer-syntax', { 'branch': 'main' }
" colorscheme pixelmuerto
Plug 'juanpabloaj/vim-pixelmuerto'

" colorscheme fairy-garden
" colorscheme ice-age
Plug 'sainnhe/archived-colors'
" colorscheme leya
Plug 'marlun/vim-starwars'

" Plug 'vim-scripts/BufOnly.vim'
" Plug 'coot/CRDispatcher'
" Plug 'coot/EnchantedVim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer --ts-completer' }

Plug 'w0rp/ale'
" Plug 'skywind3000/asyncrun.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rhysd/devdocs.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
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
" Plug 'ludovicchabant/vim-gutentags'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'rm -rf node_modules && npx --yes yarn install --frozen-lockfile --production' }
Plug 'ericbn/vim-relativize'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'vitalk/vim-shebang'
" Plug 'tpope/vim-sleuth'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/VCard-syntax'

Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'vito-c/jq.vim', { 'for': 'jq' }
Plug 'chikamichi/mediawiki.vim', { 'for': 'mw' }
Plug 'alunny/pegjs-vim', { 'for': 'pegjs' }
Plug 'rust-lang/rust.vim', { 'for': 'rs' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascriptreact', 'mediawiki', 'typescriptreact', 'xhtml'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'yardnsm/vim-import-cost', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'], 'do': 'npm install --production' }
Plug 'moll/vim-node'
Plug 'acarapetis/vim-sh-heredoc-highlighting', { 'for': ['sh', 'bash'] }
Plug 'alampros/vim-styled-jsx', { 'for': ['javascriptreact', 'typescriptreact'] }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }

Plug '~/.vim/plugged/after'
call plug#end()
