function! SetRelativeNumber(option)
  if &number == 0
    return
  endif
  if a:option == 1
    set relativenumber
  elseif a:option == 0
    set norelativenumber
  endif
endfunction

autocmd CmdlineEnter : call SetRelativeNumber(0) | redraw
autocmd CmdlineLeave : call SetRelativeNumber(1)

" augroup HiUnicode
"   autocmd!
"   autocmd BufEnter *
"       \ syntax match nonascii "[^\x00-\x7F]" |
"       \ highlight nonascii ctermfg=NONE ctermbg=darkgrey
" augroup END
