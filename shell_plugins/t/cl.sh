#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cl() {
  find . -name '*.bak' -delete
}

cl "$@"
