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

  rs) w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  w) watchman-wait --max-events 0 "$@" ;;

  py | sh) w m --pattern "**/*.$cmd" --run "$*" ;;

  *) w o "$cmd" "$@" ;;

  esac
}
