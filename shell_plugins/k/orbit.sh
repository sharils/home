#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

orbit() {
  cat <<'EOF'
Planet   Orbital  Earth-Year
Mercury  87.97    4.15
Venus    224.70   1.63
Earth    365.25   1.00
Mars     686.98   0.53
Jupiter  11.86    0.084
Saturn   29.46    0.034
Uranus   84.01    0.012
Neptune  164.79   0.006
EOF
}

orbit "$@"
