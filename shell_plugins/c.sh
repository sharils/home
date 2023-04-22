#!/usr/bin/env sh

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  case "$1" in
  a) shift && set -- add "$@" ;;
  b)
    shift
    case "$1" in
    r) shift && set -- --release "$@" ;;
    esac
    set -- build "$@"
    ;;
  e) [ -f Cargo.toml ] && $EDITOR Cargo.toml || return $? ;;
  n)
    shift
    cargo new "${@:-rust-app}"
    cd "$1" || return $?
    g i
    return $?
    ;;
  esac
  cargo "$@"
}
