#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

kibble() {
  if [ $# -eq 0 ]; then
    cat <<'EOF'
Nutritional Assessment Factors  Feline Life Stage Factors
Neutered adults                 1.2–1.4
Intact adult                    1.4-1.6
Inactive/obese prone            1.0
Weight loss                     0.8
Gestation                       1.6–2.0
Lactation[1]                    2.0–6.0
Growth                          2.5

Kibble                          KCal/G
Hills’ C/D (low stress)         3.89

[1]: based on number of offspring and weeks of lactation

source https://www.aaha.org/globalassets/02-guidelines/2021-nutrition-and-weight-management/resourcepdfs/nutritiongl_box1.pdf
EOF
    return $?
  fi

  body_weight_kg="${1:?}"
  life_stage_factor="${2:?}"
  kibble_kcal_g="${3:-3.89}"

  # https://unix.stackexchange.com/a/420970
  bc --mathlib --expression="e(l($body_weight_kg) * 0.75) * 70 * $life_stage_factor / $kibble_kcal_g"
}

kibble "$@"
