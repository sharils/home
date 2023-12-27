#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pr() {
  case "$1" in
  m)
    shift
    set -o errexit -o nounset
    git f
    headRefName="$(pr v --jq .headRefName --json headRefName)"
    git r --autosquash "origin/$(pr v --jq .baseRefName --json baseRefName)" "$headRefName"
    git pof "$headRefName"
    gh pr merge --delete-branch --merge "$@"
    git f
    return $?
    ;;
  r) shift && set -- ready "$@" ;;
  reviewers) shift && gh pr view | grep ^reviewers | sed 's/^reviewers:\t\([^ ]*\) (Requested)$/\1/' && return $? ;;
  rr) shift && set -- edit --add-reviewer "$(pr reviewers)" "$@" ;;
  v) shift && set -- view "$@" ;;
  esac
  gh pr "$@"
}

pr "$@"
