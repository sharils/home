#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  keepassxc-cli generate --custom '0123456789ABCDEFGHJKMNPQRSTVWXYZ' --length "${@:-4}" | tr -d \\n | pbcopy && pbpaste
}

b "$@"
