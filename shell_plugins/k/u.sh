#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  sed -n '3527,3842p' /Applications/qutebrowser.app/Contents/Resources/qutebrowser/config/configdata.yml | grep "$*"
}

u "$@"
