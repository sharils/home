#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

k_64() {
  keepassxc-cli generate --custom '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' "${@:---length=4}" | tr -d \\n | pbcopy && pbpaste
}

k_64 "$@"
