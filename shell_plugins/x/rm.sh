#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_rm() {
  args=$(printf '%s\n' "$@")
  printf '%s\n' "$args" | while read -r arg; do
    osascript - "$(realpath "$arg")" <<APPLESCRIPT
on run argv
  set posix_files to {}

  repeat with arg in argv
    set end of posix_files to the POSIX file arg
  end repeat

  tell application "Finder" to move posix_files to trash
end run
APPLESCRIPT
  done
}

x_rm "$@"
