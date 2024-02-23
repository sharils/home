" `VIM_COLORSCHEME` is defined at `.bash_it_custom/plugins`
if exists('$VIM_COLORSCHEME')
    colorscheme $VIM_COLORSCHEME
    if $VIM_COLORSCHEME == 'fairy-garden'
        highlight ColorColumn ctermbg=194
    endif
    if $VIM_COLORSCHEME == 'pixelmuerto'
        highlight ColorColumn ctermbg=239
    endif
    if $VIM_COLORSCHEME == 'framer_syntax_dark'
        highlight ColorColumn ctermbg=239
    endif
endif

set backupcopy=yes
set colorcolumn=80
set directory&
set expandtab
set foldcolumn=1
set hidden
set history=10000
set hlsearch
set ignorecase
set linebreak
set list
set listchars=tab:∼∼»,trail:␣,extends:›,precedes:‹,nbsp:⋯
set modeline
set mouse=a
set number
set relativenumber
set shiftwidth=0
set showbreak=↪
set showcmd
set smartcase
set t_Co=256
set tabstop=2
