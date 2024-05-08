#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

A() {
  dig +short "$@" A
}

A "$@"
