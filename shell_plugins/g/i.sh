#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

i() {
  if [ -d .git ]; then
    echo '.git exists' >&2
    return 1
  fi
  git init "$@"
  [ -n "$G_I" ] && "$G_I"
  git commit --allow-empty --message "Initialize empty Git repository"
  if [ "$(git status --short)" != '' ]; then
    git add .
    [ -n "$G_I_M" ] && set -- --message "$G_I_M"
    git commit "$@"
  fi
}

i "$@"
