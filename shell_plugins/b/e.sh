#!/usr/bin/env sh

e() {
  case "$1" in
  '') $EDITOR "$@" ~/.bash_profile ;;
  *) brew edit "$@" ;;
  esac
}

e "$@"
