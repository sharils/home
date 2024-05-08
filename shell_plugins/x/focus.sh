#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

focus() {
  now="$(date +%H%m)"
  [ "$now" -lt '1900' ] || [ '1930' -lt "$now" ]
}

focus "$@"
