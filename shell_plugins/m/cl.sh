#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cl() {
  mix clean "$@"
}

cl "$@"
