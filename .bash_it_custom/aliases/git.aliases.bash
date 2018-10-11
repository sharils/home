#!/usr/bin/env bash

# Follow fugitive-:Gstatus
alias gca='git commit --amend'
alias gcc='git commit -v'
alias gce='git commit --amend --no-edit'
alias gcw='git commit --amend --only'
alias gcva='git commit --verbose --amend'
alias gcvc='git commit --verbose'

# Enhancement

alias gl='git pull --prune'

alias ga.='git add .'
alias gau='git add --update'
alias gcfh='git commit --fixup HEAD'
alias gcl1='git clone --depth=1'
alias gco-='git checkout -'
alias gco.='git checkout .'
alias gcop='git checkout -p'
alias ggr='git grep'
alias gia='git init && git commit --allow-empty --message "Initialize empty Git repository" && git add . && git commit'
alias gic='git init && git commit --allow-empty --message "Initialize empty Git repository"'
alias gmt='git mergetool'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbm='git rebase origin/master'
alias grbo='git rebase --onto'
alias grbs='git rebase --autosquash --interactive'
alias grbs='git rebase --skip'
alias grsh='git reset --hard'
alias grs^='git reset HEAD^'
alias grsm='git reset --merge'
alias gstd='git stash --drop'
alias gstk='git stash --keep-index'
alias gstP='git stash pop'
alias gstp='git stash push'
alias gsts='git stash show --patch'

alias gpof='git push origin -f'
alias gpuof='git push --set-upstream origin --force'
