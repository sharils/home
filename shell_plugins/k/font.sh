#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

font() {
  cat <<'EOF'
!#$%&()*+,-./:;<=>?@[\]^_`{|}~
0123456789
ABCDEFGHIJKLMNOPQRSTUVWXYZ
abcdefghijklmnopqrstuvwxyz
`'‘’ "“” 0Oo i1Il|L 6b 9g
EOF
}

font "$@"
