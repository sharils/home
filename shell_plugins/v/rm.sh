#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v_rm() {
  case "$1" in
  s) rm Session.vim ;;
  ycm) rm "$SHARILS_HOME/.vim/plugged/YouCompleteMe" ;;
  *) vim README.md ;;
  esac
}

v_rm "$@"
