#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
	bash-completion \
	fpp \
	fzf \
	git \
	ripgrep \
	rmtrash \
	thefuck \
	tig \
	vim \
	yarn

curl https://sh.rustup.rs -sSf | sh

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it &&
	~/.bash_it/install.sh

ln -fs \
	"$PWD/.bash_it_custom" \
	"$PWD/.bash_profile" \
	"$PWD/.bashrc" \
	"$PWD/.gitignore" \
	"$PWD/.tigrc" \
	"$PWD/.vim" \
	"$PWD/.vimrc" \
	~

cp .gitconfig ~

git submodule update --init --recursive

(
	cd .vim/bundle-available/YouCompleteMe/ &&
		./install.py --clang-completer --racer-completer --tern-completer &&
		cd ./third_party/ycmd/third_party/racerd/ &&
		git checkout .
)

(
	cd .vim/bundle-available/tagbar-phpctags.vim &&
		make
)

(
	npm install -g git+https://github.com/ramitos/jsctags.git
	cd .vim/bundle-available/tern_for_vim/ &&
		yarn --no-lockfile install
)

echo "git config --global user.name '$USER'"
echo "git config --global user.email '$USER@users.noreply.github.com'"
