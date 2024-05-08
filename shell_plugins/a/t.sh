#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

t() {
  adb -d tcpip "${@:-5555}"
}

t "$@"
