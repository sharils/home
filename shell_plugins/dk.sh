#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
  o) open -b com.docker.docker ;;
  q) osascript -e 'quit app "Docker"' ;;
  *) docker "$cmd" "$@" ;;
  esac
}
