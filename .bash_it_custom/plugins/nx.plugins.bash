#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx() {
  cmd=${1:-help}; shift
  case $cmd in
  at)
    npx --yes nx affected:test
    ;;
  b)
    projects="$1"; shift
    npx --yes nx run-many --target=build --projects="$projects" "$@"
    ;;
  e)
    projects="$1"; shift
    npx --yes nx run-many --target=e2e --projects="$(echo "$projects" | sed -e 's/[[:>:]]/-e2e/g')" "$@"
    ;;
  f)
    npx --yes nx format "$@"
    ;;
  g)
    if [ $# -eq 0 ]; then
      npx --yes nx graph
    else
      npx --yes nx generate "$@"
    fi
    ;;
  l)
    npx --yes nx lint "$@"
    ;;
  s)
    projects="$1"; shift
    npx --yes nx run-many --target=serve --projects="$projects" "$@"
    ;;
  t)
    projects="$1"; shift
    npx --yes nx run-many --target=test --projects="$projects" "$@"
    ;;
  *)
    npx --yes nx "$cmd" "$@"
    ;;
  esac
}
