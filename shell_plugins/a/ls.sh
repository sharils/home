#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a_ls() {
  case "$1" in
  a)
    shift
    case "$1" in
    js) shift && asdf list all nodejs "$2" ;;
    *) echo 'not implemented' >&2 ;;
    esac
    ;;
  js) shift && asdf list nodejs "$2" ;;
  *) aws lightsail "$@" ;;
  esac
}

a_ls "$@"
