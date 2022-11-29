#!/usr/bin/env sh

w() {
  cmd=$1
  shift

  case $cmd in

  ex) w m --pattern '**/*.ex' '**/*.exs' \
    --run "${*:-mix test && mix format}" ;;

  js) w m --pattern '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' \
    --run "${*:-npm test}" ;;

  m) watchman-make "$@" ;;

  py) watchman-make --pattern "**/*.py" --run "$*" ;;

  rs) watchman-make --pattern "**/*.rs" --run "${*:-cargo test}" ;;

  esac
}
