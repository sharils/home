#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

s() {
  case "$1" in

  b) shift && $BROWSER "http://$(s t cli config gui dump-json | jq --raw-output .address)" ;;

  id) shift && s t cli show system | jq --raw-output .myID | tee /dev/stderr | npx --yes qrcode-terminal ;;

  l)
    # shellcheck disable=SC2015
    shift
    connections="$(s t cli show connections)" || return $?
    printf %s "$connections" | jq '.connections | to_entries | map(select(.value.connected)) | from_entries | length'
    ;;

  o) shift && open -b com.github.xor-gate.syncthing-macosx "$@" && s w ;;

  ps)
    shift
    # shellcheck disable=SC2009
    ps aux | grep syncthing
    ;;

  q)
    shift
    osascript -e 'quit app "Syncthing"'
    case "$1" in
    a) "$SHARILS_HOME/shell_plugins/x/su.sh" "osascript -e 'quit app \"Syncthing\"'" ;;
    esac
    ;;

  t) shift && /Applications/Syncthing.app/Contents/Resources/syncthing/syncthing "${@:---help}" ;;

  w)
    while
      if ! connections="$(s t cli show connections)"; then
        echo "$connections" | xargs
      elif [ "$(printf %s "$connections" | jq '.connections | map(select(.connected)) | length' | tee /dev/stderr)" -eq 3 ]; then
        return
      fi
      sleep 1
    do :; done
    ;;

  esac
}
