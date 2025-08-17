#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  sp) shift && set -- smileys-people "$@" ;;
  an) shift && set -- animals-nature "$@" ;;
  fd) shift && set -- food-drink "$@" ;;
  a) shift && set -- activity "$@" ;;
  tp) shift && set -- travel-places "$@" ;;
  o) shift && set -- objects "$@" ;;
  s) shift && set -- symbols "$@" ;;
  f) shift && set -- flags "$@" ;;
  ls) shift && set -- "$(ls "$SHARILS_HOME/emoji/"  | sed 's/.png//g' | fzf)" "$@" ;;
  esac

  case "$1" in
  smileys-people | animals-nature | food-drink | activity | travel-places | objects | symbols | flags) open "$SHARILS_HOME/emoji/$1.png" ;;
  *) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;
  esac
}

e "$@"
