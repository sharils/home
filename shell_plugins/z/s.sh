#!/usr/bin/env sh

s() {
  case "$1" in
  c) set -- /Camera ;;
  k) set -- /KeePass ;;
  l) set -- /Libera\ PRO ;;
  o) set -- /Obsidian ;;
  t) echo "$TODO_DIR" && return ;;
  esac
  echo "$HOME/Sync$*"
}

s "$@"
