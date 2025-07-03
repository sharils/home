#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cycle() {
  day="${1:-$(date +%F)}"
  printf "D1\t%s\n" "$day"
  printf "More\t%s\n" "$(date -jf%F -v+"$((X_CYCLE_MORE))"d "$day" +%F)"
  printf "Less\t%s\n" "$(date -jf%F -v+"$((X_CYCLE_PERIOD - X_CYCLE_LESS - 1))"d "$day" +%F)"
  printf "Period\t%s\n" "$(date -jf%F -v+"$((X_CYCLE_PERIOD - 1))"d "$day" +%F)"
  printf "Cycle\t%s" "$(date -jf%F -v+"$X_CYCLE_CYCLE"d "$day" +%F)"
}

cycle "$@"
