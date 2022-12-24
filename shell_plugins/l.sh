#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    b --plain "$@"
    return
  fi

  cmd="$1"
  shift
  case "$cmd" in
  '') lsd ;;
  -*) lsd "$cmd" "$@" ;;
  t) l --tree "$@" ;;
  *) [ ! -e "$cmd" ] && l -"$cmd" "$@" ;;
  esac
}
