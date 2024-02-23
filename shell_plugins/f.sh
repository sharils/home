#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

f() {
  case "$1" in
  a) shift && set -- apps "$@" ;;
  d) shift && set -- deploy "$@" ;;
  h) shift && set -- help "$@" ;;
  l) shift && set -- logs "$@" ;;
  m) shift && set -- machine "$@" ;;
  n) shift && set -- launch "$@" ;;
  o)
    shift
    case "$1" in
    i) shift && set -- invite "$@" ;;
    esac
    set -- orgs "$@"
    ;;
  s) shift && set -- status "$@" ;;
  esac
  flyctl "$@"
}
