#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

med() {
  offset="${K_MED:-0}"
  if [ $# -eq 0 ]; then
    hour=$(date +%k%M)
    if [ "$hour" -le $((630 + offset)) ]; then
      set -- $((530 + offset)) "$@"
    elif [ "$hour" -le $((830 + offset)) ]; then
      set -- $((730 + offset)) "$@"
    elif [ "$hour" -le $((1030 + offset)) ]; then
      set -- $((930 + offset)) "$@"
    elif [ "$hour" -le $((1230 + offset)) ]; then
      set -- $((1130 + offset)) "$@"
    elif [ "$hour" -le $((1430 + offset)) ]; then
      set -- $((1330 + offset)) "$@"
    elif [ "$hour" -le $((1630 + offset)) ]; then
      set -- $((1530 + offset)) "$@"
    elif [ "$hour" -le $((1830 + offset)) ]; then
      set -- $((1730 + offset)) "$@"
    elif [ "$hour" -le $((2030 + offset)) ]; then
      set -- $((1930 + offset)) "$@"
    else
      set -- $((2130 + offset)) "$@"
    fi
  fi

  cat <<EOF | grep -E "^(?: ?$1.*)?"
$(date +%k%M)  #    P  M   K      2  # Notes
$(printf %4s $((530 + offset)))  1           W      F  # Water
$(printf %4s $((730 + offset)))  2 1  P  TO  WT CM  T  # The Pretty Octopus Witch Twinks Candy Mountain
$(printf %4s $((930 + offset)))  3 2      U  W H    F  # Use Water Hose
$(printf %4s $((1130 + offset)))  4 3     T   WT  M  F  # Ten White Tiger Meow
$(printf %4s $((1330 + offset)))  5 4         W  CM  F  # Wolves Chase Moon
$(printf %4s $((1530 + offset)))  6 5     T   WT  M  F  # Toads Will Tolerate Mud
$(printf %4s $((1730 + offset)))  7 6         W   M  F  # Working Monkey
$(printf %4s $((1930 + offset)))  8 7  P  TO  WTH    T  # The Pretty Owl Went To Hunt Turtles
$(printf %4s $((2130 + offset)))  9 8            C   F  # Cats
EOF
}

med "$@"
