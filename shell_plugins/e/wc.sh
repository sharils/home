#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e_wc() {
  cd "$SHARILS_HOME/Library/Preferences/espanso/match" || return $?

  find -- * -type f ! -name emoji.yml ! -name colour.yml -exec wc -l {} \; |
    sed 's/\.yml//' |
    sort -rk 1 |
    column
}

e_wc "$@"
