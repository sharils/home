#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h_grep() {
  (cd "$SHARILS_HOME" && grep --recursive "$*" .)
}

h_grep "$@"
