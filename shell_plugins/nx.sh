#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx() {
  cmd=${1:---version}
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

  ls)
    cmd="$1"
    shift
    case "$cmd" in
    jest | js | linter | workspace | angular | cypress | detox | esbuild | expo | express | nest | next | node | nx-plugin | react | react-native | rollup | storybook | web | webpack) nx ls "@nrwl/$cmd" "$@" ;;
    *) nx list "$cmd" "$@" ;;
    esac
    ;;

  r)
    target="$1"
    shift
    nx run-many --target "$target" --projects "$@"
    ;;

  s) nx r serve "$@" ;;

  t) nx r test "$@" ;;

  w) n nx-workspace "$@" ;;

  *) n nx "$cmd" "$@" ;;

  esac
}
