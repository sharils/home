#!/usr/bin/env sh

w() {
  cmd=$1
  shift

  case $cmd in

  ex)
    watchman-make --pattern "**/*.ex" "**/*.exs" --run "${*:-mix test && mix format}"
    ;;

  js)
    watchman-make --pattern "**/*.js" "**/*.jsx" "**/*.ts" "**/*.tsx" --run "${*:-npm test}"
    ;;

  py)
    watchman-make --pattern "**/*.py" --run "$*"
    ;;

  rs)
    watchman-make --pattern "**/*.rs" --run "${*:-cargo test}"
    ;;

  *)
    watchman-make "$cmd" "$@"
    ;;

  esac
}
