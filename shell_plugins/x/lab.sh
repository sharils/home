#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

lab() {
  l="$(perl -e "printf('%.0f', $1)")"
  a="$(perl -e "printf('%.0f', $2)")"
  b="$(perl -e "printf('%.0f', $3)")"
  c="$(perl -e "printf('%.0f', sqrt($2^2 + $3^2))")"

  if [ "$l" -ge 59 ] && [ "$l" -le 95 ]; then
    echo "L (59, 95) $l OK"
  else
    echo "L (59, 95) $l NG"
  fi

  if [ "$a" -ge -5 ] && [ "$a" -le 15 ]; then
    echo "a (-5, 15) $a OK"
  else
    echo "a (-5, 15) $a NG"
  fi

  if [ "$b" -ge -20 ] && [ "$b" -le 5 ]; then
    echo "b (-20, 5) $b OK"
  else
    echo "b (-20, 5) $b NG"
  fi

  if [ "$c" -ge 5 ] && [ "$c" -le 35 ]; then
    echo "C (5, 35) $c OK"
  else
    echo "C (5, 35) $c NG"
  fi
}

lab "$@"
