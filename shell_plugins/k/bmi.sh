#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bmi() {
  cat <<'EOF'
Underweight (Severe thinness)    < 16.0
Underweight (Moderate thinness)  16.0 – 16.9
Underweight (Mild thinness)      17.0 – 18.4
Normal range                     18.5 – 24.9
Overweight (Pre-obese)           25.0 – 29.9
Obese (Class I)                  30.0 – 34.9
Obese (Class II)                 35.0 – 39.9
Obese (Class III)                ≥ 40.0
EOF
}

bmi "$@"
