#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

up() {
  vagrant up "$@"
}

up "$@"
