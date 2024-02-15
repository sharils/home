#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

roc() {
  printf 'Year %s is either Gregorian %s or ROC %s.' "${*}" "$((${*} + 1911))" "$((${*} - 1911))"
}

roc "$@"
