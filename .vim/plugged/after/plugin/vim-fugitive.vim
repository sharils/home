set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Follow fugitive-:Gstatus
nmap <LEADER>gca :Gcommit --amend<CR>
nmap <LEADER>gcc :Gcommit<CR>
nmap <LEADER>gce :Gcommit --amend --no-edit<CR>
nmap <LEADER>gcw :Gcommit --amend --only<CR>
nmap <LEADER>gcva :Gcommit --verbose --amend<CR>
nmap <LEADER>gcvc :Gcommit --verbose<CR>
nmap <LEADER>gD :Gdiff<CR>
nmap <LEADER>gds :Gsdiff<CR>
nmap <LEADER>gdv :Gvdiff<CR>
nmap <LEADER>gO :Gtabedit<CR>
nmap <LEADER>go :Gsplit<CR>
nmap <LEADER>gS :Gvsplit<CR>

nmap <LEADER>gbl :Gblame<CR>
nmap <LEADER>gbr :Gbrowse<CR>
nmap <LEADER>gf :Gfetch --all --prune<CR>
nmap <LEADER>gl<CR> :Gpull --prune<CR>
nmap <LEADER>ggr :Glgrep<SPACE>
nmap <LEADER>gll :Gllog<CR>
nmap <LEADER>gmv :Gmove <C-R>=expand("%")<CR>
nmap <LEADER>gpo<CR> :Gpush origin<CR>
nmap <LEADER>gpom :Gpush origin master<CR>
nmap <LEADER>gpof :Gpush origin --force<CR>
nmap <LEADER>gpuo :Gpush --set-upstream origin<CR>
nmap <LEADER>gpuof :Gpush --set-upstream origin --force<CR>
nmap <LEADER>gs<CR> :Gstatus<CR>

nmap <LEADER>ge :Gedit %<CR>
nmap <LEADER>gre :Gread<CR>
nmap <LEADER>gw :Gwrite<CR>
nmap <LEADER>gde :Gdelete<CR>
nmap <LEADER>grm :Gremove<CR>

nmap <LEADER>ga. :AsyncRun Git add .<CR>
nmap <LEADER>gau :AsyncRun Git add --update<CR>
nmap <LEADER>gcfh :Gcommit --fixup HEAD<CR>
nmap <LEADER>gco. :AsyncRun Git checkout .<CR>
nmap <LEADER>gstP :AsyncRun Git stash pop<CR>
nmap <LEADER>gstp :AsyncRun Git stash push<CR>
