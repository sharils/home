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
      set -- $((730 + offset)) "$@"
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
$(date +%k%M)  #  P  M   K    
$(printf %4s $((530 + offset)))  1         W      # Water
$(printf %4s $((730 + offset)))  2  P  T   WT CM  # Pigs Try Washing Tan Cat More
$(printf %4s $((930 + offset)))  3      O  W H    # Old Woman Happy
$(printf %4s $((1130 + offset)))  4     T   WT  M  # Two White Tiger Meow
$(printf %4s $((1330 + offset)))  5         W  CM  # Wolves Chase Mice
$(printf %4s $((1530 + offset)))  6     TO  WT  M  # Two Owls Want Talking Moon
$(printf %4s $((1730 + offset)))  7         W   M  # White Monkey
$(printf %4s $((1930 + offset)))  8  P  T   WTH    # Please Try With Tasty Honey
$(printf %4s $((2130 + offset)))  9      O     C   # Old Cow
EOF
}

med "$@"
