#!/usr/bin/env sh

u() {
  cmd="$1"
  shift

  case "$cmd" in

  e) $EDITOR "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/greasemonkey" ;;

  h)
    # shellcheck disable=SC2016
    yq --raw-output --yaml-output --arg contains "$*" '.["bindings.default"].default' /Applications/qutebrowser.app/Contents/Resources/config/configdata.yml | grep "$*"
    ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  rm) rm -fr "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  *) echo 'not implemented yet' ;;

  esac
}
