#!/usr/bin/env sh

pr() {
  case "$1" in
  m) shift && set -- merge "${@:---delete-branch --merge}" ;;
  r) shift && set -- ready "$@" ;;
  v) shift && set -- view "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
