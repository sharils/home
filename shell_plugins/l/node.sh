#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

node() {
  [ $# -gt 0 ] && set -- "$*.html"
  lynx "https://nodejs.org/dist/latest-v18.x/docs/api/$*"
}

node "$@"
