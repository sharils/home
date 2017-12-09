#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
    bash-completion \
    fpp \
    fzf \
    git \
    ripgrep \
    thefuck \
    tig \
    vim \
    yarn

vimdiff .bash_profile ~/.bash_profile

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
    ~/.bash_it/install.sh

ln -fs \
    $PWD/.bash_it_custom \
    $PWD/.bashrc \
    $PWD/.vim \
    $PWD/.vimrc \
    ~

git submodule update --init --recursive

(
    cd .vim/bundle-available/YouCompleteMe/
    cd third_party/ycmd/third_party/racerd/
    git checkout .
)

(
    cd .vim/bundle-available/tagbar-phpctags.vim
    make
)

(
    npm install -g git+https://github.com/ramitos/jsctags.git
    cd .vim/bundle-available/tern_for_vim/
    yarn --no-lockfile install
)
