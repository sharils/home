#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

title() {
  printf '\033];%s\007' "$@"
}

title "$@"
