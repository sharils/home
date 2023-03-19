#!/usr/bin/env sh

w() {
  case "$1" in

  dk) w m --pattern 'Dockerfile' --run 'docker build .' ;;

  eslint) shift && w js "npx eslint $*" ;;

  ex) shift && w m --pattern '**/*.ex' '**/*.exs' --run "${*:-mix test && mix format}" ;;

  js) shift && w m --pattern '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' --run "${*:-npm test}" ;;

  m) shift && watchman-make "$@" ;;

  py) shift && w m --pattern '**/*.py' --run "${*:-pytest}" ;;

  pytest) shift && w py "pytest $*" ;;

  rs) shift && w m --pattern '**/*.rs' --run "${*:-cargo test}" ;;

  sh) shift && w m --pattern '**/*.sh' --run "$*" ;;

  tsc) shift && w js "npx tsc ${*:---noEmit}" ;;

  w) shift && watchman-wait --max-events 0 "$@" ;;

  *) "$@" | g uri | x fzf | xargs -o "$BROWSER" ;;

  esac
}
