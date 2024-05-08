#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

getnf() {
  [ -f '/tmp/getnf' ] || curl -s 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' >'/tmp/getnf'
  bash '/tmp/getnf'
}

getnf "$@"
