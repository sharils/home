#!/usr/bin/env sh

u() {
  case "$1" in

  clean) shift && rm "${@:--fir}" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  e) vim -p "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/.qutebrowser/greasemonkey" "$HOME/.qutebrowser/config.py" ;;

  l) shift && l "$@" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  *) qutebrowser "$@" ;;

  esac
}
