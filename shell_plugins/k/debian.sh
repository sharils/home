#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

debian() {
  cat <<'EOF'
2014-07-02   6  Squeeze
2016-04-26   7  Wheezy
2018-06-17   8  Jessie
2020-07-06   9  Stretch
2022-08-01  10  Buster
2024-08-15  11  Bullseye
2026-06-11  12  Bookworm

https://wiki.debian.org/LTS
EOF
}

debian "$@"
