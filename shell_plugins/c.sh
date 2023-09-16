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

  d)
    case "$2" in
    o) shift 2 && set -- d --open "$@" ;;

    esac
    ;;

  e) shift && $EDITOR Cargo.toml && true && return $? ;;

  p) pwd | pbcopy && return $? ;;

  n)
    shift
    case "$1" in
    l) shift && set -- --lib "${@:-rust-app}" ;;

    esac
    cargo new "${@:-rust-app}"
    for last in "$@"; do :; done
    cd "$last" || return $?
    G_I_M="Execute cargo new ${*:-rust-app}" g i
    return $?
    ;;

  u) set -- update "$@" ;;

  esac
  cargo "$@"
}
