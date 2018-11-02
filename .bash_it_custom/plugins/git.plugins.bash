#!/usr/bin/env bash

gclt() {
    filename="$(basename "$1")"
    dir="/tmp/${filename%.*}"
    git clone --depth=1 "$1" "$dir" && cd "$dir" || exit
}
