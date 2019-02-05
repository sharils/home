#!/usr/bin/env sh

devhints() {
    if [ $# -eq 0 ]; then path=''; else path="$*"; fi
    open "https://devhints.io/$path"
}
