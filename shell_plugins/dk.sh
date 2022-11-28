#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
  b)
    name="$(basename "$PWD" | x hostnameise)"
    dk build --tag "$USER/$name" "${@:-.}"
    ;;
  o) open -b com.docker.docker ;;
  q) osascript -e 'quit app "Docker"' ;;
  *) docker "$cmd" "$@" ;;
  esac
}
