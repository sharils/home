#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

horoscope() {
  printf '☉ ☽ ☿ ♀︎ ♂︎ ♃ ♄ ⛢ ♆ ♇ ☊\n%s' "$K_HOROSCOPE"

  echo
  echo

  cat <<'EOF'
♈ AR ♉ TA ♊ GE ♋ CN ♌ LE ♍ VI ♎ LI ♏ SC ♐ SG ♑ CP ♒ AQ ♓ PI
03-21 04-20 05-21 06-21 07-23 08-23 09-23 10-23 11-22 12-22 01-20 02-19
EOF
}

horoscope "$@"
