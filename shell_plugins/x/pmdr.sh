#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pmdr() {
  LONG="${X_PMDR:-4}"
  LONG_MAX=30
  LONG_MIN=15
  POMODORO=25
  SHORT_MAX=5
  SHORT_MIN=3

  next=$(((POMODORO - $1 % POMODORO) % POMODORO))
  minutes=$(($1 + next))
  pomodoro=$(($1 / POMODORO))
  long=$((pomodoro / LONG))
  short=$((pomodoro - long))
  break_min=$((short * SHORT_MIN + long * LONG_MIN))
  break_max=$((short * SHORT_MAX + long * LONG_MAX))
  total_min=$(($1 + break_min))
  total_max=$(($1 + break_max))

  cat <<EOF
til next   $next ($minutes)
pomodoro   $pomodoro
short      $short
long       $long
break      ${break_min}—$break_max
total      ${total_min}—$total_max
EOF
}

pmdr "$@"
