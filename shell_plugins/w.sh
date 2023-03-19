#!/usr/bin/env sh

w() {
  case "$1" in

  dk) w m --pattern 'Dockerfile' --run 'docker build .' ;;

  ex) shift && w m --pattern '**/*.ex' '**/*.exs' --run "${*:-mix test && mix format}" ;;

  js) shift && w m --pattern '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' --run "${*:-npm test}" ;;

  m) shift && watchman-make "$@" ;;

  rs) shift && w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  w) shift && watchman-wait --max-events 0 "$@" ;;

  py) shift && w m --pattern '**/*.py' --run "${*:-pytest}" ;;

  pytest) shift && w py "pytest $*" ;;

  sh) shift && w m --pattern '**/*.sh' --run "$*" ;;

  *) "$@" | g uri | x fzf | xargs -o "$BROWSER" ;;

  esac
}
