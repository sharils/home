#!/usr/bin/env bash

k() {
  cmd=$1
  shift

  case $cmd in

  b)
    crockfords_base32="0123456789ABCDEFGHJKMNPQRSTVWXYZ"
    keepassxc-cli generate --custom "$crockfords_base32" --length "${@:-4}" | tr -d \\n | pbcopy
    pbpaste
    ;;

  d)
    # -4 for numeric and special
    cmd="$((${1:-100} - 4))"
    for words in {12..4}; do
      pass="$(keepassxc-cli diceware --words "$words")"
      [ "${#pass}" -lt "$cmd" ] && break
    done
    for _ in {1..10}; do
      longer="$(keepassxc-cli diceware --words "$words")"
      [ "${#pass}" -lt "${#longer}" ] && [ "${#longer}" -lt "$cmd" ] && pass="$longer"
    done
    printf '%s %s %s' "$pass" \
      "$(keepassxc-cli generate --length 1 --numeric)" \
      "$(keepassxc-cli generate --length 1 --custom "${K_D_CUSTOM:-"!'()*-.~"}")" |
      xargs -n1 |
      sort -R |
      xargs |
      perl -pe 's/\b\w/\U$&/g' |
      tr -d \\n |
      tr ' ' _ |
      pbcopy
    pbpaste | wc
    ;;

  g)
    no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
    keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
    pbpaste | wc
    ;;

  esac
}
