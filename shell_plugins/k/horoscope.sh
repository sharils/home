#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

horoscope() {
  printf '☉ ☽ ☿ ♀︎ ♂︎ ♃ ♄ ♅ ♆ ♇ ☊\n%s' "$K_HOROSCOPE"
}

horoscope "$@"
