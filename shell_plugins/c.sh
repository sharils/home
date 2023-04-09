#!/usr/bin/env sh

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  case "$1" in
  n) shift && set -- new "${@:-rust-app}" ;;
  esac
  cargo "$@"
}
