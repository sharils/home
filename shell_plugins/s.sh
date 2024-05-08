#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

s() {
  case "$1" in

  b) shift && $BROWSER "http://$(s t cli config gui dump-json | jq --raw-output .address)" ;;

  cap) shift && tr '[:lower:]' '[:upper:]' | perl -pe 's/(?<=[[:alpha:]])./\L$&/g' ;;

  cf) shift && shortcuts run 🎨 "$@" ;;

  id) shift && s t cli show system | jq --raw-output .myID | tee /dev/stderr | npx --yes qrcode-terminal ;;

  l)
    # shellcheck disable=SC2015
    shift
    connections="$(s t cli show connections)" || return $?
    printf %s "$connections" | jq '.connections | to_entries | map(select(.value.connected)) | from_entries | length'
    ;;

  ls) shift && shortcuts list "$@" ;;

  o) shift && open -b com.github.xor-gate.syncthing-macosx "$@" && s w ;;

  ps)
    shift
    # shellcheck disable=SC2009
    ps aux | grep syncthing
    ;;

  r) shift && t cli operations restart "$@" ;;

  q)
    shift
    s w
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
      elif [ "$(printf %s "$connections" | jq '.connections | map(select(.connected)) | length')" -eq "${S_W:?}" ]; then
        printf %s "$connections" | jq '.connections | map(select(.connected)) | length'
        return
      else
        date '+%Y-%m-%dT%H:%M:%S%z'
        printf %s "$connections" | jq '.connections | map(select(.connected)) | length' | tr -d \\n
        printf '\t'
        printf %s "$connections" | jq --raw-output '.connections | to_entries | map(select(.value.connected)) | map(.key)[]' | {
          while IFS= read -r deviceID; do
            s t cli config devices "$deviceID" name get
          done
        } | tr \\n \\t | sed 's/\t$//'
        printf '\t'
      fi
      sleep 1
    do :; done
    ;;

  esac
}
