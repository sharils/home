#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

lnks() {
  [ -f /tmp/lnks.sh ] || {
    curl https://raw.githubusercontent.com/hamvocke/lnks/main/lnks.sh >/tmp/lnks.sh
    chmod +x /tmp/lnks.sh
  }
  /tmp/lnks.sh
}

lnks "$@"
