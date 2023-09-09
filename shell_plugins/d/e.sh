#!/usr/bin/env sh

e() {
  eval "$(
    cat <<EOF | fzf --tac
$EDITOR -O Dockerfile .dockerignore
direnv edit . && chmod 600 .envrc
EOF
  )"
}

e "$@"
