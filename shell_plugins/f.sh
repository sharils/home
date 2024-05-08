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
  c)
    shift
    case "$1" in
    a) shift && set -- add "$@" ;;
    v) shift && set -- show "$@" ;;
    esac
    set -- certs "$@"
    ;;
  d) shift && set -- deploy "$@" ;;
  e) shift && vim "$@" fly.toml ;;
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
  p)
    shift
    case "$1" in
    c) shift && set -- connect "$@" ;;
    esac
    set -- postgres "$@"
    ;;
  s)
    shift
    case "$1" in
    c) shift && set -- ssh console --pty -C "/app/bin/$* remote" ;;
    i) shift && set -- ssh issue --agent "$@" ;;
    *) set -- status "$@" ;;
    esac
    ;;
  esac
  flyctl "$@"
}
