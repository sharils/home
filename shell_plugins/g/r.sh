#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

r() {
  if [ $# -eq 0 ]; then
    tig refs
    return $?
  fi
  case "$1" in
  c) shift && glab repo create "$@" ;;
  n) shift && gh repo ne --disable-issues --disable-wiki --public --source . "$@" ;;
  *) git r "$@" ;;
  esac
}

r "$@"
