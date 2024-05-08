#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

one() {
  cat <<'EOF'
+ 15.2.  Informational 1xx
     o 15.2.1.  100 Continue
     o 15.2.2.  101 Switching Protocols
EOF
}

one "$@"
