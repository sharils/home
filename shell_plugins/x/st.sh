#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

st() {
  case "$1" in

  l) shift && st ls | jq length ;;

  ls)
    # shellcheck disable=SC2015
    shift && st cli show connections || return $? | jq '.connections | to_entries | map(select(.value.connected)) | from_entries'
    ;;

  o) shift && open -b com.github.xor-gate.syncthing-macosx "$@" ;;

  ps)
    shift
    # shellcheck disable=SC2009
    ps aux | grep syncthing
    ;;

  q) shift && osascript -e 'quit app "Syncthing"' ;;

  su)
    shift
    case "$1" in
    q) shift && "$SHARILS_HOME/shell_plugins/x/su.sh" "osascript -e 'quit app \"Syncthing\"'" ;;
    *) echo not implemented >&2 ;;
    esac
    ;;

  t)
    shift
    case "$(osascript -e 'tell application "System Events" to (name of processes) contains "Syncthing"')" in
    false) open -b com.github.xor-gate.syncthing-macosx ;; # osascript -e 'id of app "Syncthing"'
    true) osascript -e 'quit app "Syncthing"' ;;
    esac
    ;;

  w) while [ "$(st l | tee /dev/stderr)" -ne 3 ]; do sleep 1; done ;;

  *) /Applications/Syncthing.app/Contents/Resources/syncthing/syncthing "${@:---help}" ;;

  esac
}

st "$@"
