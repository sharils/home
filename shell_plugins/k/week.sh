#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

week() {
  cat <<'EOF' | grep -i "${1:-^}"
UTR FM SW
MWF ST UR
TRS UW MF
WFU MR TS
RSM TF WU
FUT WS RM
SMW RU FT
EOF
}

week "$@"
