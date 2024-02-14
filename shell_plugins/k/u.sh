#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  sed -n '/^bindings.default:$/,/^bindings.commands:$/p' /Applications/qutebrowser.app/Contents/Resources/qutebrowser/config/configdata.yml | grep "$*"
}

u "$@"
