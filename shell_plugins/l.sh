#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    LESS="$LESS --quit-if-one-screen" b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    LESS="$LESS --quit-if-one-screen" b --style=plain "$@"
    return
  fi

  if echo "$1" | g url >/dev/null; then
    lynx "$@"
    return
  fi

  cmd="$1"
  shift
  case "$cmd" in
  '') lsd ;;
  -*) lsd "$cmd" "$@" ;;
  F) less +F "$@" ;;
  s) less "$@" ;;
  t) l --tree "$@" ;;
  x) lynx "$@" ;;
  *)
    if [ -e "$cmd" ]; then
      lsd "$cmd" "$@"
    else
      l -"$cmd" "$@"
    fi
    ;;
  esac
}
