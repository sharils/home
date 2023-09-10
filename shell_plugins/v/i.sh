#!/usr/bin/env sh

i() {
  case "${1:-html}" in
  c) shift && set -- css ;;
  h) shift && set -- html ;;
  j) shift && set -- jsx ;;
  t) shift && set -- tsx ;;
  esac
  vim "index.$1"
}

i "$@"
