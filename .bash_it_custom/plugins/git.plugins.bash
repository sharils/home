#!/usr/bin/env bash

gclt() {
    filename="$(basename "$1")"
    dir="/tmp/${filename%.*}"
    git clone "$1" "$dir" && cd "$dir" || exit
}

gcl1t() {
    filename="$(basename "$1")"
    dir="/tmp/${filename%.*}"
    git clone --depth=1 "$1" "$dir" && cd "$dir" || exit
}

_get_last_commit() {
    filename="$(basename "$1")"
    git log --pretty=format:'%H' -1 install
}

gcff() {
    git commit --fixup "$(_get_last_commit "$1")"
}

gcsf() {
    git commit --squash "$(_get_last_commit "$1")"
}
