#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

i() {
  case "$1" in
  js) shift && name='nodejs' ;;
  *) name="$1" && shift ;;
  esac

  case "$1" in
  l) shift && set -- latest "$@" ;;
  s) shift && set -- system "$@" ;;
  esac

  asdf install "$name" "$@"
}

i "$@"
