#!/usr/bin/env sh

g() {
  no_url_encode="!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"
  keepassxc-cli generate --custom "$no_url_encode" --length "${@:-40}" | tr -d \\n | pbcopy
  pbpaste | wc
}

g "$@"
