#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

distortion() {
  cat <<'EOF'
All-or-nothing thinking
Jumping to conclusions
  Mind reading
  Fortune-telling
  Labeling
Emotional reasoning
Should/shouldn't and must/mustn't statements
Gratitude traps
Personalization and blaming
  Always being right
  Fallacy of change
Minimizing-mislabeling
  Magnification and minimization
  Labeling and mislabeling
Assuming the worst
  Overgeneralizing
  Disqualifying the positive
  Mental filtering

source https://en.wikipedia.org/wiki/Cognitive_distortion
EOF
}

distortion "$@"
