#!/usr/bin/env sh

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  case "$1" in
  a) shift && set -- add "$@" ;;
  e) [ -f Cargo.toml ] && $EDITOR Cargo.toml || return $? ;;
  n) shift && set -- new "${@:-rust-app}" ;;
  esac
  cargo "$@"
}
