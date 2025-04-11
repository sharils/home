#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

distortion() {
  cat <<'EOF'
All-or-nothing thinking (全有或全無的想法)
Jumping to conclusions (妄下結論)
  Mind reading (讀心術)
  Fortune-telling (算命)
  Labeling (貼標籤和貼錯標籤)
Emotional reasoning (情緒化推理)
Should/shouldn't and must/mustn't statements (做出「必須」或「應該」的陳述)
Gratitude traps (感恩陷阱)
Personalization and blaming (個人化和歸責)
  Always being right (永遠正確)
  Fallacy of change (變化謬誤)
Minimizing-mislabeling (誇大和貼標籤)
  Magnification and minimization (誇大和最小化)
  Labeling and mislabeling (貼標籤和貼錯標籤)
Assuming the worst
  Overgeneralizing (過度概括)
  Disqualifying the positive (取消積極的資格)
  Mental filtering (過濾)

source https://en.wikipedia.org/wiki/Cognitive_distortion
EOF
}

distortion "$@"
