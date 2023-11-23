#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a_ls() {
  case "$1" in
  js) shift && asdf list nodejs "$2" ;;
  *) aws lightsail "$@" ;;
  esac
}

a_ls "$@"
