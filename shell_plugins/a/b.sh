#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  adb shell dumpsys battery
}

b "$@"
