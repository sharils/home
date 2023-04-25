#!/usr/bin/env sh

i() {
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
