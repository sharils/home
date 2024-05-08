#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

perfect() {
  {
    cat <<'EOF'
6
28
496
8128
33550336
8589869056
137438691328
EOF
  } | {
    if ! [ -t 1 ]; then
      cat
    else
      cat -n
    fi
  }
}

perfect "$@"
