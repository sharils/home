#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

welfare() {
  cat <<'EOF' | grep '.* hunger\|.* discomfort\|.* pain, injury or disease\|Freedom to express (most) normal behaviour\|.* fear and distress'
Freedom from hunger or thirst by ready access to fresh water and a diet to maintain full health and vigour
Freedom from discomfort by providing an appropriate environment including shelter and a comfortable resting area
Freedom from pain, injury or disease by prevention or rapid diagnosis and treatment
Freedom to express (most) normal behaviour by providing sufficient space, proper facilities and company of the animal's own kind
Freedom from fear and distress by ensuring conditions and treatment which avoid mental suffering
EOF
}

welfare "$@"
