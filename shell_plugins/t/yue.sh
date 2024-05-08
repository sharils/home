#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

yue() {
  printf "%s\n%s\n" "$1" "$2" >>yue.txt
}

yue "$@"
