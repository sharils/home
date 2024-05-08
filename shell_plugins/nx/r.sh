#!/usr/bin/env sh
[ -n "$SET_X" ] && set -x

r() {
  target="$1" && shift
  npx --yes nx run-many --target "$target" --projects "$@"
}

r "$@"
