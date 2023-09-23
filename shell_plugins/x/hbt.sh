#!/usr/bin/env sh

hbt() {
  dir="$HOME/git/github.com/sharils/~backup/habitica/$(date +%F)"
  mkdir -pv "$dir"
  mv -v ~/Downloads/habitica-user-data.json "$dir"
}

hbt "$@"
