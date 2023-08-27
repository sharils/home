#!/usr/bin/env sh

u() {
  case "$1" in

  clean) shift && rm "${@:--fir}" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  e) vim -p "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/.qutebrowser/config.py" "$HOME/.qutebrowser/greasemonkey" ;;

  l) shift && l "$@" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  *) qutebrowser "$@" ;;

  esac
}
