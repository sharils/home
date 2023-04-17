#!/usr/bin/env sh

node() {
  [ $# -gt 0 ] && set -- "$*.html"
  lynx "https://nodejs.org/dist/latest-v18.x/docs/api/$*"
}

node "$@"
