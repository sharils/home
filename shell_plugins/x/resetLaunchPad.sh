#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

resetLaunchPad() {
  defaults write com.apple.dock "$1" -bool true
  killall Dock
}

resetLaunchPad "$@"
