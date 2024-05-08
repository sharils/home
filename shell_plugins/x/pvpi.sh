#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pvpi() {
  printf 'bottle %sg; volume %sg; full %sg; pvpi %s; current total %sg; target total %sg' \
    "${X_PVPI_BOTTLE:?}" \
    "${X_PVPI_VOLUME:?}" \
    "$(bc --mathlib --expression="scale=2; $X_PVPI_BOTTLE + $X_PVPI_VOLUME")" \
    "0.1%" \
    "$1" \
    "$(bc --mathlib --expression="scale=2; $1 + ($X_PVPI_BOTTLE + $X_PVPI_VOLUME - $1) * 0.9")"
}

pvpi "$@"
