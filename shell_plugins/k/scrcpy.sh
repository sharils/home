#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

scrcpy() {
  man scrcpy | sed -n '/In the following list/,/Push file to device/p' | bat --language man --style=plain
}

scrcpy "$@"
