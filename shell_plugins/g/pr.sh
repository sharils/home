#!/usr/bin/env sh

pr() {
  case "$1" in
  r) shift && set -- ready "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
