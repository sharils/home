#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dailies() {
  cat <<'EOF'
07:00 😻 💧 🪈 🪄 💊 🍽️ 🚰 🚽
12:00    💧 🪈    💊 🍽️      
14:30          🪄            
17:00    💧 🪈    💊 🍽️ 🚰 🚽
19:00 😻                     
22:00    💧 🪈 🪄 💊         
EOF
}

dailies "$@"
