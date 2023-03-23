#!/usr/bin/env sh

e() {
  case "${1:-edit}" in

  e)
    shift
    [ "$1" = e ] && shift && set -- emoji "$@"
    e edit "${@:-base}"
    ;;

  l) shift && e log "$@" ;;

  s)
    shift
    case "$1" in
    R) shift && set -- register "$@" ;;
    r) shift && set -- restart "$@" ;;
    s) shift && set -- start "$@" ;;
    esac
    e service "${@:-status}"
    ;;

  x)
    shift
    case "$1" in
    s) shift && set -- submit "$@" ;;
    esac
    exercism "$@"
    ;;

  *) espanso "$@" ;;

  esac
}
