#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

f() {
  case "$1" in
  a)
    shift
    case "$1" in
    o) shift && set -- open "$@" ;;
    esac
    set -- apps "$@"
    ;;
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
  s)
    shift
    case "$1" in
    i) shift && set -- ssh issue --agent "$@" ;;
    *) set -- status "$@" ;;
    esac
    ;;
  esac
  flyctl "$@"
}
