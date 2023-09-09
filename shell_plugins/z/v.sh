#!/usr/bin/env sh

v() {
  case "$1" in
  a)
    shift
    case "$1" in
    f) set -- /plugged/after/ftplugin ;;
    *) set -- /plugged/after/plugin ;;
    esac
    ;;
  b)
    shift
    case "$1" in
    f) set -- /plugged/before/ftplugin ;;
    *) set -- /plugged/before/plugin ;;
    esac
    ;;
  u)
    shift
    case "$1" in
    p) set -- /plugged/after/pythonx ;;
    *) set -- /UltiSnips ;;
    esac
    ;;
  esac
  cd "$SHARILS_HOME/.vim$*" || return
}

v "$@"
