#!/usr/bin/env sh

getnf() {
  [ -f '/tmp/getnf' ] || curl -s 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' >'/tmp/getnf'
  bash '/tmp/getnf'
}

getnf "$@"
