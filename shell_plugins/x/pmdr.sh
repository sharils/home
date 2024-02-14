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
  min=$((short * SHORT_MIN + long * LONG_MIN))
  max=$((short * SHORT_MAX + long * LONG_MAX))

  cat <<EOF
til next  $next ($minutes)
pomodoro  $pomodoro
short     $short
long      $long
min       $min
max       $max
EOF
}

pmdr "$@"
