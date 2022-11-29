#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
  b)
    base="$(basename "$PWD" | x hostnameise)"
    name="${base}_$USER"
    tag="$base/$USER"
    cmd="$1"
    shift
    case "$cmd" in
    r) dk run --interactive --rm --tty --name "$name" "$tag" "$@" ;;
    rmi) dk rmi "$tag" "$@" ;;
    s) dk stop "$name" ;;
    *) dk build --tag "$tag" "${@:-.}" ;;
    esac
    ;;
  i) dk image "${@:-ls}" ;;
  o) open -b com.docker.docker ;;
  q) osascript -e 'quit app "Docker"' ;;
  s) dk system "$@" ;;
  *) docker "$cmd" "$@" ;;
  esac
}
