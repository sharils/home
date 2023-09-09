#!/usr/bin/env sh

s() {
  case "$1" in
  c) set -- /Camera ;;
  k) set -- /KeePass ;;
  l) set -- /Libera\ PRO ;;
  o) set -- /Obsidian ;;
  t) cd "$TODO_DIR" && true && return $? ;;
  esac
  cd "$HOME/Sync$*" || return
}

s "$@"
