noremap <LEADER>cw :call asyncrun#quickfix_toggle(8)<CR>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
augroup vimrc
    autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8, 1)
augroup END
