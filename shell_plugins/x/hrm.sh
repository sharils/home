#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

hrm() {
  [ $# -eq 0 ] && set -- aerobic "$@"
  case "${1:-aerobic}" in
  hardcore) level=0.85 ;;
  aerobic) level=0.75 ;;
  weight) level=0.65 ;;
  warmup) level=0.55 ;;
  esac

  hrm="$(echo "(220 - ($(date +%Y) - ${X_HRM:?})) * $level" | bc --mathlib)"
  hrl="$(echo "$hrm - 5" | bc --mathlib)"
  hru="$(echo "$hrm + 5" | bc --mathlib)"
  printf 'level\t%s\n' "$1"
  printf '10s\t%.0f–%.0f\n' "$(echo "$hrl/6" | bc --mathlib)" "$(echo "$hru/6" | bc --mathlib)"
  printf '15s\t%.0f–%.0f\n' "$(echo "$hrl/4" | bc --mathlib)" "$(echo "$hru/4" | bc --mathlib)"
  printf '60s\t%.0f–%.0f\n' "$hrl" "$hru"
  printf 'weekly\t3d\n'
  printf 'time\t20m\n'
}

hrm "$@"
