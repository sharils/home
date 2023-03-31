#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx() {
  case "${1:---version}" in

  S) shift && nx r start "$@" ;;

  at) shift && nx affected:test "$@" ;;

  b) shift && nx r build "$@" ;;

  e) shift && nx r e2e "$*-e2e" ;;

  f) shift && nx format "$@" ;;

  g)
    shift
    if [ $# -eq 0 ]; then
      set -- graph "$@"
    else
      set -- generate "$@"
    fi
    nx "$@"
    ;;

  l) shift && nx lint "$@" ;;

  ls)
    shift
    case "$*" in
    jest | js | linter | workspace | angular | cypress | detox | esbuild | expo | express | nest | next | node | nx-plugin | react | react-native | rollup | storybook | web | webpack) nx ls "@nrwl/$*" "$@" ;;
    *) nx list "$@" ;;
    esac
    ;;

  r)
    shift
    target="$1" && shift
    nx run-many --target "$target" --projects "$@"
    ;;

  s) shift && nx r serve "$@" ;;

  t) shift && nx r test "$@" ;;

  ws) shift && n i nx-workspace "$@" ;;

  w | web) shift && nx S "$@" ;;

  *) n nx "$@" ;;

  esac
}
