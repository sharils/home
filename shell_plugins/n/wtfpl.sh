#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

wtfpl() {
  curl --silent 'http://www.wtfpl.net/txt/copying/' >LICENSE
}

wtfpl "$@"
