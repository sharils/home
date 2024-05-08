#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

STDIN() {
  case "$1" in
  uri) shift && grep --extended-regexp --only-matching "(?:file:///|https?://)[[:alnum:]-]+(?:\.[[:alnum:]-]+)*[^>]*|[[:alnum:]-]+(\.[[:alnum:]-]+)*\.(?:com|geek|gg|org)/[^ '>]+" ;;
  # g -n "$@" # Segmentation fault: 11
  *) grep "$@" ;;
  esac
}

STDIN "$@"
