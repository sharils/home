" filetype indent plugin on
" syntax on
" let mapleader = ' '
" 
" map Y y$
" 
" cnoremap <C-L><C-P> <C-R>+
" inoremap <C-L><C-P> <C-R>+
" 
" nnoremap <LEADER>y :%y+<CR>
" nnoremap <LEADER>p "+gP
" vnoremap <LEADER>y "+y
" vnoremap <LEADER>p c<C-R>+<C-C>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plug 'Konfekt/FastFold'
" Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
" Plug 'StanAngeloff/php.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer --tern-completer' }
" Plug 'alunny/pegjs-vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
" Plug 'elixir-editors/vim-elixir'
" Plug 'elzr/vim-json'
" Plug 'flowtype/vim-flow'
" Plug 'godlygeek/tabular'
" Plug 'inkarkat/vim-ingo-library'
" Plug 'inkarkat/vim-mark'
" Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jnurmine/Zenburn'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'
" Plug 'marijnh/tern_for_vim'
" Plug 'moll/vim-node'
" Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'rhysd/devdocs.vim'
" Plug 'rust-lang/rust.vim'
" Plug 'scrooloose/nerdcommenter'
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'slashmili/alchemist.vim'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-five.git'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-pathogen'
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-surround'
" Plug 'vim-erlang/erlang-motions.vim'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'vim-php/tagbar-phpctags.vim'
" Plug 'vim-scripts/BufOnly.vim'
" Plug 'vim-scripts/Colour-Sampler-Pack'
" Plug 'vitalk/vim-shebang'
Plug 'w0rp/ale'
" Plug 'xolox/vim-misc'
Plug '~/.vim/plugged/vim-sharils'

" Initialize plugin system
call plug#end()

let mapleader = ' '
