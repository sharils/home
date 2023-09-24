#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://csvbase.com/blog/5
sqlite() {
  sqlite3 -csv ':memory:' '.import /dev/stdin stdin' "$*"
}

sqlite "$@"
