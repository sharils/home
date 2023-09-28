#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h() {
  case "$1" in
  d)
    shift
    case "$1" in
    o) shift && set -- online "$@" ;;
    *) set -- offline "${@}" ;;
    esac
    mix hex.docs "$@"
    ;;
  s) shift && m hex.search "$@" ;;
  *) mix help "$@" | col -bx | bat --language md --style=plain ;;
  esac
}

h "$@"
