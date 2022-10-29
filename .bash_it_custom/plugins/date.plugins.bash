#!/usr/bin/env sh

d() {
  cmd="$1"
  shift

  case $cmd in
  I)
    date +%Y%m%dT%H%M%S%z | sed "s/00$//"
    ;;
  i)
    date +%FT%T%z | sed "s/00$//"
    ;;
  U)
    date -u +%Y%m%dT%H%M%SZ
    ;;
  u)
    date -u +%FT%TZ
    ;;
  s)
    date -u +%s
    ;;
  esac
}
