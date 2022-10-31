#!/usr/bin/env sh

b() {
  if [ "$#" -eq 0 ]; then
    brew
    return
  fi

  cmd=$1
  shift
  case $cmd in
  i)
    brew install "$@"
    ;;

  inf)
    brew info "$@"
    ;;

  sr)
    brew search "$@"
    ;;

  *)
    brew "$cmd" "$@"
  esac
}
