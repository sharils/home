#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

devices() {
  cat <<'EOF'
LG         WD-90MGA   DD直驅變頻滾筒洗衣機 白 / 9公斤洗衣容量
Panasonic  NI-GHK045  2in1 蒸氣電熨斗
EOF
}

devices "$@"
