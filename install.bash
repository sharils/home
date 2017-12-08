#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
    ~/.bash_it/install.sh

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

ln -s \
    $PWD/.bash_it_custom \
    $PWD/.bashrc

vimdiff .bash_profile ~/.bash_profile
