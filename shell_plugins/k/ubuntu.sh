#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ubuntu() {
  cat <<'EOF'
24.04 Noble Numbat
22.04 Jammy Jellyfish
20.04 Focal Fossa
18.04 Bionic Beaver
16.04 Xenial Xerus
14.04 Trusty Tahr

https://ubuntu.com/about/release-cycle#server-desktop-eol-old
EOF
}

ubuntu "$@"
