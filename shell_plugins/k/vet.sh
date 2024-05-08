#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

vet() {
  cat <<'EOF'
Being admitted to the profession of veterinary medicine, I solemnly swear to
use my scientific knowledge and skills for the benefit of society through the
protection of animal health and welfare, the prevention and relief of animal
suffering, the conservation of animal resources, the promotion of public
health, and the advancement of medical knowledge.

I will practice my profession conscientiously, with dignity, and in keeping
with the principles of veterinary medical ethics. I accept as a lifelong
obligation the continual improvement of my professional knowledge and
competence.

— AVMA
EOF

  echo

  cat <<'EOF'
As a member of the veterinary medical profession, I solemnly swear that I will
use my scientific knowledge and skills for the benefit of society.

I will strive to promote animal health and welfare, relieve animal suffering,
protect the health of the public and environment, and advance comparative
medical knowledge.

I will practise my profession conscientiously, with dignity, and in keeping
with the principles of veterinary medical ethics.

I will strive continuously to improve my professional knowledge and competence
and to maintain the highest professional and ethical standards for myself and
the profession.

— CVMA
EOF

  echo

  cat <<'EOF'
我被授與獸醫專業，在此慎重地宣誓—
我將善用所學知識與專業技能，
用於改善動物健康、提升動物福利、
促進公共衛生及發展醫療新知。
我宣誓：
我必盡力發揮中興獸醫之光榮文化及傳統。
我必本良心與尊嚴而行獸醫天職。
我必尊重動物生命。
我必遵守獸醫職業道德，
將不斷精進專業知識，
視為終身責任。
基於上述理念，
本人在此鄭重宣誓。

— 國立中興大學獸醫學系 獸醫師誓詞
EOF
}

vet "$@"
