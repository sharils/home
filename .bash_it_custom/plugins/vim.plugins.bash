#!/usr/bin/env bash

vim-install() {
    $(
        cd ~/.vim/
        git submodule add $* "bundle/$(basename $* .git)"
    )
}
