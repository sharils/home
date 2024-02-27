#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

nightingale() {
  cat <<'EOF'
I solemnly pledge myself before God and in the presence of this assembly to pass my life in purity and to practice my profession faithfully.

I will abstain from whatever is deleterious and mischievous, and will not take or knowingly administer any harmful drug.

I will do all in my power to maintain and elevate the standard of my profession and will hold in confidence all personal matters committed to my keeping and all family affairs coming to my knowledge in the practice of my calling.

With loyalty will I aid the physician in his work, and as a missioner of health, I will dedicate myself to devoted service for human welfare.
EOF

  echo

  cat <<'EOF'
余謹以至誠

於上主及會眾面前宣誓，

終身純潔

忠貞職守

盡力提高護理專業標準，

勿為有損之事，

勿取服或故用有害之藥，

慎守病人及家務之祕密，

竭誠協助醫師之診治，

務謀病者之福利。
EOF
}

nightingale "$@"
