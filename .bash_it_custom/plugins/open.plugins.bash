#!/usr/bin/env sh

devdocs() {
    if [ $# -eq 0 ]; then path=''; else path="?q=$*"; fi
    open "https://devdocs.io/$path"
}

devhints() {
    if [ $# -eq 0 ]; then path=''; else path="$*"; fi
    open "https://devhints.io/$path"
}

# tldr() {
#     if [ $# -eq 0 ]; then path=''; else path="$*"; fi
#     open "https://tldr.ostera.io/$path"
# }
