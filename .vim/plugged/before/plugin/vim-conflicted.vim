 function! s:setupConflicted()
     set stl+=%{ConflictedVersion()}
 endfunction
 autocmd User VimConflicted call s:setupConflicted()
