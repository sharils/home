#!/usr/bin/env sh

pr() {
  case "$1" in
  r) shift && set -- ready "$@" ;;
  v) shift && set -- view "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
