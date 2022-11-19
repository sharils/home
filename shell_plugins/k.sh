#!/usr/bin/env bash

k() {
  cmd=$1
  shift

  case $cmd in

  d) keepassxc-cli diceware --words "${@:-12}" | tr -d \\n | pbcopy;;

  g)
    url_ok="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$url_ok" --length "${@:-40}" | tr -d \\n | pbcopy
    ;;

  esac
}
