#!/usr/bin/env sh

# The core Nx plugin contains the core functionality of Nx like the project graph, nx commands and task orchestration.
nx() {
  case "${1:---version}" in

  S) shift && nx r start "$@" ;;

  at) shift && nx affected:test "$@" ;;

  b) shift && nx r build "$@" ;;

  e) shift && nx r e2e "$*-e2e" ;;

  f) shift && nx format "$@" ;;

  g) shift && "$SHARILS_HOME/shell_plugins/nx/g.sh" "$@" ;;

  ios) shift && nx r run-ios "$@" ;;

  l) shift && nx lint "$@" ;;

  ls)
    shift
    case "$*" in
    r) open 'https://nx.dev/extending-nx/registry' ;;
    angular | cypress | detox | esbuild | expo | express | jest | js | linter | nest | next | node | plugin | react | react-native | rollup | storybook | vite | web | webpack | workspace) nx ls "@nx/$*" "$@" ;;
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

  a | android) shift && nx r run-android "$@" ;;

  w | web) shift && nx S "$@" ;;

  *) n nx "$@" ;;

  esac
}
