#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

hbt() {
  dir="$HOME/git/github.com/sharils/~backup/habitica/$(date +%F)"
  mkdir -pv "$dir"
  mv -v ~/Downloads/habitica-user-data.json ~/Downloads/habitica-tasks-history.csv "$dir"
}

hbt "$@"
