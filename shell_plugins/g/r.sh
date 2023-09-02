#!/usr/bin/env sh

r() {
  if [ $# -eq 0 ]; then
    tig refs
    return $?
  fi
  case "$1" in
  c) shift && glab repo create "$@" ;;
  *) git r "$@" ;;
  esac
}

r "$@"
