#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

st() {
  case "$1" in
  l) st ls | jq length ;;
  ls) st cli show connections | jq '.connections | to_entries | map(select(.value.connected)) | from_entries' ;;
  o) open -b com.github.xor-gate.syncthing-macosx "$@" ;;
  ps)
    # shellcheck disable=SC2009
    ps aux | grep syncthing
    ;;
  q) osascript -e 'quit app "Syncthing"' ;;
  su)
    shift
    case "$1" in
    q) shift && "$SHARILS_HOME/shell_plugins/x/su.sh" "osascript -e 'quit app \"Syncthing\"'" ;;
    *) echo not implemented >&2 ;;
    esac
    ;;
  t)
    case "$(osascript -e 'tell application "System Events" to (name of processes) contains "Syncthing"')" in
    false) open -b com.github.xor-gate.syncthing-macosx ;; # osascript -e 'id of app "Syncthing"'
    true) osascript -e 'quit app "Syncthing"' ;;
    esac
    ;;
  *) /Applications/Syncthing.app/Contents/Resources/syncthing/syncthing "${@:---help}" ;;
  esac
}

st "$@"
