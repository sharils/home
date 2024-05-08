#!/usr/bin/env sh
[ -n "$SET_X" ] && set -x

nx_ls() {
  case "$*" in

  r) open 'https://nx.dev/extending-nx/registry' ;;

  angular | cypress | detox | esbuild | expo | express | jest | js | linter | nest | next | node | plugin | react | react-native | rollup | storybook | vite | web | webpack | workspace) nx_ls "@nx/$*" "$@" ;;

  *) npx --yes nx list "$@" ;;

  esac
}

nx_ls "$@"
