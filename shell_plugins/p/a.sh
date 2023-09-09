#!/usr/bin/env sh

a() {
  case "$1" in
  D) shift && set -- --group dev "$@" ;;
  esac
  poetry add "$@"
}

a "$@"
