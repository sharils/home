#!/usr/bin/env sh

u() {
  case "$1" in

  clean) shift && rm "${@:--fir}" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/u/e.sh" "$@" ;;

  l) shift && l "$@" "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  o) open -b org.qt-project.Qt.QtWebEngineCore ;;

  *) qutebrowser "$@" ;;

  esac
}
