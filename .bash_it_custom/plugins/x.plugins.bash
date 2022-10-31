#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
x() {
  cmd=${1:-help}
  shift
  case $cmd in

  at) npx --yes nx affected:test ;;

  b) npx --yes nx run-many --target=build --projects "$@" ;;

  e)
    projects="$(echo "$1" | sed -e 's/[[:>:]]/-e2e/g')"
    shift
    npx --yes nx run-many --target=e2e --projects="$projects" "$@"
    ;;

  f) npx --yes nx format "$@" ;;

  g)
    if [ $# -eq 0 ]; then
      npx --yes nx graph
    else
      npx --yes nx generate "$@"
    fi
    ;;

  l) npx --yes nx lint "$@" ;;

  s) npx --yes nx run-many --target=serve --projects "$@" ;;

  t) npx --yes nx run-many --target=test --projects "$@" ;;

  *) npx --yes nx "$cmd" "$@" ;;

  esac
}
