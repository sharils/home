#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

salary() {
  cat <<'EOF'
100K USD/y = 3M TWD/y
= 8.33K USD/m = 250K TWD/m
= 50 USD/h = 1.5K TWD/h

50K USD/y = 1.5M TWD/y
= 4.16K USD/m = 125K TWD/m
= 25 USD/h = 750 TWD/h

25K USD/y = 750K TWD/y
= 2.08K USD/m = 62.5K TWD/m
= 12.5 USD/h = 375 TWD/h
EOF
}

salary "$@"
