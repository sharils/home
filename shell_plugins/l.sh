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
  b) l x "https://search.brave.com/search?q=$*" ;;
  dg) l x "https://lite.duckduckgo.com/lite/?q=$*" ;;
  g) l x "https://www.google.com/search?client=firefox-b-d&gbv=1&q=$*" ;;
  od) l x "https://www.oxfordlearnersdictionaries.com/definition/english/$*_1" ;;
  s) less "$@" ;;
  t) l --tree "$@" ;;
  wk) l x "https://en.wiktionary.org/wiki/$*#Esperanto" ;;
  wp) l x "https://en.wikipedia.org/wiki/Special:Search?go=Go&ns0=1&search=$*" ;;
  wz) l x "https://zh.wikipedia.org/wiki/$*" ;;
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
