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

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it &&
	~/.bash_it/install.sh

ln -fs \
	"$PWD/.bash_it_custom" \
	"$PWD/.bashrc" \
	"$PWD/.gitignore" \
	"$PWD/.vim" \
	"$PWD/.vimrc" \
	~

cp .gitconfig ~

git submodule update --init --recursive

(
	cd .vim/bundle-available/YouCompleteMe/third_party/ycmd/third_party/racerd/ || exit
	git checkout .
)

(
	cd .vim/bundle-available/tagbar-phpctags.vim || exit
	make
)

(
	npm install -g git+https://github.com/ramitos/jsctags.git
	cd .vim/bundle-available/tern_for_vim/ || exit
	yarn --no-lockfile install
)
