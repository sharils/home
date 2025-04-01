#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

mbti() {
  cat <<'EOF' | grep -i "^\|${1:-^}"
INTJ Ni Te Fi Se Ne Ti Fe Si Analysts  Architect     2-4%  2.1%
INTP Ti Ne Si Fe Te Ni Se Fi Analysts  Logician      3-5%  3.3%
ENTJ Te Ni Se Fi Ti Ne Si Fe Analysts  Commander     2-5%  1.8%
ENTP Ne Ti Fe Si Ni Te Fi Se Analysts  Debater       2-5%  3.2%
INFJ Ni Fe Ti Se Ne Fi Te Si Diplomats Advocate      1-3%  1.5%
INFP Fi Ne Si Te Fe Ni Se Ti Diplomats Mediator      4-5%  4.4%
ENFJ Fe Ni Se Ti Fi Ne Si Te Diplomats Protagonist   2-5%  2.4%
ENFP Ne Fi Te Si Ni Fe Ti Se Diplomats Campaigner    6-8%  8.1%
ISTJ Si Te Fi Ne Se Ti Fe Ni Sentinels Logistician 11-14% 11.6%
ISFJ Si Fe Ti Ne Se Fi Te Ni Sentinels Defender     9-14% 13.8%
ESTJ Te Si Ne Fi Ti Se Ni Fe Sentinels Executive    8-12%  8.7%
ESFJ Fe Si Ne Ti Fi Se Ni Te Sentinels Consul       9-13% 12.3%
ISTP Ti Se Ni Fe Te Si Ne Fi Explorers Virtuoso      4-6%  5.4%
ISFP Fi Se Ni Te Fe Si Ne Ti Explorers Adventurer    5-9%  8.8%
ESTP Se Ti Fe Ni Si Te Fi Ne Explorers Entrepreneur  4-5%  4.3%
ESFP Se Fi Te Ni Si Fe Ti Ne Explorers Entertainer   4-9%  8.5%
EOF
}

mbti "$@"
