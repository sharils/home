call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer --tern-completer' }

Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }

Plug 'jaredpar/EasyMotion'

Plug 'jiangmiao/auto-pairs'

Plug 'jnurmine/Zenburn'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ludovicchabant/vim-gutentags'

Plug 'moll/vim-node', { 'for': 'javascript' }

Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'tpope/vim-obsession'

Plug 'vim-scripts/BufOnly.vim'

Plug 'vitalk/vim-shebang'

Plug 'w0rp/ale'

Plug '~/.vim/plugged/vim-sharils'

call plug#end()
