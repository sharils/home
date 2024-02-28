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
$(date +%k%M                   )  #    P  M    K      2  # Notes
$(printf %4s $(( 530 + offset)))  1            W      F  # Water
$(printf %4s $(( 730 + offset)))  2 1  P  T O  WT CM  T  # Pigs Try Out White Tail Could Meow
$(printf %4s $(( 930 + offset)))  3 2      U   W H    F  # Unicorns Will Help
$(printf %4s $((1130 + offset)))  4 3     T    WT  M  F  # Ten White Tiger Meow
$(printf %4s $((1330 + offset)))  5 4       O  W  CM  F  # Old Wolves Chase Moon
$(printf %4s $((1530 + offset)))  6 5     TU   WT  M  T  # To Understand We Teach Math
$(printf %4s $((1730 + offset)))  7 6          W   M  F  # Working Monkey
$(printf %4s $((1930 + offset)))  8 7  P  T O  WTH    T  # Pigs Trick Octopus With Tasty Honey
$(printf %4s $((2130 + offset)))  9 8      U      C   F  # Unicorn Charlie
EOF
}

med "$@"
