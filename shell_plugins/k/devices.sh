#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

devices() {
  cat <<'EOF'
LG  WD-90MGA  DD直驅變頻滾筒洗衣機 白 / 9公斤洗衣容量
EOF
}

devices "$@"
