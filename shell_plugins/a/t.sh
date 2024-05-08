#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

t() {
  adb tcpip "${@:-5555}"
}

t "$@"
