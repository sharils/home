let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

" colorscheme neverland-darker
Plug 'https://github.com/trapd00r/neverland-vim-theme'
" colorscheme framer_syntax_dark
" Plug 'https://github.com/balanceiskey/vim-framer-syntax', { 'branch': 'main' }
" colorscheme pixelmuerto
" Plug 'https://github.com/juanpabloaj/vim-pixelmuerto'

" colorscheme fairy-garden
" colorscheme ice-age
" Plug 'https://github.com/sainnhe/archived-colors'
" colorscheme leya
" Plug 'https://github.com/marlun/vim-starwars'

" Plug 'https://github.com/vim-scripts/BufOnly.vim'
" Plug 'https://github.com/coot/CRDispatcher'
" Plug 'https://github.com/coot/EnchantedVim'
Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer --ts-completer' }

Plug 'https://github.com/w0rp/ale'
" Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/github/copilot.vim', { 'branch': 'release' }
" Plug 'https://github.com/Shougo/deoplete.nvim'
"   Plug 'https://github.com/roxma/nvim-yarp'
"   Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
" Plug 'https://github.com/rhysd/devdocs.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'https://github.com/junegunn/fzf.vim'

" Plug 'https://github.com/godlygeek/tabular'
" Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/tomtom/tcomment_vim'
" Plug 'https://github.com/freitass/todo.txt-vim'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/tpope/vim-abolish'
" Plug 'https://github.com/PeterRincker/vim-argumentative'
" Plug 'https://github.com/bling/vim-bufferline'
" Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/christoomey/vim-conflicted' |
  Plug 'https://github.com/tpope/vim-fugitive'
    " Plug 'https://github.com/tpope/vim-dispatch'|
    "   Plug 'https://github.com/skywind3000/asyncrun.vim' |
    " Plug 'https://github.com/shumphrey/fugitive-gitlab.vim' |
    " Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
" Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/prettier/vim-prettier', { 'do': 'rm -rf node_modules && npx --yes yarn install --frozen-lockfile --production' }
" Plug 'https://github.com/ericbn/vim-relativize'
" Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/vitalk/vim-shebang'
" Plug 'https://github.com/tpope/vim-sleuth'
" Plug 'https://github.com/honza/vim-snippets'
" Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/puremourning/vimspector'
" Plug 'https://github.com/vim-scripts/VCard-syntax'

Plug 'https://github.com/slashmili/alchemist.vim', { 'for': 'elixir', 'branch': 'main' }
Plug 'https://github.com/ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
" Plug 'https://github.com/vito-c/jq.vim', { 'for': 'jq' }
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'for': 'md', 'do': 'cd app && npx --yes yarn install' }
Plug 'https://github.com/chikamichi/mediawiki.vim', { 'for': 'mw' }
Plug 'https://github.com/alunny/pegjs-vim', { 'for': 'pegjs' }
" Plug 'https://github.com/rust-lang/rust.vim', { 'for': 'rs' }
Plug 'https://github.com/alvan/vim-closetag', { 'for': ['html', 'javascriptreact', 'mediawiki', 'typescriptreact', 'xhtml'] }
Plug 'https://github.com/hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'https://github.com/elixir-editors/vim-elixir', { 'for': ['elixir', 'eelixir'] }
" Plug 'https://github.com/yardnsm/vim-import-cost', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'], 'do': 'npm install --production' }
Plug 'https://github.com/moll/vim-node'
Plug 'https://github.com/acarapetis/vim-sh-heredoc-highlighting', { 'for': ['sh', 'bash'] }
" Plug 'https://github.com/alampros/vim-styled-jsx', { 'for': ['javascriptreact', 'typescriptreact'] }
" Plug 'https://github.com/dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'https://github.com/pedrohdz/vim-yaml-folds', { 'for': 'yaml' }

Plug '~/.vim/plugged/after'
call plug#end()
