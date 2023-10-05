#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pr() {
  case "$1" in
  m)
    shift && [ $# -eq 0 ] && set -- --delete-branch --merge "$@"
    set -- merge "$@"
    ;;
  r) shift && set -- ready "$@" ;;
  reviewers) shift && gh pr view | grep ^reviewers | sed 's/^reviewers:\t\([^ ]*\) (Requested)$/\1/' && return $? ;;
  v) shift && set -- view "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
