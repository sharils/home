#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx() {
  cmd=${1:-help}
  shift
  case $cmd in

  at) nx affected:test ;;

  b) nx r build "$@" ;;

  e)
    projects="$(echo "$1" | sed 's/[[:>:]]/-e2e/g')"
    shift
    nx r e2e "$projects" "$@"
    ;;

  f) nx format "$@" ;;

  g)
    [ $# -eq 0 ] && cmd=graph
    nx "$cmd" "$@"
    ;;

  l) nx lint "$@" ;;

  r)
    target="$1"
    shift
    nx run-many --target "$target" --projects "$@"
    ;;

  s) nx r serve "$@" ;;

  t) nx r test "$@" ;;

  *) npx --yes nx "$cmd" "$@" ;;

  esac
}
