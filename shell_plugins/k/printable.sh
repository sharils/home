#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

printable() {
  cat <<'TEXT'
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
TEXT
}

printable "$@"
