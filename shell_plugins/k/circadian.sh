#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

circadian() {
  if [ $# -eq 0 ]; then
    set -- "$(date +%k%M)" "$@"
  fi

  if [ "$1" -le 200 ]; then
    shift && set -- 02:00 "$@"
  elif [ "$1" -le 430 ]; then
    shift && set -- 04:30 "$@"
  elif [ "$1" -le 645 ]; then
    shift && set -- 06:45 "$@"
  elif [ "$1" -le 730 ]; then
    shift && set -- 07:30 "$@"
  elif [ "$1" -le 830 ]; then
    shift && set -- 08:30 "$@"
  elif [ "$1" -le 900 ]; then
    shift && set -- 09:00 "$@"
  elif [ "$1" -le 1000 ]; then
    shift && set -- 10:00 "$@"
  elif [ "$1" -le 1400 ]; then
    shift && set -- 14:00 "$@"
  elif [ "$1" -le 1530 ]; then
    shift && set -- 15:30 "$@"
  elif [ "$1" -le 1700 ]; then
    shift && set -- 17:00 "$@"
  elif [ "$1" -le 1830 ]; then
    shift && set -- 18:30 "$@"
  elif [ "$1" -le 1900 ]; then
    shift && set -- 19:00 "$@"
  elif [ "$1" -le 2100 ]; then
    shift && set -- 21:00 "$@"
  elif [ "$1" -le 2230 ]; then
    shift && set -- 22:30 "$@"
  fi

  cat <<'EOF' | grep -E "^(?:$1.*)?"
02:00  Deepest sleep
04:30  Lowest body temperature
06:45  Sharpest rise in blood pressure
07:30  Melatonin secretion stops
08:30  Bowel movement likely
09:00  Highest testosterone secretion
10:00  High alertness
14:30  Best coordination
15:30  Fastest reaction time
17:00  Greatest cardiovascular efficiency and muscle strength
18:30  Highest blood pressure
19:00  Highest body temperature
21:00  Melatonin secretion starts
22:30  Bowel movements suppressed
https://en.wikipedia.org/wiki/Sleep#Circadian_clock
EOF
  return $?
}

circadian "$@"
