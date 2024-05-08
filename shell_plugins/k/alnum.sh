#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

alnum() {
  no_url_encode="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
  pbpaste | wc
}

alnum "$@"
