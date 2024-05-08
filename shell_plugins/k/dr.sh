#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# doomsday rule
dr() {
  century=$(date -jf%Y "$1" +%C)
  case "$century" in
  16) anchor=2 ;;
  17) anchor=0 ;;
  18) anchor=5 ;;
  19) anchor=3 ;;
  20) anchor=2 ;;
  21) anchor=0 ;;
  22) anchor=5 ;;
  esac

  year_short="$(date -jf%Y "$1" +%g)"
  a=$((year_short / 12))
  b=$((year_short % 12))
  c=$((b / 4))
  d=$(((a + b + c) % 7))
  doomsday=$(((d + anchor) % 7))

  cat <<EOF
1900–1999  We-in-dis-day  Wednesday
2000–2099  Y-Tue-K        Tuesday

century=$century
anchor=$anchor
year_short=$year_short
a=$a
b=$b
c=$c
d=$d
doomsday=$doomsday
EOF
}

dr "$@"
