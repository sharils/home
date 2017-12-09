" If installed using Homebrew
set runtimepath+=/usr/local/opt/fzf

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <LEADER>zf :Files<CR>
nnoremap <LEADER>zF :GFiles<CR>
nnoremap <LEADER>z? :GFiles?<CR>
nnoremap <LEADER>zb :Buffers<CR>
" nnoremap <LEADER>z :Colors<CR>
nnoremap <LEADER>zl :Lines<CR>
nnoremap <LEADER>zL :BLines<CR>
nnoremap <LEADER>zt :Tags<CR>
nnoremap <LEADER>zT :BTags<CR>
nnoremap <LEADER>zm :Marks<CR>
nnoremap <LEADER>zw :Windows<CR>
" nnoremap <LEADER>z :Locate<CR>
nnoremap <LEADER>zh :History<CR>
nnoremap <LEADER>z: :History:<CR>
nnoremap <LEADER>z/ :History/<CR>
nnoremap <LEADER>zs :Snippets<CR>
nnoremap <LEADER>zc :Commits<CR>
nnoremap <LEADER>zC :BCommits<CR>
nnoremap <LEADER>zM :Maps<CR>
" nnoremap <LEADER>z :Commands<CR>
" nnoremap <LEADER>z :Helptags<CR>
" nnoremap <LEADER>z :Filetypes<CR>
nnoremap <LEADER>zr :Rg<CR>
nnoremap <LEADER>zg :GGrep<CR>

" Mapping selecting mappings
nmap <LEADER><TAB> <plug>(fzf-maps-n)
xmap <LEADER><TAB> <plug>(fzf-maps-x)
omap <LEADER><TAB> <plug>(fzf-maps-o)

" Insert mode completion
imap <C-X><C-K> <plug>(fzf-complete-word)
imap <C-X><C-F> <plug>(fzf-complete-path)
imap <C-X><C-J> <plug>(fzf-complete-file-ag)
imap <C-X><C-L> <plug>(fzf-complete-line)

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" Advanced customization using autoload functions
inoremap <expr> <C-X><C-K> fzf#vim#complete#word({'left': '15%'})
