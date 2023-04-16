#!/usr/bin/env sh

i() {
  git init "$@"
  [ -n "$G_I" ] && "$G_I"
  git commit --allow-empty --message "Initialize empty Git repository"
  if [ "$(git status --short)" != '' ]; then
    git add .
    git commit
  fi
}

i "$@"
