#!/usr/bin/env bash

k() {
  cmd=$1
  shift

  case $cmd in

  b)
    crockfords_base32="0123456789ABCDEFGHJKMNPQRSTVWXYZ"
    keepassxc-cli generate --custom "$crockfords_base32" --length "${@:-4}" | tr -d \\n | pbcopy
    ;;

  d) keepassxc-cli diceware --words "${@:-12}" | tr -d \\n | pbcopy ;;

  g)
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    ;;

  esac
}
