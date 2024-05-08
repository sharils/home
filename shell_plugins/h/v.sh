#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h() {
  vim -i NONE +"set buftype=help | help $*"
}

h "$@"
