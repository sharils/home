#!/usr/bin/env sh

v_rm() {
  case "$1" in
  s) rm Session.vim ;;
  *) vim README.md ;;
  esac
}

v_rm "$@"
