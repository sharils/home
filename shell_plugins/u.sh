#!/usr/bin/env sh

u() {
  cmd="$1"
  shift

  case "$cmd" in

  clean) rm "${@:--fir}" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  e) $EDITOR "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/.qutebrowser/greasemonkey" ;;

  l) l "$@" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  *) qutebrowser "$@" ;;

  esac
}
