#!/usr/bin/env sh

h() {
  case "$1" in
  d)
    shift
    case "$1" in
    o) shift && set -- online "$@" ;;
    *) set -- offline "${@}" ;;
    esac
    m hex.docs "$@"
    ;;
  s) shift && m hex.search "$@" ;;
  *) m help "$@" | l md ;;
  esac
}

h "$@"
