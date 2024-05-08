#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

credit_card() {
  cat <<'EOF'
VISA: 4111 1111 1111 1111
MasterCard: 5555 5555 5555 4444
Discover: 6011 6011 6011 6611
AmEx: 3782 8224 6310 005
EOF
}

credit_card "$@"
