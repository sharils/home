#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_217() {
  day="${1:-$(date +%F)}"
  printf "%s D1 *prn #4MC7 +217\n" "$day"
  printf "%s Placebo *prn #VFP6 +217\n" "$(date -jf%F -v+"$X_217_PLACEBO"d "$day" +%F)"
  printf "%s INC *prn #6CG3 +217\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING))"d "$day" +%F)"
  printf "%s More *prn #2G5R +217\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_CYCLE_MORE))"d "$day" +%F)"
  printf "%s Less *prn #DF2Y +217\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_217_PERIOD - X_217_LESS))"d "$day" +%F)"
  printf "%s Period *prn #9RG9 +217\n" "$(date -jf%F -v+"$((X_217_PLACEBO + X_217_INCOMING + X_217_PERIOD))"d "$day" +%F)"
  printf "%s Cycle *prn #QXTW +217\n" "$(date -jf%F -v+"$X_217_CYCLE"d "$day" +%F)"
}

x_217 "$@"
