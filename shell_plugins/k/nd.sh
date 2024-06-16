#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# normal distortion
nd() {
  cat <<'EOF'
0.1% 2.1% 13.6% 34.1% 34.1% 13.6% 2.1% 0.1%
EOF
}

nd "$@"
