#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bak() {
  find . -name '*.bak' -delete
}

bak "$@"
