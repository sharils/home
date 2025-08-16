#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  smileys\&people | animals\&nature | food\&drink | activity | travel\&places | objects | symbols | flags) open "$SHARILS_HOME/emoji/$1.png" ;;
  *) $EDITOR "$@" ~/.config/karabiner/karabiner.json ;;
  esac
}

e "$@"
