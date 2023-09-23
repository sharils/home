#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  case "$1" in
  gi) shift && git config --file "$SHARILS_HOME/gitignore.gitconfig" "${@:---edit}" ;;
  l) shift && git config --local "${@:---edit}" ;;
  *) git c "$@" ;;
  esac
}

c "$@"
