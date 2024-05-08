#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

f() {
  cmd="$1"
  case "$cmd" in
  i)
    shift
    [ $# -eq 0 ] && set -- --defaults --force "$@"
    git flow init "$@"
    git push origin --set-upstream main develop
    return $?
    ;;
  f) cmd='feature' ;;
  b) cmd='bugfix' ;;
  r) cmd='release' ;;
  h) cmd='hotfix' ;;
  s) cmd='support' ;;
  l) cmd='log' ;;
  *)
    git f "$@"
    return
    ;;
  esac
  # g f '' complains so shift after g f *
  shift

  cmd1="$1"
  shift
  case "$cmd1" in
  '') cmd1='' ;;
  h) cmd1='help' ;;
  l) cmd1='list' ;;
  s) cmd1='start' ;;
  f) cmd1='finish' ;;
  p) cmd1='publish' ;;
  t) cmd1='track' ;;
  d) cmd1='diff' ;;
  r) cmd1='rebase' ;;
  co) cmd1='checkout' ;;
  P) cmd1='pull' ;;
  rm) cmd1='delete' ;;
  esac

  git flow "$cmd" "$cmd1" "$@"

  printf %s "$*" | pbcopy
}

f "$@"
