#!/usr/bin/env sh

u() {
  cmd="$1"
  shift

  case "$cmd" in

  rm) rm -fr "$HOME/Library/Application Support/qutebrowser/webengine" ;;

  v) vim -p "$HOME/.qutebrowser/bookmarks/urls" "$HOME/.qutebrowser/quickmarks" "$HOME/Library/Preferences/qutebrowser/autoconfig.yml" "$HOME/.qutebrowser/greasemonkey" ;;

  *) echo 'not implemented yet' ;;

  esac
}
