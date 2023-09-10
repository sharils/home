#!/usr/bin/env sh

c() {
  case "$1" in
  gi) shift && git config --file "$SHARILS_HOME/gitignore.gitconfig" "${@:---edit}" ;;
  *) git c "$@" ;;
  esac
}

c "$@"
