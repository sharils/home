#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

date() {
  cat <<SH
date:
  %D: %m/%d/%y, $(/usr/bin/env date +%D)
  %F: %Y-%m-%d, $(/usr/bin/env date +%F)
  %v: %e-%b-%y, $(/usr/bin/env date +%v)
  %x: national, $(/usr/bin/env date +%x)
  %Ex: POSIX, $(/usr/bin/env date +%Ex)
SH
  :
}

date "$@"
