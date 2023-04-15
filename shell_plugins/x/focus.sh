#!/usr/bin/env sh

focus() {
  now="$(date +%H%m)"
  [ "$now" -lt '1900' ] || [ '1930' -lt "$now" ]
}

focus "$@"
