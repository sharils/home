#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  eval "$(
    cat <<EOF | fzf --tac
$EDITOR -O Dockerfile .dockerignore
direnv edit . && chmod 600 .envrc
EOF
  )"
}

e "$@"
