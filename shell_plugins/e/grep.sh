#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e_grep() {
  (cd  "$SHARILS_HOME/Library/Preferences/espanso/match" && grep --recursive "$*" .)
}

e_grep "$@"
