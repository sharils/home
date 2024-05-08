#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  if [ $# -eq 0 ]; then
    set -- ^ "$@"
  else
    set -- "$*\|:$"
  fi
  sed -n '/^bindings.default:$/,/^bindings.commands:$/p' /Applications/qutebrowser.app/Contents/Resources/qutebrowser/config/configdata.yml | grep "$@"
}

u "$@"
