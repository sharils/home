#!/usr/bin/env sh

w() {
  cmd=$1
  shift

  case $cmd in

  dk) w m --pattern 'Dockerfile' --run 'docker build .' ;;

  ex) w m --pattern '**/*.ex' '**/*.exs' --run "${*:-mix test && mix format}" ;;

  js) w m --pattern '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' --run "${*:-npm test}" ;;

  m) watchman-make "$@" ;;

  rs) w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  w) watchman-wait --max-events 0 "$@" ;;

  py) w m --pattern "**/*.$cmd" --run "${*:-pytest}" ;;

  pytest) w py "pytest $*" ;;

  sh) w m --pattern "**/*.$cmd" --run "$*" ;;

  *) "$cmd" "$@" | g uri | x fzf | xargs -o "$BROWSER" ;;

  esac
}
