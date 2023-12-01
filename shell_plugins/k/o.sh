#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

o() {
  keepassxc-cli open "${K_O:?}" "$@"
}

o "$@"
