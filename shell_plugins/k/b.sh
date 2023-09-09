#!/usr/bin/env sh

b() {
  keepassxc-cli generate --custom '0123456789ABCDEFGHJKMNPQRSTVWXYZ' --length "${@:-4}" | tr -d \\n | pbcopy
  pbpaste
}

b "$@"
