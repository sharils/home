#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

showHidden() {
  defaults write com.apple.dock "$1" -bool true
  killall Dock
}

showHidden "$@"
