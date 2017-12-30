set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>gc<CR> :Gcommit<CR>
nmap <LEADER>gca :Gcommit --amend<CR>
nmap <LEADER>gl<CR> :Gpull --prune --rebase<CR>
nmap <LEADER>gp :Gpush --set-upstream<CR>
nmap <LEADER>gP :Gpush --set-upstream --force<CR>
nmap <LEADER>gf :Gfetch<CR>
nmap <LEADER>glg :Glgrep<SPACE>
nmap <LEADER>gll :Gllog<CR>
nmap <LEADER>ge :Gedit %<CR>
nmap <LEADER>gr :Gread<CR>
nmap <LEADER>gw :Gwrite<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gS :Gdiff HEAD~<CR>
nmap <LEADER>gm :Gmove<SPACE>
nmap <LEADER>gR :Gremove!<CR>
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gB :Gbrowse<CR>
