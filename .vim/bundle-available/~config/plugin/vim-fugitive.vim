set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gB :Gbrowse<CR>
nmap <LEADER>gcA :Gcommit --amend --reuse-message=HEAD<CR>
nmap <LEADER>gca :Gcommit --amend<CR>
nmap <LEADER>gcc :Gcommit<CR>
nmap <LEADER>gcva :Gcommit --amend --verbose<CR>
nmap <LEADER>gcvc :Gcommit --verbose<CR>
nmap <LEADER>gD :Gdiff<CR>
" nmap <LEADER>gdp :Git add --intent-to-add<CR>
" nmap <LEADER>gdp :Git! diff<CR>
nmap <LEADER>gds :Gsdiff<CR>
nmap <LEADER>gdv :Gvdiff<CR>
nmap <LEADER>ge :Gedit %<CR>
nmap <LEADER>gf :Gfetch<CR>
nmap <LEADER>gl<CR> :Gpull --prune --rebase<CR>
nmap <LEADER>glg :Glgrep<SPACE>
nmap <LEADER>gll :Gllog<CR>
nmap <LEADER>gmv :Gmove <C-R>=expand("%")<CR>
nmap <LEADER>go :Gsplit<CR>
nmap <LEADER>gO :Gtabedit<CR>
nmap <LEADER>gP :Gpush --set-upstream --force<CR>
nmap <LEADER>gp :Gpush --set-upstream<CR>
nmap <LEADER>gr :Gread<CR>
nmap <LEADER>gR :Gremove!<CR>
nmap <LEADER>gS :Gdiff HEAD~<CR>
nmap <LEADER>gs :Gstatus<CR>
" nmap <LEADER>gS :Gvsplit<CR>
nmap <LEADER>gw :Gwrite<CR>
