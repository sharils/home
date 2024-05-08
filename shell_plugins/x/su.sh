#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

_su() {
  if [ $# -eq 0 ]; then
    sudo su - "${X_SU:?}" "$@"
    return $?
  fi

  case "$1" in
  b)
    shift
    case "$1" in
    i) shift && set -- install "$@" ;;
    ri) shift && set -- reinstall "$@" ;;
    rm) shift && set -- uninstall "$@" ;;
    esac
    set -- brew "$@"
    ;;
  k)
    shift
    case "$1" in
    o) shift && set -- open "${@:-"$X_SU_K_O"}" ;;
    esac
    set -- keepassxc-cli "$@"
    ;;
  esac
  sudo su "${X_SU:?}" -c "$*"
}

_su "$@"
