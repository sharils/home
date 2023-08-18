let mapleader = ' '

call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/before'

Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer --ts-completer' }

Plug 'https://github.com/w0rp/ale'
" Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/github/copilot.vim', { 'branch': 'release' }
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/cohama/lexima.vim'
" Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/christoomey/vim-conflicted' | Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/prettier/vim-prettier', { 'do': 'rm -rf node_modules && npx --yes yarn install --frozen-lockfile --production' }
" Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/vitalk/vim-shebang'
" Plug 'https://github.com/tpope/vim-sleuth'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/puremourning/vimspector'

Plug 'https://github.com/slashmili/alchemist.vim', { 'for': 'elixir', 'branch': 'main' }
Plug 'https://github.com/ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'for': 'md', 'do': 'cd app && npx --yes yarn install' }
Plug 'https://github.com/chikamichi/mediawiki.vim', { 'for': 'mw' }
Plug 'https://github.com/alunny/pegjs-vim', { 'for': 'pegjs' }
Plug 'https://github.com/godlygeek/tabular', { 'for': ['markdown', 'cucumber'] }
Plug 'https://github.com/alvan/vim-closetag', { 'for': ['html', 'javascriptreact', 'mediawiki', 'typescriptreact', 'xhtml'] }
Plug 'https://github.com/hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'https://github.com/elixir-editors/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'https://github.com/moll/vim-node'
Plug 'https://github.com/acarapetis/vim-sh-heredoc-highlighting', { 'for': ['sh', 'bash'] }
" Plug 'https://github.com/dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'https://github.com/pedrohdz/vim-yaml-folds', { 'for': 'yaml' }

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

Plug '~/.vim/plugged/after'
call plug#end()
