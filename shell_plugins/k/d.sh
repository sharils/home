#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dailies() {
  cat <<'EOF'
07:00 🥛 😿 💊 🍛 😻 🚰 🚽 🐤 💉 ☀️ 📧
08:40 🥛
10:20 🥛
12:00 🥛 😿    🍛
13:40 🥛
15:20 🥛
17:00 🥛 😿
18:00 🥛       🍛          🛒
19:00 🥛    💊    😻 🚰 🚽 🍽️ 🥣 👓
20:00 🥛
22:00    😿 💊             👁️ ⌚️
kkOF

  echo

  cat <<'EOF'
8x/day  🥛
QID     😿
TID     💊 🍛
BID     😻 🩹 🚰 🚽
QD      🐤 💉 ☀️ 📧
QN      🛒 🍽️ 🧪
HS      👁️
EOF

}

dailies "$@"
