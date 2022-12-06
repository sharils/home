#!/usr/bin/env sh

b() {
  if [ $# -eq 0 ] || [ -r "$1" ]; then
    bat "$@"
    return
  fi

  cmd="$1"
  shift

  case "$cmd" in
  h) brew help "$@" ;;
  i) brew install "$@" ;;
  ri) brew reinstall "$@" ;;
  out) brew outdated "$@" ;;
  *) brew "$cmd" "$@"
  esac

}
