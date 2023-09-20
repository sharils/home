#!/usr/bin/env sh

pr() {
  case "$1" in
  m)
    shift && [ $# -eq 0 ] && set -- --delete-branch --merge "$@"
    set -- merge "$@"
    ;;
  r) shift && set -- ready "$@" ;;
  v) shift && set -- view "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
