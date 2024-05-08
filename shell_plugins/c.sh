#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  if [ $# -eq 0 ]; then
    caffeine -ut86400
    return $?
  fi

  if [ -f "$1" ]; then
    cat "$1"
    return
  fi

  case "$1" in

  I) shift && curl --head "$@" && return $? ;;

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

  [0-9][smhd])
    unit="$(echo "$1" | cut -c2-2)"
    amount="$(echo "$1" | cut -c1-1)"
    if [ "$unit" = 'd' ]; then
      amount="$(echo "$amount * 24" | bc -l)"
      unit=h
    fi
    if [ "$unit" = 'h' ]; then
      amount="$(echo "$amount * 60" | bc -l)"
      unit=m
    fi
    if [ "$unit" = 'm' ]; then
      amount="$(echo "$amount * 60" | bc -l)"
      unit=s
    fi
    if [ "$unit" = 's' ]; then
      caffeinate -ut"$amount"
    fi
    return $?
    ;;

  rt | ta | v | w) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/c/$cmd.sh" "$@" && return $? ;;

  esac
  cargo "$@"
}
