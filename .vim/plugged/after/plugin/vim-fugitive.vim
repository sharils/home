" https://github.com/tpope/vim-fugitive/blob/9a4d730270882f9d39a411eb126143eda4d46963/plugin/fugitive.vim
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

let s:addr_other = has('patch-8.1.560') ? '-addr=other' : ''
let s:addr_wins  = has('patch-7.4.542') ? '-addr=windows' : ''
exe 'command! -bang -nargs=? -range=-1' s:addr_other '-complete=customlist,fugitive#PushComplete   Gp      exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "push " . <q-args>)'
exe 'command! -bang -nargs=? -range=-1' s:addr_other '-complete=customlist,fugitive#CommitComplete Gc     exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "commit -vv" . <q-args>)'
exe 'command! -bang -nargs=? -range=-1' s:addr_other '-complete=customlist,fugitive#CommitComplete Gcc     exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "commit -vv" . <q-args>)'
exe 'command! -bang -nargs=? -range=-1' s:addr_other '-complete=customlist,fugitive#CommitComplete Gca     exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "commit -vv --amend")'
exe 'command! -bang -nargs=? -range=-1' s:addr_wins '-complete=customlist,fugitive#GrepComplete GG exe fugitive#Command(0, <count> > 0 ? <count> : 0, +"<range>", <bang>0, "<mods>", "grep " . <q-args>)'
exe 'command! -bang -nargs=? -range=-1' s:addr_other '-complete=customlist,fugitive#FetchComplete  Gf      exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "fetch " . <q-args>)'
exe 'command! -bang -nargs=? -range=-1                -complete=customlist,fugitive#BlameComplete  Gb      exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", "blame " . <q-args>)'
exe 'command! -bang -nargs=? -range=-1 -complete=customlist,fugitive#LogComplete Gl :exe fugitive#LogCommand(<line1>,<count>,+"<range>",<bang>0,"<mods>",<q-args>, "l")'
exe 'command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete Gdv exe fugitive#Diffsplit(0, <bang>0, "vert <mods>", <q-args>, [<f-args>])'
exe 'command! -bar -bang -nargs=1 -complete=customlist,fugitive#CompleteObject Gmv   exe fugitive#MoveCommand(  <line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>, [<f-args>])'

nmap <Leader>g :Git<CR>
