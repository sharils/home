#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    LESS="$LESS --quit-if-one-screen" b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    LESS="$LESS --quit-if-one-screen" b "$@" --style=plain
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
  b) bat "$@" --style=plain ;;
  s) less "$@" ;;
  t) l --tree "$@" ;;
  x)
    cmd="$1"
    shift
    case "$cmd" in
      '') l x "$@" ;;
      b) l x "https://search.brave.com/search?q=$*" ;;
      dg) l x "https://ddg.gg/lite/?q=$*" ;;
      wp) l x "https://en.wikipedia.org/wiki/Special:Search?go=Go&ns0=1&search=$*" ;;
      *) lynx "$cmd" "$@" ;;
    esac
    ;;
  *)
    if [ -e "$cmd" ]; then
      lsd "$cmd" "$@"
    else
      l -"$cmd" "$@"
    fi
    ;;
  esac
}
