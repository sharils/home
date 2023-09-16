#!/usr/bin/env sh

etc() {
  cat <<SH
etc:
  %U, %d %b %Y %T GMT: IMF-fixdate, $(/usr/bin/env date +'%U, %d %b %Y %T GMT')
SH
}

etc "$@"
