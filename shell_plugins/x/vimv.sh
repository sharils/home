#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# https://github.com/thameera/vimv
vimv() {
  [ -f "${vimv:=/tmp/x-vimv}" ] || {
    curl https://raw.githubusercontent.com/thameera/vimv/master/vimv >"$vimv"
    chmod +x "$vimv"
  }
  "$vimv"
}

vimv "$@"
