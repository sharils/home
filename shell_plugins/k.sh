#!/usr/bin/env bash

k() {
  cmd=$1
  shift

  case $cmd in

  d) keepassxc-cli diceware --words "${@:-12}" | tr -d \\n | pbcopy;;

  g)
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    ;;

  esac
}
