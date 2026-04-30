#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

rating() {
  cat <<'EOF'
🟥 18+
🟧 15+
🟨 12+
🟦 6+
🟩 0+
EOF
}

rating "$@"
