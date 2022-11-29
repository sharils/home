#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
  b)
    name="$(basename "$PWD" | x hostnameise)"
    cmd="$1"
    shift
    case "$cmd" in
    r) dk run --interactive --rm --tty --name "${USER}_$name" "$USER/$name" "$@" ;;
    rmi) dk rmi "$USER/$name" "$@" ;;
    *) dk build --tag "$USER/$name" "${@:-.}" ;;
    esac
    ;;
  i) dk image "${@:-ls}" ;;
  o) open -b com.docker.docker ;;
  q) osascript -e 'quit app "Docker"' ;;
  s) dk system "$@" ;;
  *) docker "$cmd" "$@" ;;
  esac
}
