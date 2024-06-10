#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bmi() {
  cat <<'EOF'
健    康：18.5 <= BMI < 24
過    重：24   <= BMI < 27
輕度肥胖：27   <= BMI < 30
中度肥胖：30   <= BMI < 35
重度肥胖：35   <= BMI
EOF
}

bmi "$@"
