#!/usr/bin/env sh

resetLaunchPad() {
  defaults write com.apple.dock "$1" -bool true
  killall Dock
}

resetLaunchPad "$@"
