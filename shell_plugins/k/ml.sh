#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ml() {
  cat <<'EOF'
Magnitude  Description  Mercalli intensity  Average frequency of occurrence globally (estimated)
1.0–1.9    Micro        I                   Continual/several million per year
2.0–2.9    Minor        I                   Over one million per year
3.0–3.9    Slight       II to III           Over 100,000 per year
4.0–4.9    Light        IV to V             10,000 to 15,000 per year
5.0–5.9    Moderate     VI to VII           1,000 to 1,500 per year
6.0–6.9    Strong       VII to IX           100 to 150 per year
7.0–7.9    Major        VIII or higher      10 to 20 per year
8.0–8.9    Great                            One per year
9.0–9.9    Extreme                          One to three per century

https://en.wikipedia.org/wiki/Richter_scale#Richter_magnitudes
EOF
}

ml "$@"
