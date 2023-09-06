#!/usr/bin/env sh

v_v() {
  case "$1" in
  erl) "$1" -version ;;
  *) "$@" --version ;;
  esac
}

v_v "$@"
