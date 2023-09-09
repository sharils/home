#!/usr/bin/env sh

printable() {
  cat <<'TEXT'
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
TEXT
}

printable "$@"
