#!/usr/bin/env sh

u() {
  cmd="$1"
  shift

  case "$cmd" in

  e) $EDITOR "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/greasemonkey" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  rm) rm -fir "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  *) echo 'not implemented yet' ;;

  esac
}
