#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ddx() {
  cat <<'EOF'
- List symptoms
- List possible causes
- Sort by possibility
- Run a test

https://web.archive.org/web/20230328222738/https://blog.danslimmon.com/2012/07/20/you-know-whos-smart-friggin-doctors-man/
EOF
}

ddx "$@"
