#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

_ghostty() {
  ghostty +list-keybinds
}

_ghostty "$@"
