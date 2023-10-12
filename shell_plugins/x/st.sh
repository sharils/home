#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

st() {
  case "$(osascript -e 'tell application "System Events" to (name of processes) contains "Syncthing"')" in
  false) open -b com.github.xor-gate.syncthing-macosx ;; # osascript -e 'id of app "Syncthing"'
  true) osascript -e 'quit app "Syncthing"' ;;
  esac
}

st "$@"
