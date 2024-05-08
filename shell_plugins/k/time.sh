#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

k_time() {
  cat <<'EOF'
午夜 00:00
凌晨 01:00
清晨 05:00
上午 08:00
中午 12:00
下午 13:00
晚上 19:00
EOF
}

k_time "$@"
