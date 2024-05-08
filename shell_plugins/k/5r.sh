#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

five_r() {
  cat <<'EOF'
劑量對 Right Drug
藥物對 Right Dose
時間對 Right Time
途徑對 Right Route
病人對 Right Person
EOF
}

five_r "$@"
