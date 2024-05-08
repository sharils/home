#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v() {
  ~/.local/bin/lvim "$@"
}

v "$@"
