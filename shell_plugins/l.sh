#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    LESS="$LESS --quit-if-one-screen" b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    LESS="$LESS --quit-if-one-screen" b --plain "$@"
    return
  fi

  cmd="$1"
  shift
  case "$cmd" in
  '') lsd ;;
  -*) lsd "$cmd" "$@" ;;
  F) less +F "$@" ;;
  t) l --tree "$@" ;;
  *)
    if [ -e "$cmd" ]; then
      lsd "$cmd" "$@"
    else
      l -"$cmd" "$@"
    fi
    ;;
  esac
}
