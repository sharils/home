#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

kibble() {
  if [ $# -eq 0 ]; then
    cat <<'EOF'
Nutritional Assessment Factors  Feline Life Stage Factors  No
Neutered adults                 1.2–1.4                    N
Intact adult                    1.4-1.6                    I
Inactive/obese prone            1.0                        O
Weight loss                     0.8                        W
Gestation                       1.6–2.0                    G
Lactation[1]                    2.0–6.0                    L
Growth                          2.5                        R

Kibble                          KCal/G
Royal Canin LP34                3.87
Hills’ C/D (low stress)         3.89

[1]: based on number of offspring and weeks of lactation

source https://www.aaha.org/globalassets/02-guidelines/2021-nutrition-and-weight-management/resourcepdfs/nutritiongl_box1.pdf

Changing kibbles requires three times the kibble of each kind.
Three is from x * (0.75 * 2 + 0.5 * 2 + 0.25 * 2).
Given 3.5, 4.3 and 5.9, 199.89 <= x <= 233.2.
i.e. 599.67 <= backup <= 699.6
EOF
    return $?
  fi

  body_weight_kg="${1:?}"
  life_stage_factor="${2:-N}"
  kibble_kcal_g="${3:-3.87}"

  case "$life_stage_factor" in
  N) life_stage_factor_min=1.2 && life_stage_factor_max=1.4 ;;
  I) life_stage_factor_min=1.4 && life_stage_factor_max=1.6 ;;
  O) life_stage_factor_min=1.0 && life_stage_factor_max=1.0 ;;
  W) life_stage_factor_min=0.8 && life_stage_factor_max=0.8 ;;
  G) life_stage_factor_min=1.6 && life_stage_factor_max=2.0 ;;
  L) life_stage_factor_min=2.0 && life_stage_factor_max=6.0 ;;
  R) life_stage_factor_min=2.5 && life_stage_factor_max=2.5 ;;
  esac

  if [ "$life_stage_factor_min" = "$life_stage_factor_max" ]; then
    # https://unix.stackexchange.com/a/420970
    printf "kibble = %sg (per day)" \
      "$(bc --mathlib --expression="scale=2; e(l($body_weight_kg) * 0.75) * 70 * $life_stage_factor_min / $kibble_kcal_g")"
  else
    printf "%sg <= kibble <= %sg (per day)" \
      "$(bc --mathlib --expression="scale=2; e(l($body_weight_kg) * 0.75) * 70 * $life_stage_factor_min / $kibble_kcal_g")" \
      "$(bc --mathlib --expression="scale=2; e(l($body_weight_kg) * 0.75) * 70 * $life_stage_factor_max / $kibble_kcal_g")"
  fi
}

kibble "$@"
