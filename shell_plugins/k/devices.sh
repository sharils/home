#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

devices() {
  cat <<'EOF'
LG         WD-90MGA         DD直驅變頻滾筒洗衣機 白 / 9公斤洗衣容量
LG         AS551DWG0        PuriCare™ 360°空氣清淨機 - HEPA 13版/適用17坪 (單層)
Panasonic  NI-GHK045        2in1 蒸氣電熨斗
iRobot     Roomba 890       掃地機器人
3M         3M 90565-4DC-PS  耳罩
EOF
}

devices "$@"
