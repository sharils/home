#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d() {
  case "$1" in
  l) shift && cmd='local' ;;
  s) shift && cmd='shell' ;;
  *) echo not implemented >&2 ;;
  esac

  case "$1" in
  js) shift && name='nodejs' ;;
  *) echo not implemented >&2 ;;
  esac

  if [ $# -eq 0 ]; then
    asdf list "$name"
    return
  fi

  case "$1" in
  l) shift && set -- latest "$@" ;;
  s) shift && set -- system "$@" ;;
  esac

  asdf direnv "$cmd" "$name" "$@"
}

d "$@"
