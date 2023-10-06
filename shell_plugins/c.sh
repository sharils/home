#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  if [ -f "$1" ]; then
    cat "$1"
    return
  fi

  case "$1" in

  I) curl --head --proto-default 'https' "$@" ;;

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

  ta | w) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/c/$cmd.sh" "$@" && return $? ;;

  esac
  cargo "$@"
}
