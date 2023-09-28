#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  if [ $# -eq 0 ]; then
    $EDITOR mix.exs
    return
  fi
  case "$1" in
  c) shift && mix ecto.create "$@" ;;
  m)
    shift
    case "$1" in
    g) mix ecto.gen.migration "$@" ;;
    ls) mix ecto.migrations "$@" ;;
    *) mix ecto.migrate "$@" ;;
    esac
    ;;
  *)
    tmp="$(mktemp)"
    grep --line-number --with-filename "$1" mix.exs >"$tmp"
    vim -q "$tmp"
    ;;
  esac
}

e "$@"
