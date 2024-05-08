#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

mac() {
  grep 'SOFTWARE LICENSE AGREEMENT FOR macOS' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | sed 's/.*\\f0\\b SOFTWARE LICENSE AGREEMENT FOR macOS \(.*\)\\.*/\1/' | pbcopy && pbpaste
}

mac "$@"
