#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_217() {
  day="${1:-$(date +%F)}"
  printf "D1\t%s\n" "$day"
  printf "Placebo\t%s\n" "$(date -jf%F -v+"$X_217_PLACEBO"d "$day" +%F)"
  printf "INC\t%s\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING))"d "$day" +%F)"
  printf "More\t%s\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_CYCLE_MORE))"d "$day" +%F)"
  printf "Less\t%s\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_217_PERIOD - X_217_LESS))"d "$day" +%F)"
  printf "Period\t%s\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_217_PERIOD))"d "$day" +%F)"
  printf "Cycle\t%s" "$(date -jf%F -v+"$X_217_CYCLE"d "$day" +%F)"
}

x_217 "$@"
